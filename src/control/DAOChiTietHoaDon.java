package control;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import connectDB.DAO;
import entity.ChiTietHoaDon;
import entity.HoaDon;

public class DAOChiTietHoaDon extends DAO {
	public boolean insertChiTietHoaDon(String maHoaDon, ChiTietHoaDon chiTietHoaDon) {
		String sql = "insert into [dbo].[ChiTietHoaDon] values (?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maHoaDon);
			ps.setString(2, chiTietHoaDon.getThuoc().getMaThuoc());
			ps.setInt(3, chiTietHoaDon.getSoLuong());
			ps.setDouble(4, chiTietHoaDon.getGiaBan());
			ps.setDouble(5, chiTietHoaDon.tinhTongTienChiTietHoaDon());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
