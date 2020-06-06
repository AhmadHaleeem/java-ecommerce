package mycart.com.learn.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import mycart.com.learn.dao.UserDao;
import mycart.com.learn.entities.User;
import mycart.com.learn.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
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
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");

			// validations...
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndPassword(userEmail, userPassword);
			// System.out.println(user);

			HttpSession session = request.getSession();
			if (user == null) {
				// out.println("<h1>Invalid details</h1>");
				session.setAttribute("err-message", "Invalid details!! try with another one");
				response.sendRedirect("login.jsp");
			} else {
				// out.println("<h1>Welcome " + user.getUserName() + " </h1>");
				session.setAttribute("message", "Welcome " + user.getUserName());

				session.setAttribute("current-user", user);
				if (user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				} else if (user.getUserType().equals("normal")) {
					response.sendRedirect("normal.jsp");
				} else {
					//out.println("We have not identified user type ");
					session.setAttribute("err-message", "We have not identified user type");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
