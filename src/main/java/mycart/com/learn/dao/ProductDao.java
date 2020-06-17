package mycart.com.learn.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import mycart.com.learn.entities.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	// save product into db
	public boolean saveProduct(Product product) {
		boolean f = false;
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			session.save(product);

			tx.commit();
			session.close();

			f = true;
		} catch (Exception e) {
			e.printStackTrace();
			f = false;
		} finally {
			System.out.println("DONE");
		}

		return f;
	}

	// fetch all products
	public List<Product> getAllProducts() {
		Session session = this.factory.openSession();
		Query<Product> query = session.createQuery("from Product");
		List<Product> list = query.list();

		session.close();
		return list;
	}

	// fetch all products by categroy id
	public List<Product> getProductsByCategoryId(int categoryId) {
		Session session = this.factory.openSession();
		Query<Product> query = session.createQuery("from Product as p where p.category.categoryId =: id");
		query.setParameter("id", categoryId);

		List<Product> list = query.list();

		session.close();
		return list;
	}

	// fetch single product
	public Product getProductById(int id) {
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Product as p where p.pId =: id");
		query.setParameter("id", id);
		Product product = (Product) query.list().get(0);

		session.close();
		return product;
	}
	
	// update product by id
	public boolean updateProduct(int id, Product product) {
		boolean f = false;
		
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			
			Product oldProduct = session.get(Product.class, id);
			oldProduct.setpName(product.getpName());
			oldProduct.setpDesc(product.getpDesc());
			oldProduct.setpPrice(product.getpPrice());
			oldProduct.setpDiscount(product.getpDiscount());
			oldProduct.setpQuantity(product.getpQuantity());
			oldProduct.setCategory(product.getCategory());
			oldProduct.setpPhoto(product.getpPhoto());
		
			session.update(oldProduct);
			f = true;
			
			tx.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			f = false;
		}
		
		return f;
	}
	
	// delete product by id
	public boolean deleteProduct(int id) {
		boolean f = false;
		
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			
			Product product = new Product();
			product.setpId(id);
			
			session.delete(product);
			
			tx.commit();
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			f = false;
		}
		return f;
	}
}
