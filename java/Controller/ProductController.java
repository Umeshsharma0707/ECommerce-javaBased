package Controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Dao.ProductDao;
import Modal.Product;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/ProductController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024
		* 512)
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private String extractfilename(Part file) {
		String cd = file.getHeader("content-disposition");
		System.out.println(cd);
		String[] items = cd.split(";");
		for (String string : items) {
			if (string.trim().startsWith("filename")) {
				return string.substring(string.indexOf("=") + 2, string.length() - 1);
			}
		}
		return "";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("upload product")) {

			String savePath = "C:\\Users\\Aman\\eclipse-workspace\\ClgProject\\src\\main\\webapp\\img";
			File fileSaveDir = new File(savePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("image");
			String fileName = extractfilename(file1);
			file1.write(savePath + File.separator + fileName);
			String filePath = savePath + File.separator + fileName;

			String savePath2 = "C:\\Users\\Aman\\eclipse-workspace\\ClgProject\\src\\main\\webapp\\img";
			File imgSaveDir = new File(savePath2);
			if (!imgSaveDir.exists()) {
				imgSaveDir.mkdir();
			}
			Product p = new Product();
			p.setSid(Integer.parseInt(request.getParameter("sid")));
			p.setImage(fileName);
			p.setPbrands(request.getParameter("pbrands"));
			p.setPcategory(request.getParameter("pcategory"));
			p.setPtype(request.getParameter("ptype"));
			p.setPprice(Double.parseDouble(request.getParameter("pprice")));
			ProductDao.InsertProduct(p);
			response.sendRedirect("seller-index.jsp");

		} else if (action.equalsIgnoreCase("edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Product p = ProductDao.getDataByID(id);
			request.setAttribute("Data", p);
			request.getRequestDispatcher("product-edit.jsp").forward(request, response);
		}

		else if (action.equalsIgnoreCase("Update")) {
			Product p = new Product();
			p.setPid(Integer.parseInt(request.getParameter("id")));
			p.setSid(Integer.parseInt(request.getParameter("sid")));
			p.setImage(request.getParameter("image"));
			p.setPbrands(request.getParameter("pbrands"));
			p.setPcategory(request.getParameter("pcategory"));
			p.setPtype(request.getParameter("ptype"));
			p.setPprice(Double.parseDouble(request.getParameter("pprice")));

		}

		else if (action.equalsIgnoreCase("remove product")) {
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(action + id);
			ProductDao.deleteProduct(id);
			response.sendRedirect("manage-product.jsp");
		}

	}

}
