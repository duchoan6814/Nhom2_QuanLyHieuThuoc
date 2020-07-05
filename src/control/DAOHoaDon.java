package control;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import connectDB.DAO;
import entity.ChiTietHoaDon;
import entity.HoaDon;
import entity.KhachHang;
import entity.NhanVien;
import entity.Thuoc;

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
	
	public ArrayList<HoaDon> getDanhSachHoaDonTheoNhanVien(String ho, String ten) {
		ArrayList<HoaDon> temp = new ArrayList<HoaDon>();
		String sql = "select MaHD, NgayLapHD, nv.HoTenDem, TenNV, kh.HoTenDem, TenKH, TongTien from HoaDon hd  join NhanVien nv on hd.MaNV = nv.MaNV left join KhachHang kh on hd.MaKH = kh.MaKH" + 
				" where nv.HoTenDem like N'"+ho+"' and TenNV like N'"+ten+"'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
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
				temp.add(don);
			}
			return temp;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public HoaDon getHoaDonTheoMa(String maHoaDon) {
		HoaDon hoaDon = new HoaDon();
		String sql = "select MaHD, NgayLapHD, nv.HoTenDem, TenNV, kh.HoTenDem, TenKH, TongTienPhaiTra, SoDiemTru, 0.01*TongTien as DiemTichLuyDuoc" + 
				" from HoaDon hd left join KhachHang kh on hd.MaKH = kh.MaKH inner join NhanVien nv on nv.MaNV = hd.MaNV" + 
				" where MaHD = ?";
		
		String sql1 = "select TenThuoc, cthd.SoLuong, TongTien" + 
				" from ChiTietHoaDon cthd inner join Thuoc t on cthd.MaThuoc = t.MaThuoc" + 
				" where MaHD = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maHoaDon);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				hoaDon.setMaHD(rs.getString("MaHD"));
				hoaDon.setNgayLap(rs.getTimestamp("NgayLapHD"));
				NhanVien nhanVien = new NhanVien();
				nhanVien.setHoTenDem(rs.getString("HoTenDem"));
				nhanVien.setTen(rs.getString("TenNV"));
				hoaDon.setNhanVien(nhanVien);
				KhachHang hang = new KhachHang();
				hang.setHoTenDem(rs.getString(5));
				hang.setTen(rs.getString("TenKH"));
				hoaDon.setKhachHang(hang);
				hoaDon.setTongTien(rs.getDouble("TongTienPhaiTra"));
				hoaDon.setDiemSuDung(rs.getDouble("SoDiemTru"));
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, hoaDon.getMaHD());
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()) {
					ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
					Thuoc thuoc = new Thuoc();
					thuoc.setTenThuoc(rs1.getString("TenThuoc"));
					chiTietHoaDon.setThuoc(thuoc);
					chiTietHoaDon.setSoLuong(rs1.getInt("SoLuong"));
					chiTietHoaDon.setGiaBan(rs1.getDouble("TongTien"));
					hoaDon.getListChiTietHoaDon().add(chiTietHoaDon);
				}
				return hoaDon;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
