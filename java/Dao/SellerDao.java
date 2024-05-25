package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import Modal.Customer;
import Modal.Seller;


public class SellerDao {
	public static void InsertSeller(Seller s) {
		try {
				Connection conn = DBConnection.createConnection();
				String sql = "insert into seller(fname,lname,contact,email,address,password,gender) values(?,?,?,?,?,?,?)";
				PreparedStatement pst =conn.prepareStatement(sql);
				pst.setString(1, s.getFname());
				pst.setString(2, s.getLname());
				pst.setLong(3, s.getContact());
				pst.setString(4, s.getEmail());
				pst.setString(5, s.getAddress());
				pst.setString(6, s.getPassword());
				pst.setString(7, s.getGender());
				pst.executeUpdate();
				System.out.println("data inserted");
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Seller CheckSellerLogin(Seller s) {
		Seller s1 = null;
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from  seller where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, s.getEmail());
			pst.setString(2, s.getPassword());
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				s1 = new Seller();
				s1.setId(rs.getInt("id"));
				s1.setFname(rs.getString("fname"));
				s1.setLname(rs.getString("lname"));
				s1.setContact(rs.getLong("contact"));
				s1.setEmail(rs.getString("email"));
				s1.setAddress(rs.getString("address"));
				s1.setPassword(rs.getString("password"));
				s1.setGender(rs.getString("gender"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s1;
	}
	public static List<Seller> getAllSeller(){
		List<Seller> list2 = new ArrayList<Seller>();
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
				list2.add(s1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list2;
	}
	public static Seller UpdateSellerProfile(Seller s) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "update  seller set fname=?, lname=?, contact=?, email=?, address=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, s.getFname());
			pst.setString(2, s.getLname());
			pst.setLong(3, s.getContact());
			pst.setString(4, s.getEmail());
			pst.setString(5, s.getAddress());
			pst.setInt(6, s.getId());
			System.out.println("profile Update");
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
		
	}
	public static boolean CheckOldPassword(int id , String op) {
		boolean flag = false;
		try {
			Connection conn = DBConnection.createConnection();
			String sql="select * from seller where id=? and password=?";
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
	public static void UpdatePassword(String np , int id) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql="update seller set password=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, np);
			pst.setInt(2, id);
			pst.executeUpdate();
			System.out.println("password Update");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static boolean CheckEmail(String email) {
		boolean flag = false;
		try {
			Connection conn = DBConnection.createConnection();
			String sql="select * from seller where email=?";
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
	public static void NewPassword(String np , String email) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql="update seller set password=? where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, np);
			pst.setString(2, email);
			System.out.println(np+email);
			pst.executeUpdate();
			System.out.println("Password Chenged");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
