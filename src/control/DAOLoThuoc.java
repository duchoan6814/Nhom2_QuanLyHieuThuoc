package control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connectDB.DAO;
import entity.LoThuoc;
import entity.PhieuNhap;

public class DAOLoThuoc extends DAO {
	public ArrayList<PhieuNhap> getListLoThuocByID(String maThuoc) {
		ArrayList<PhieuNhap> list = new ArrayList<PhieuNhap>();
		String sql = "select * from LoThuoc lt join PhieuNhap pn on lt.MaPhieuNhap = pn.MaPhieuNhap where MaThuoc = ?";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, maThuoc);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				PhieuNhap phieuNhap = new PhieuNhap();
				phieuNhap.setMaPhieuNhap(rs.getString("MaPhieuNhap"));
				phieuNhap.setNgayNhap(rs.getDate("NgayNhap"));
				LoThuoc loThuoc = new LoThuoc();
				loThuoc.setNgaySanXuat(rs.getDate("NgaySanXuat"));
				loThuoc.setNgayHetHan(rs.getDate("NgayHetHan"));
				loThuoc.setSoLuong(rs.getInt("SoLuong"));
				phieuNhap.getLoThuocs().add(loThuoc);
				list.add(phieuNhap);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
