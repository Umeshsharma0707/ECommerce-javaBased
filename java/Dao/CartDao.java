package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import Modal.Cart;

public class CartDao {
	public static void Insertcart(Cart c) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "insert into cart(cusid,pid,sid,pbrands,pcategory,ptype,pprice,pqty,total,payment_status) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, c.getCusid());
			pst.setInt(2, c.getPid());
			pst.setInt(3, c.getSid());
			pst.setString(4, c.getPbrands());
			pst.setString(5, c.getPcategory());
			pst.setString(6, c.getPtype());
			pst.setInt(7, c.getPprice());
			pst.setInt(8, c.getPqty());
			pst.setInt(9, c.getTotal());
			pst.setString(10, c.getPayment_status());
			pst.executeUpdate();
			System.out.println("data inserted");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void updatecart(Cart c) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "update cart set pqty=?,total=? where cid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, c.getPqty());
			pst.setInt(2, c.getTotal());
			pst.setInt(3, c.getCid());
			pst.executeUpdate();
			System.out.println("data inserted");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	
	public static List<Cart> GetProductByCUSid(int cid) {
		List<Cart> list = new ArrayList<Cart>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from cart where cusid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Cart c = new Cart();
				c.setCid(rs.getInt("cid"));
				c.setCusid(rs.getInt("cusid"));
				c.setPid(rs.getInt("pid"));
				c.setSid(rs.getInt("sid"));
				c.setPbrands(rs.getString("pbrands"));
				c.setPcategory(rs.getString("pcategory"));
				c.setPtype(rs.getString("ptype"));
				c.setPprice(rs.getInt("pprice"));
				c.setPqty(rs.getInt("pqty"));
				c.setTotal(rs.getInt("total"));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static Cart GetCartByCid(int cid) {
		Cart c = null;
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from cart where cid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt("cid"));
				c.setCusid(rs.getInt("cusid"));
				c.setPid(rs.getInt("pid"));
				c.setSid(rs.getInt("sid"));
				c.setPbrands(rs.getString("pbrands"));
				c.setPcategory(rs.getString("pcategory"));
				c.setPtype(rs.getString("ptype"));
				c.setPprice(rs.getInt("pprice"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	public static void deleteProduct(int cid) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "delete from cart where cid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			pst.executeUpdate();
			System.out.println("data deleted");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
