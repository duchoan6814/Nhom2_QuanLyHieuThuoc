package control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.KhachHang;

public class DAOKhachHang extends DAO {
	public ArrayList<String> findListMaKhachHang(String maKhachHang) {
		ArrayList<String> a = new ArrayList<String>();
		String sql = "select MaKH from [dbo].[KhachHang] where MaKH like '"+maKhachHang+"%'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
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
			if(rs.next()) {
				a.setMaKH(rs.getString("MaKH"));
				a.setHoTenDem(rs.getString("HoTenDem"));
				a.setDiemTichLuy(rs.getDouble("DiemTichLuy"));
				a.setTen(rs.getString("TenKH"));
				return a;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static void main(String[] args) {
		System.out.println(new DAOKhachHang().findListMaKhachHang("18054321"));
		
	}
}
