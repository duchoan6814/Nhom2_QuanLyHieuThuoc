package control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import connectDB.DAO;
import entity.NhanVien;
import entity.TaiKhoan;

public class DAONhanVien extends DAO {
	public boolean getNhanVien(String userName, String password) {
		String sql = "select * from [dbo].[TaiKhoan]" + "where TenTK = ? and MatKhau = ?";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			}
			if (count > 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public NhanVien getInforNhanVien(String userName) {
		String sql = "select * from [dbo].[NhanVien] where TenTaiKhoan = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				NhanVien nhanVien = new NhanVien(rs.getString(1), rs.getString(2), rs.getString(3),
						rs.getString("SoDienThoai"), rs.getString("DiaChi"), new Date(), rs.getDouble("LuongTrenGio"),
						rs.getFloat("SoGioLam"), rs.getBoolean("GioiTinh"));
				System.out.println(nhanVien);
				return nhanVien;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public boolean themNhanVien(NhanVien nhanVien) {

		String sql2 = "insert NhanVien (MaNV, HoTenDem, TenNV, GioiTinh, TenTaiKhoan, SoDienThoai) values (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps1 = conn.prepareStatement(sql2);
			ps1.setString(1, nhanVien.getMaNhanVien());
			ps1.setString(2, nhanVien.getHoTenDem());
			ps1.setString(3, nhanVien.getTen());
			ps1.setBoolean(4, nhanVien.isGioiTinh());
			ps1.setString(5, nhanVien.getTaiKhoan().getUserName());
			ps1.setString(6, nhanVien.getSoDienThoai());

			return ps1.executeUpdate() > 0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return false;
	}

	public boolean themTaiKhoan(NhanVien nhanVien) {
		String sql = "insert TaiKhoan values(?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, nhanVien.getTaiKhoan().getUserName());
			ps.setString(2, nhanVien.getTaiKhoan().getPassword());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<String> getListTenNhanVien() {
		String sql = "select HoTenDem, TenNV from nhanVien";
		ArrayList<String> a = new ArrayList<String>();
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a.add(rs.getString("HoTenDem")+" "+rs.getString("TenNV"));
			}
			return a;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {

	}
}
