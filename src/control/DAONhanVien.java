package control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import entity.NhanVien;

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

	public static void main(String[] args) {
		new DAONhanVien().getNhanVien("duchoan6814", "sapassword");
		new DAONhanVien().getInforNhanVien("duchoan6814");
	}
}
