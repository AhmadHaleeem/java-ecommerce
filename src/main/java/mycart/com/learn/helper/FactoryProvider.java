package mycart.com.learn.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	private static SessionFactory factory;

	public static SessionFactory getFactory() {
		try {
			if (factory == null) {
				factory = new Configuration().configure().buildSessionFactory();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return factory;
	}
}
