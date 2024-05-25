package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import Modal.Customer;
import Modal.Product;

public class ProductDao {
	public static void InsertProduct(Product p) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "insert into product(sid,image,pbrands,pcategory,ptype,pprice) values(?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, p.getSid());
			pst.setString(2, p.getImage());
			pst.setString(3, p.getPbrands());
			pst.setString(4, p.getPcategory());
			pst.setString(5, p.getPtype());
			pst.setDouble(6, p.getPprice());
			pst.executeUpdate();
			System.out.println("data inserted");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<Product> getAllCustomer(){
		List<Product> lsit3 = new ArrayList<Product>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from product";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Product p = new Product();
				p.setPid(rs.getInt("id"));
				p.setSid(rs.getInt("sid"));
				p.setImage(rs.getString("image"));
				p.setPbrands(rs.getString("pbrands"));
				p.setPcategory(rs.getString("pcategory"));
				p.setPtype(rs.getString("ptype"));
				p.setPprice(rs.getDouble("pprice"));
				lsit3.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lsit3;
	}

	public static List<Product> GetProductBySid(int id) {
		List<Product> list = new ArrayList<Product>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from product where sid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setPid(rs.getInt("id"));
				p.setSid(rs.getInt("sid"));
				p.setImage(rs.getString("image"));
				p.setPbrands(rs.getString("pbrands"));
				p.setPcategory(rs.getString("pcategory"));
				p.setPtype(rs.getString("ptype"));
				p.setPprice(rs.getDouble("pprice"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Product> getAllproductOfMen() {
		List<Product> list = new ArrayList<Product>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from product where pcategory='men'";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setPid(rs.getInt("id"));
				p.setSid(rs.getInt("sid"));
				p.setImage(rs.getString("image"));
				p.setPbrands(rs.getString("pbrands"));
				p.setPcategory(rs.getString("pcategory"));
				p.setPtype(rs.getString("ptype"));
				p.setPprice(rs.getDouble("pprice"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Product> getAllproductOfWomen() {
		List<Product> list = new ArrayList<Product>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from product where pcategory='women'";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setPid(rs.getInt("id"));
				p.setSid(rs.getInt("sid"));
				p.setImage(rs.getString("image"));
				p.setPbrands(rs.getString("pbrands"));
				p.setPcategory(rs.getString("pcategory"));
				p.setPtype(rs.getString("ptype"));
				p.setPprice(rs.getDouble("pprice"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Product> getAllproductOfKids() {
		List<Product> list = new ArrayList<Product>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from product where pcategory='kids'";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setPid(rs.getInt("id"));
				p.setSid(rs.getInt("sid"));
				p.setImage(rs.getString("image"));
				p.setPbrands(rs.getString("pbrands"));
				p.setPcategory(rs.getString("pcategory"));
				p.setPtype(rs.getString("ptype"));
				p.setPprice(rs.getDouble("pprice"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static Product getDataByID(int id) {
		Product p1 = null;
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from product where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				p1 = new Product();
				p1.setPid(rs.getInt("id"));
				p1.setSid(rs.getInt("sid"));
				p1.setImage(rs.getString("image"));
				p1.setPbrands(rs.getString("pbrands"));
				p1.setPcategory(rs.getString("pcategory"));
				p1.setPtype(rs.getString("ptype"));
				p1.setPprice(rs.getDouble("pprice"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p1;
	}

	public static Product UpdateProductProfile(Product p) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "update  product set  sid=?,image=?, pbrands=?, pcategory=?, ptype=?, pprice=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, p.getSid());
			pst.setString(2, p.getImage());
			pst.setString(3, p.getPbrands());
			pst.setString(4, p.getPcategory());
			pst.setString(5, p.getPtype());
			pst.setDouble(6, p.getPprice());
			pst.setInt(7, p.getPid());
			System.out.println("profile update");

			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	public static void deleteProduct(int id) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "delete from product where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			System.out.println("data deleted");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static List<Product> getProductAll() {
		List<Product> list = new ArrayList<Product>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from product";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setPid(rs.getInt("id"));
				p.setSid(rs.getInt("sid"));
				p.setImage(rs.getString("image"));
				p.setPbrands(rs.getString("pbrands"));
				p.setPcategory(rs.getString("pcategory"));
				p.setPtype(rs.getString("ptype"));
				p.setPprice(rs.getDouble("pprice"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
