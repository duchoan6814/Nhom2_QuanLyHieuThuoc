package control;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import connectDB.DAO;
import entity.HoaDon;

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
}
