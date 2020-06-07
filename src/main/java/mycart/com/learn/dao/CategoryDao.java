package mycart.com.learn.dao;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import mycart.com.learn.entities.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}

	// add category to db
	public int saveCategory(Category category) {
		Session session = this.factory.openSession();

		Transaction tx = session.beginTransaction();
		int catId = (int) session.save(category);

		tx.commit();
		session.close();

		return catId;

	}

}
