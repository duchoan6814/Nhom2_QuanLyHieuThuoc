package control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.ComboBoxModel;
import javax.swing.DefaultComboBoxModel;

import entity.Thuoc;

public class DAOThuoc extends DAO {
	public Vector getIdThuoc(String maThuoc) {
		System.out.println("aaa");
		Vector listModel = new Vector();
		String sql = "select MaThuoc from Thuoc where MaThuoc like '" + maThuoc + "%'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				listModel.add(rs.getString("MaThuoc"));
			}
			return listModel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public Thuoc getThuocBan(String maThuoc) {
		Thuoc a = new Thuoc();
		String sql = "select TenThuoc, DonViTinh, GiaThuoc from Thuoc where MaThuoc like ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maThuoc);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				a.setTenThuoc(rs.getString("TenThuoc"));
				a.setDonViTinh(rs.getString("DonViTinh"));
				a.setGia(rs.getDouble("GiaThuoc"));
				System.out.println(a);
				return a;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean kiemTraMaThuoc(String maThuoc) {
		String sql = "select * from Thuoc where MaThuoc like ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maThuoc);
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while(rs.next()) {
				count++;
			}
			return count > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public static void main(String[] args) {
		new DAOThuoc().getIdThuoc("VD");
		new DAOThuoc().getThuocBan("GC-274-17");
		System.out.println(new DAOThuoc().kiemTraMaThuoc("GC-74-17"));
	}
}
