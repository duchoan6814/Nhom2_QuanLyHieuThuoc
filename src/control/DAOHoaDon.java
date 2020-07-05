package control;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import connectDB.DAO;
import entity.HoaDon;
import entity.KhachHang;
import entity.NhanVien;

public class DAOHoaDon extends DAO {
	public boolean insertHoaDon(HoaDon hoaDon) {
		String sql = "insert into [dbo].[HoaDon] values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, hoaDon.getMaHD());
			ps.setTimestamp(2, (Timestamp) hoaDon.getNgayLap());
			ps.setDouble(3, hoaDon.getvAT());
			ps.setString(4, hoaDon.getNhanVien().getMaNhanVien());
			try {
				ps.setString(5, hoaDon.getKhachHang().getMaKH());
			} catch (Exception e) {
				// TODO: handle exception
				ps.setNull(5, java.sql.Types.INTEGER);
			}
			ps.setDouble(6, hoaDon.tinhThanhTienHoaDon() + hoaDon.getDiemSuDung());
			ps.setDouble(7, hoaDon.getDiemSuDung());
			ps.setDouble(8, hoaDon.tinhThanhTienHoaDon());
			ps.setDouble(9, hoaDon.tinhTongTienHoaDon());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public ArrayList<HoaDon> getAllHoaDon() {
		ArrayList<HoaDon> listTempHoaDon = new ArrayList<HoaDon>();
		String sql = "select MaHD, NgayLapHD, nv.HoTenDem, TenNV, kh.HoTenDem, TenKH, TongTien from HoaDon hd  join NhanVien nv on hd.MaNV = nv.MaNV left join KhachHang kh on hd.MaKH = kh.MaKH";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				HoaDon don = new HoaDon();
				don.setMaHD(rs.getString("MaHD"));
				don.setNgayLap(rs.getTimestamp("NgayLapHD"));
				NhanVien nhanVien = new NhanVien();
				nhanVien.setHoTenDem(rs.getString(3));
				nhanVien.setTen(rs.getString(4));
				don.setNhanVien(nhanVien);
				KhachHang hang = new KhachHang();
				hang.setHoTenDem(rs.getString(5));
				hang.setTen(rs.getString(6));
				don.setKhachHang(hang);
				don.setTongTien(rs.getDouble("TongTien"));
				listTempHoaDon.add(don);
			}
			return listTempHoaDon;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<HoaDon> getHoaDonTuNgayDenNgay(String startDate, String endDate) {
		ArrayList<HoaDon> listTempHoaDon = new ArrayList<HoaDon>();
		String sql = "select MaHD, NgayLapHD, nv.HoTenDem, TenNV, kh.HoTenDem, TenKH, TongTien from HoaDon hd  join NhanVien nv on hd.MaNV = nv.MaNV left join KhachHang kh on hd.MaKH = kh.MaKH where NgayLapHD between ? and ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, startDate);
			ps.setString(2, endDate);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				HoaDon don = new HoaDon();
				don.setMaHD(rs.getString("MaHD"));
				don.setNgayLap(rs.getTimestamp("NgayLapHD"));
				NhanVien nhanVien = new NhanVien();
				nhanVien.setHoTenDem(rs.getString(3));
				nhanVien.setTen(rs.getString(4));
				don.setNhanVien(nhanVien);
				KhachHang hang = new KhachHang();
				hang.setHoTenDem(rs.getString(5));
				hang.setTen(rs.getString(6));
				don.setKhachHang(hang);
				don.setTongTien(rs.getDouble("TongTien"));
				listTempHoaDon.add(don);
			}
			return listTempHoaDon;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
