package Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import Modal.Admin;
import Modal.Customer;
import Modal.Product;
import Modal.Seller;

public class AdminDao {
	public static Admin checkAdminLogin(Admin a) {
		Admin a1 = null;
		try {
			Connection conn = DBConnection.createConnection();
			String sql="select * from admin where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, a.getEmail());
			pst.setString(2, a.getPassword());
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				a1 = new Admin();
				a1.setEmail(rs.getString("email"));
				a1.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a1;
	}
	public static List<Seller> getAllSeller(){
		List<Seller> list = new ArrayList<Seller>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from seller";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Seller s1 = new Seller();
				s1.setId(rs.getInt("id"));
				s1.setFname(rs.getString("fname"));
				s1.setLname(rs.getString("lname"));
				s1.setContact(rs.getLong("contact"));
				s1.setEmail(rs.getString("email"));
				s1.setAddress(rs.getString("address"));
				s1.setPassword(rs.getString("password"));
				s1.setGender(rs.getString("gender"));
				list.add(s1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		 	}
		return list;
	}
	public static void updateSellerProfile(Seller s) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "update seller set fname=?, lname=?, email=?, contact=?, address=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, s.getFname());
			pst.setString(2, s.getLname());
			pst.setString(3, s.getEmail());
			pst.setLong(4, s.getContact());
			pst.setString(5, s.getAddress());
			pst.setInt(6, s.getId());
			pst.executeUpdate();
			System.out.println("profile updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<Customer> getAllCustomer(){
		List<Customer> list = new ArrayList<Customer>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from customer";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Customer c = new Customer();
				c.setId(rs.getInt("id"));
				c.setFname(rs.getString("fname"));
				c.setLname(rs.getString("lname"));
				c.setContact(rs.getLong("contact"));
				c.setEmail(rs.getString("email"));
				c.setAddress(rs.getString("address"));
				c.setPassword(rs.getString("password"));
				c.setGender(rs.getString("gender"));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static void removeCustomer(int id) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "delete from customer where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			System.out.println("Customer removed");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void removeseller(int id) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "delete from seller where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			System.out.println("seller removed");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void updateCustomerProfile(Customer c) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "update customer set fname=?, lname=?, email=?, contact=?, address=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getFname());
			pst.setString(2, c.getLname());
			pst.setString(3, c.getEmail());
			pst.setLong(4, c.getContact());
			pst.setString(5, c.getAddress());
			pst.setInt(6, c.getId());
			pst.executeUpdate();
			System.out.println("profile updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<Product> getAllProduct(){
		List<Product> list = new ArrayList<Product>();
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
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static void removeProduct(int id) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "delete from product where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			System.out.println("Product removed");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<Product> getProductBySid(int id){
		List<Product> list2 = new ArrayList<Product>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from product where sid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
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
				list2.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list2;
	}
}