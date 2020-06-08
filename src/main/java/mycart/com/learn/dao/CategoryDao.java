package mycart.com.learn.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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

	// fetch categories
	public List<Category> getCategories() {
		Session session = this.factory.openSession();
		Query listQuery = session.createQuery("from Category");
		List<Category> listCategories = listQuery.list();
		return listCategories;
	}

	// fetch single category
	public Category getCategoryById(int id) {
		Category cat = null;
		try {
			Session session = this.factory.openSession();
			cat = session.get(Category.class, id);

			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("DONE");
		}

		return cat;

	}

}
