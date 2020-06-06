package mycart.com.learn.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import mycart.com.learn.entities.User;
import mycart.com.learn.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {
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
			// out.println("Register Servlet");
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");

			// Validations...
			if (userName.isEmpty()) {
				out.println("Name cannot be empty");
				return;
			}

			// Creating user object to store data....
			User user = new User(userName, userEmail, userPassword, userPhone, "default.jsp", userAddress, "normal");

			Session hibernateSession = FactoryProvider.getFactory().openSession();
			Transaction tx = hibernateSession.beginTransaction();

			int userId = (int) hibernateSession.save(user);

			tx.commit();

			hibernateSession.close();

			out.println("This user has been registered successfully..");
			out.println("<br> User id is " + userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
