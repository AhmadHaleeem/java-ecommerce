package mycart.com.learn.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mycart.com.learn.dao.CategoryDao;
import mycart.com.learn.entities.Category;
import mycart.com.learn.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
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
				//out.println("Category added successfully..");
				session.setAttribute("message", "Category added successfully..");
				response.sendRedirect("admin.jsp");
				return;
				
				
			} else if (op.trim().equals("addProduct")) {
				// add product

			}

			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
