package mycart.com.learn.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
		}finally {
			System.out.println("DONE");
		}

		return f;
	}

}
