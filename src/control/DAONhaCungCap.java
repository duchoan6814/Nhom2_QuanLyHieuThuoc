package control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connectDB.DAO;
import entity.NhaCungCap;

public class DAONhaCungCap extends DAO {
	public ArrayList<NhaCungCap> getListNhaCungCap(){
		String sql = "select * from NhaCungCap";
		ArrayList<NhaCungCap> list = new ArrayList<NhaCungCap>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				NhaCungCap nhaCungCap = new NhaCungCap();
				nhaCungCap.setMaNhaCungCap(rs.getString("MaNCC"));
				nhaCungCap.setTenNhaCungCap(rs.getString("TenNCC"));
				nhaCungCap.setDiaChi(rs.getString("DiaChi"));
				list.add(nhaCungCap);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public String getTenNhaCungCapTheoMa(String maNhaCungCap) {
		String sql = "select TenNCC from NhaCungCap where MaNCC = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maNhaCungCap);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString("TenNCC");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
