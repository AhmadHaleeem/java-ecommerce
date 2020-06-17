package mycart.com.learn.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import mycart.com.learn.dao.CategoryDao;
import mycart.com.learn.dao.ProductDao;
import mycart.com.learn.entities.Category;
import mycart.com.learn.entities.Product;
import mycart.com.learn.helper.FactoryProvider;
import mycart.com.learn.helper.Helper;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
		
		try (PrintWriter out = response.getWriter()) {
			HttpSession session = request.getSession();
			String op = request.getParameter("operation");

			if (op.trim().equals("addCategory")) {
				// add category
				String catTitle = request.getParameter("catTitle");
				String catDescription = request.getParameter("catDescription");

				Category category = new Category();
				category.setCategoryTitle(catTitle);
				category.setCategoryDescription(catDescription);

				// category database save..
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int saveCategory = categoryDao.saveCategory(category);
				// out.println("Category added successfully..");
				session.setAttribute("message", "Category added successfully..");
				response.sendRedirect("admin.jsp");
				return;

			} else if (op.trim().equals("addProduct")) {
				// add product
				String productName = request.getParameter("pName");
				String productDescription = request.getParameter("pDescription");
				int productPrice = Integer.parseInt(request.getParameter("pPrice"));
				int productDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int productQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int categoryId = Integer.parseInt(request.getParameter("catId"));
				Part part = request.getPart("pPic");

				Product product = new Product();
				product.setpName(productName);
				product.setpDesc(productDescription);
				product.setpPrice(productPrice);
				product.setpDiscount(productDiscount);
				product.setpQuantity(productQuantity);
				product.setpPhoto(part.getSubmittedFileName());

				
				Category categoryById = catDao.getCategoryById(categoryId);

				product.setCategory(categoryById);

				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
				// upload product picture
				String path = request.getRealPath("img") + File.separator + "products" + File.separator
						+ part.getSubmittedFileName();
				// System.out.println(path);

				try {
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = part.getInputStream();
					// reading data
					byte[] data = new byte[is.available()];
					is.read(data);
					// writing data
					fos.write(data);
					fos.close();

					productDao.saveProduct(product);

					session.setAttribute("message", "Product added successfully..");
					response.sendRedirect("admin.jsp");
					return;
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else if (op.trim().equals("updateProduct")) {
				int productId = Integer.parseInt(request.getParameter("productId"));
				String productName = request.getParameter("pName");
				String productDescription = request.getParameter("pDescription");
				int productPrice = Integer.parseInt(request.getParameter("pPrice"));
				int productDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int productQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int categoryId = Integer.parseInt(request.getParameter("catId"));
				
				Product product = new Product();
				product.setpName(productName);
				product.setpDesc(productDescription);
				product.setpPrice(productPrice);
				product.setpDiscount(productDiscount);
				product.setpQuantity(productQuantity);
				Part part = request.getPart("pPic");
				String submittedFileName = part.getSubmittedFileName();
				
				String oldFile = product.getpPhoto();
				product.setpPhoto(submittedFileName);
				
				Category categoryById = catDao.getCategoryById(categoryId);
				product.setCategory(categoryById);
				
				// UPDATE PRODUCT DATA
				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
				
				String path = request.getRealPath("img") + File.separator + "products" + File.separator
						+ part.getSubmittedFileName();
				try {
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = part.getInputStream();
					// reading data
					byte[] data = new byte[is.available()];
					is.read(data);
					// writing data
					fos.write(data);
					fos.close();

					Helper.deleteFile(oldFile);
					productDao.updateProduct(productId, product);

					session.setAttribute("message", "Product updated successfully..");
					response.sendRedirect("view_products.jsp");
					return;
				} catch (Exception e) {
					e.printStackTrace();
				}
			
			} else if (op.trim().equals("deleteProduct")) {
				int productId = Integer.parseInt(request.getParameter("deletedProduct"));
				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
				
				productDao.deleteProduct(productId);
				session.setAttribute("message", "Product deleted successfully..");
				response.sendRedirect("view_products.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("DONE");
		}
	}

}
