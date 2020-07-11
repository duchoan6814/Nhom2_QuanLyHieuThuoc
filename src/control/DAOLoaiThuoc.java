package control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connectDB.DAO;
import entity.TheLoai;

public class DAOLoaiThuoc extends DAO {
	public ArrayList<TheLoai> getListLoaiThuoc(){
		ArrayList<TheLoai> list = new ArrayList<TheLoai>();
		String sql = "select * from TheLoai";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				TheLoai theLoai = new TheLoai();
				theLoai.setMaTheLoai(rs.getString("MaLoai"));
				theLoai.setTenTheLoai(rs.getString("TenLoai"));
				list.add(theLoai);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public String getMaLoaiThuocTheoTen(String tenThuoc) {
		String sql = "select * from TheLoai where TenLoai like N'%"+tenThuoc+"%'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getString("MaLoai");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
