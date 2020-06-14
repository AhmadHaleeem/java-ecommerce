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

}
