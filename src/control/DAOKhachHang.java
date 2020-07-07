package control;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connectDB.DAO;
import entity.KhachHang;
import entity.NhanVien;
import entity.TheLoai;
import entity.Thuoc;

public class DAOKhachHang extends DAO {
	public ArrayList<String> findListMaKhachHang(String maKhachHang) {
		ArrayList<String> a = new ArrayList<String>();
		String sql = "select MaKH from [dbo].[KhachHang] where MaKH like '" + maKhachHang + "%'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a.add(rs.getString("MaKH"));
			}
			return a;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public KhachHang timKhachHangTheoMa(String maKhachHang) {
		KhachHang a = new KhachHang();
		String sql = "select * from [dbo].[KhachHang] where MaKH = ?";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, maKhachHang);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				a.setMaKH(rs.getString("MaKH"));
				a.setHoTenDem(rs.getString("HoTenDem"));
				a.setDiemTichLuy(rs.getDouble("DiemTichLuy"));
				a.setTen(rs.getString("TenKH"));
				a.setNgaySinh(rs.getDate("NgaySinh"));
				a.setDiaChi(rs.getString("DiaChi"));
				a.setGioiTinh(rs.getBoolean("GioiTinh"));
				return a;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public ArrayList<KhachHang> getListKhachHang() {
		ArrayList<KhachHang> khachHangs = new ArrayList<KhachHang>();
		String sql = "select * from KhachHang";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				KhachHang khachHang = new KhachHang();
				khachHang.setMaKH(rs.getString("MaKH"));
				khachHang.setHoTenDem(rs.getString("HoTenDem"));
				khachHang.setTen(rs.getString("TenKH"));
				khachHang.setNgaySinh(rs.getDate("NgaySinh"));
				khachHang.setDiaChi(rs.getString("DiaChi"));
				khachHang.setGioiTinh(rs.getBoolean("GioiTinh"));
				khachHang.setDiemTichLuy(rs.getDouble("DiemTichLuy"));
				khachHangs.add(khachHang);
			}
			return khachHangs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<KhachHang> timKiemKhachHangTheoTen(String str) {
		ArrayList<KhachHang> list = new ArrayList<KhachHang>();
		String sql = "select * from KhachHang where TenKH like N'%" + str + "%' or HoTenDem like N'%" + str + "%'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				KhachHang khachHang = new KhachHang();
				khachHang.setMaKH(rs.getString("MaKH"));
				khachHang.setHoTenDem(rs.getString("HoTenDem"));
				khachHang.setTen(rs.getString("TenKH"));
				khachHang.setNgaySinh(rs.getDate("NgaySinh"));
				khachHang.setDiaChi(rs.getString("DiaChi"));
				khachHang.setGioiTinh(rs.getBoolean("GioiTinh"));
				khachHang.setDiemTichLuy(rs.getDouble("DiemTichLuy"));
				list.add(khachHang);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<KhachHang> timKiemDanhSachKhachHangTheoMa(String str) {
		ArrayList<KhachHang> list = new ArrayList<KhachHang>();
		String sql = "select * from KhachHang where MaKH like N'%" + str + "%'";
		String sql1 = "select * from KhachHang where TenKH like N'%n%'";
		try {

			PreparedStatement ps = conn.prepareStatement(sql);
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ResultSet rs = ps.executeQuery();
			ResultSet rs1 = ps1.executeQuery();
			while (rs.next()) {
				KhachHang khachHang = new KhachHang();
				khachHang.setMaKH(rs.getString("MaKH"));
				khachHang.setHoTenDem(rs.getString("HoTenDem"));
				khachHang.setTen(rs.getString("TenKH"));
				khachHang.setNgaySinh(rs.getDate("NgaySinh"));
				khachHang.setDiaChi(rs.getString("DiaChi"));
				khachHang.setGioiTinh(rs.getBoolean("GioiTinh"));
				khachHang.setDiemTichLuy(rs.getDouble("DiemTichLuy"));
				list.add(khachHang);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public double getTongTienMuaCuaKhachHang(String maKhachHang) {
		String sql = "select tongTien = Sum(TongTien) from HoaDon hd inner join KhachHang kh on kh.MaKH = hd.MaKH"
				+ " where kh.MaKH = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maKhachHang);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getDouble("tongTien");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public boolean setDiemTichLuy(double diemTichLuy, String maKH, double tongTienHoaDon) {
		String sql = "update [dbo].[KhachHang] set [DiemTichLuy] = DiemTichLuy - ? + 0.01 * ? where MaKH = ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDouble(1, diemTichLuy);
			ps.setDouble(2, tongTienHoaDon);
			ps.setString(3, maKH);
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean themKhachHang(KhachHang khachHang) {
		String sql = "insert KhachHang values (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, khachHang.getMaKH());
			ps.setString(2, khachHang.getHoTenDem());
			ps.setString(3, khachHang.getTen());
			ps.setDate(4, (Date) khachHang.getNgaySinh());
			ps.setString(5, khachHang.getDiaChi());
			ps.setBoolean(6, khachHang.isGioiTinh());
			ps.setDouble(7, khachHang.getDiemTichLuy());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean xoaKhachHang(String maKhachHang) {
		String sql = "delete KhachHang where MaKH = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maKhachHang);
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean suaThongTinKhachHang(KhachHang khachHang) {
		String sql = "update KhachHang" + " set HoTenDem = ?, TenKH = ?, NgaySinh = ?, DiaChi = ?, GioiTinh = ?"
				+ " where MaKH = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, khachHang.getHoTenDem());
			ps.setString(2, khachHang.getTen());
			ps.setDate(3, (Date) khachHang.getNgaySinh());
			ps.setString(4, khachHang.getDiaChi());
			ps.setBoolean(5, khachHang.isGioiTinh());
			ps.setString(6, khachHang.getMaKH());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public double getDiemTichLuyCuaKhac(String makh) {
		String sql = "select DiemTichLuy from KhachHang where MaKH like ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, makh);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getDouble("DiemTichLuy");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public static void main(String[] args) {
		System.out.println(new DAOKhachHang().findListMaKhachHang("18054321"));

	}
}
