package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AdminDao;
import Modal.Admin;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
		if(action.equalsIgnoreCase("login")) {
			Admin a = new Admin();
			a.setEmail(request.getParameter("email"));
			a.setPassword(request.getParameter("password"));
			Admin a1 = AdminDao.checkAdminLogin(a);
			if(a1==null) {
				request.setAttribute("msg", "email or passwoprd is incorrect");
				request.getRequestDispatcher("admin-login.jsp").forward(request, response);
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("data", a1);
				request.getRequestDispatcher("admin-index.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("remove")){
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(action + id);
			AdminDao.removeseller(id);
			response.sendRedirect("admin-seller.jsp");
		}
		else if(action.equalsIgnoreCase("removee")){
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(action + id);
			AdminDao.removeCustomer(id);
			response.sendRedirect("admin-customer.jsp");
		}
		else if(action.equalsIgnoreCase("removeee")){
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(action + id);
			AdminDao.removeProduct(id);
			response.sendRedirect("admin-product.jsp");
		}
	}
}
