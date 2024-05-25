package Controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CartDao;
import Dao.ProductDao;
import Modal.Cart;
import Modal.Product;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("add to cart")) {
			Cart c = new Cart();
			c.setCusid(Integer.parseInt(request.getParameter("cusid")));
			c.setPid(Integer.parseInt(request.getParameter("pid")));
			c.setSid(Integer.parseInt(request.getParameter("sid"))); 
			c.setPbrands(request.getParameter("pbrands"));
			c.setPcategory(request.getParameter("pcategory"));
			c.setPtype(request.getParameter("ptype"));
			c.setPqty(1);
			Product p = ProductDao.getDataByID(Integer.parseInt(request.getParameter("pid")));
			System.out.println(p.getPprice());
			c.setPprice((int)p.getPprice());
			c.setTotal((int)p.getPprice());
			System.out.println((int)p.getPprice());
			c.setPayment_status("pending");
			System.out.println(c);
			CartDao.Insertcart(c);
			response.sendRedirect("customer-cart.jsp");
	     }
		else if(action.equalsIgnoreCase("remove product")){
				int cid = Integer.parseInt(request.getParameter("cid"));
				System.out.println(action + cid);
				CartDao.deleteProduct(cid);
				response.sendRedirect("customer-cart.jsp");
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int cid = Integer.parseInt(request.getParameter("cid"));
			int qty = Integer.parseInt(request.getParameter("pqty"));
			
			Cart c = CartDao.GetCartByCid(cid);
			int total = c.getPprice()*qty;
			c.setPqty(qty);
			c.setTotal(total);
			c.setCid(cid);
			CartDao.updatecart(c);
			response.sendRedirect("customer-cart.jsp");
		//		String action = request.getParameter("action");
//		 if(action.equalsIgnoreCase("remove product")){
//			int cid = Integer.parseInt(request.getParameter("cid"));
//			System.out.println(action + cid);
//			CartDao.deleteProduct(cid);
//			response.sendRedirect("customer-cart.jsp");
//		}

    }
}
