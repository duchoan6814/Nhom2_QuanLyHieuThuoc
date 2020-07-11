package control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connectDB.DAO;
import entity.LoThuoc;
import entity.NhanVien;
import entity.PhieuNhap;

public class DAOPhieuNhap extends DAO {
	public boolean themMoiPhieuNhap(PhieuNhap phieuNhap) {
		String sql = "insert into PhieuNhap values (?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, phieuNhap.getMaPhieuNhap());
			ps.setTimestamp(2, phieuNhap.getNgayNhap());
			ps.setString(3, phieuNhap.getNhanVien().getMaNhanVien());
			ps.setDouble(4, phieuNhap.tinhTongGiaNhap());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<PhieuNhap> getAllPhieuNhap(){
		ArrayList<PhieuNhap> list = new ArrayList<PhieuNhap>();
		String sql = "select * from phieunhap";
		String sql1 = "select * from LoThuoc where MaPhieuNhap = ?"; 
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				PhieuNhap phieuNhap = new PhieuNhap();
				phieuNhap.setMaPhieuNhap(rs.getString("MaPhieuNhap"));
				phieuNhap.setNgayNhap(rs.getTimestamp("NgayNhap"));
				NhanVien nhanVien =  new NhanVien(rs.getString("MaNV"));
				phieuNhap.setNhanVien(nhanVien);
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, phieuNhap.getMaPhieuNhap());
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()) {
					LoThuoc loThuoc = new LoThuoc();
					loThuoc.setMaLoThuoc(rs1.getString("MaThuoc"));
					loThuoc.setNgaySanXuat(rs1.getDate("NgaySanXuat"));
					loThuoc.setNgayHetHan(rs1.getDate("NgayHetHan"));
					loThuoc.setSoLuong(rs1.getInt("SoLuong"));
					loThuoc.setDonGia(rs1.getDouble("DonGiaNhap"));
					phieuNhap.getLoThuocs().add(loThuoc);
				}
				list.add(phieuNhap);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public ArrayList<PhieuNhap> getPhieuNhapTuNgayDenNgay(String ngayStart, String ngayEnd){
		ArrayList<PhieuNhap> list = new ArrayList<PhieuNhap>();
		String sql = "select * from phieunhap where NgayNhap between ? and ?";
		String sql1 = "select * from LoThuoc where MaPhieuNhap = ?"; 
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ngayStart);
			ps.setString(2, ngayEnd);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				PhieuNhap phieuNhap = new PhieuNhap();
				phieuNhap.setMaPhieuNhap(rs.getString("MaPhieuNhap"));
				phieuNhap.setNgayNhap(rs.getTimestamp("NgayNhap"));
				NhanVien nhanVien =  new NhanVien(rs.getString("MaNV"));
				phieuNhap.setNhanVien(nhanVien);
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, phieuNhap.getMaPhieuNhap());
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()) {
					LoThuoc loThuoc = new LoThuoc();
					loThuoc.setMaLoThuoc(rs1.getString("MaThuoc"));
					loThuoc.setNgaySanXuat(rs1.getDate("NgaySanXuat"));
					loThuoc.setNgayHetHan(rs1.getDate("NgayHetHan"));
					loThuoc.setSoLuong(rs1.getInt("SoLuong"));
					loThuoc.setDonGia(rs1.getDouble("DonGiaNhap"));
					phieuNhap.getLoThuocs().add(loThuoc);
				}
				list.add(phieuNhap);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<PhieuNhap> getListPhieuNhapTheoNhanVien(String ho, String ten){
		ArrayList<PhieuNhap> list = new ArrayList<PhieuNhap>();
		String sql = "select pn.* from PhieuNhap pn join NhanVien nv on pn.MaNV = nv.MaNV where nv.HoTenDem like N'"+ho+"' and nv.TenNV like N'"+ten+"'";
		String sql1 = "select * from LoThuoc where MaPhieuNhap = ?"; 
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				PhieuNhap phieuNhap = new PhieuNhap();
				phieuNhap.setMaPhieuNhap(rs.getString("MaPhieuNhap"));
				phieuNhap.setNgayNhap(rs.getTimestamp("NgayNhap"));
				NhanVien nhanVien =  new NhanVien(rs.getString("MaNV"));
				phieuNhap.setNhanVien(nhanVien);
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, phieuNhap.getMaPhieuNhap());
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()) {
					LoThuoc loThuoc = new LoThuoc();
					loThuoc.setMaLoThuoc(rs1.getString("MaThuoc"));
					loThuoc.setNgaySanXuat(rs1.getDate("NgaySanXuat"));
					loThuoc.setNgayHetHan(rs1.getDate("NgayHetHan"));
					loThuoc.setSoLuong(rs1.getInt("SoLuong"));
					loThuoc.setDonGia(rs1.getDouble("DonGiaNhap"));
					phieuNhap.getLoThuocs().add(loThuoc);
				}
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
