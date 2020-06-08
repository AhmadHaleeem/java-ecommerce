package mycart.com.learn.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import mycart.com.learn.entities.User;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}

	// get user by email and password
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		try {
			String query = "from User where userEmail =: e and userPassword =: p";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);

			user = (User) q.uniqueResult();
			session.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			System.out.println("DONE");
		}

		return user;
	}
}
