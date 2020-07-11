package control;

import java.sql.Date;
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
				phieuNhap.setNgayNhap(rs.getTimestamp("NgayNhap"));
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
	
	public boolean themLoThuocMoi(String maPhieuNhap ,LoThuoc loThuoc) {
		String sql = "insert into LoThuoc (MaPhieuNhap, NgaySanXuat, NgayHetHan, MaThuoc, SoLuong, DonGiaNhap, TongTien) values (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maPhieuNhap);
			ps.setDate(2, (Date) loThuoc.getNgaySanXuat());
			ps.setDate(3, (Date) loThuoc.getNgayHetHan());
			ps.setString(4, loThuoc.getThuoc().getMaThuoc());
			ps.setInt(5, loThuoc.getSoLuong());
			ps.setDouble(6, loThuoc.getDonGia());
			ps.setDouble(7, loThuoc.tinhTongTienLoThuoc());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
