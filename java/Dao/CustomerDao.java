 package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import Modal.Customer;


public class CustomerDao {
	public static void insertCustomer(Customer c) {
		try {
				Connection conn = DBConnection.createConnection();
				String sql = "insert into customer(fname,lname,contact,email,address,password,gender) values(?,?,?,?,?,?,?)";
				PreparedStatement pst =conn.prepareStatement(sql);
				pst.setString(1, c.getFname());
				pst.setString(2, c.getLname());
				pst.setLong(3, c.getContact());
				pst.setString(4, c.getEmail());
				pst.setString(5, c.getAddress());
				pst.setString(6, c.getPassword());
				pst.setString(7, c.getGender());
				pst.executeUpdate();
				System.out.println("data inserted");
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Customer checkCustomerLogin(Customer c) {
		Customer c1 = null;
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from  customer where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getEmail());
			pst.setString(2, c.getPassword());
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				c1 = new Customer();
				c1.setId(rs.getInt("id"));
				c1.setFname(rs.getString("fname"));
				c1.setLname(rs.getString("lname"));
				c1.setContact(rs.getLong("contact"));
				c1.setEmail(rs.getString("email"));
				c1.setAddress(rs.getString("address"));
				c1.setPassword(rs.getString("password"));
				c1.setGender(rs.getString("gender"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c1;
	}
	public static List<Customer> getAllCustomer(){
		List<Customer> lsit = new ArrayList<Customer>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from customer";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Customer c1 = new Customer();
				c1.setId(rs.getInt("id"));
				c1.setFname(rs.getString("fname"));
				c1.setLname(rs.getString("lname"));
				c1.setContact(rs.getLong("contact"));
				c1.setEmail(rs.getString("email"));
				c1.setAddress(rs.getString("address"));
				c1.setPassword(rs.getString("password"));
				c1.setGender(rs.getString("gender"));
				lsit.add(c1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lsit;
	}
	public static Customer UpdateCustomerProfile(Customer c) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "update  customer set fname=?, lname=?, contact=?, email=?, address=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1, c.getFname());
			pst.setString(2, c.getLname());
			pst.setLong(3, c.getContact());
			pst.setString(4, c.getEmail());
			pst.setString(5, c.getAddress());
			pst.setInt(6, c.getId());
			System.out.println("profile update");
			
			pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	public static boolean checkOldPassword(int id, String op) {
		boolean flag = false;
		try {
			Connection conn = DBConnection.createConnection();
			String sql="select * from customer where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, op);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
		
	}
	public static void UpadtePassword(String np , int id) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql="update customer set password=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, np);
			pst.setInt(2, id);
			pst.executeUpdate();
			System.out.println("password updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static boolean Checkemail(String email) {
		boolean flag = false;
		try {
			Connection conn = DBConnection.createConnection();
			String sql="select * from customer where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static void newPassword(String np,String email) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql="update customer set password=? where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, np);
			pst.setString(2, email);
			System.out.println(np+email);
			pst.executeUpdate();
			System.out.println("password changed");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
