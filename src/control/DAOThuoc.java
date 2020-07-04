package control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.ComboBoxModel;
import javax.swing.DefaultComboBoxModel;

import connectDB.DAO;
import entity.NhaCungCap;
import entity.TheLoai;
import entity.Thuoc;

public class DAOThuoc extends DAO {
	public Vector getIdThuoc(String maThuoc) {
		System.out.println("aaa");
		Vector listModel = new Vector();
		String sql = "select MaThuoc from Thuoc where MaThuoc like '" + maThuoc + "%'";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				listModel.add(rs.getString("MaThuoc"));
			}
			return listModel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public boolean kiemTraSoLuong(int mySoLuong, String maThuoc) {
		String sql = "select SoLuong from Thuoc where maThuoc=?";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, maThuoc);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return mySoLuong <= rs.getInt("SoLuong");
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public Thuoc getThuocBan(String maThuoc) {
		Thuoc a = new Thuoc();
		String sql = "select TenThuoc, DonViTinh, GiaThuoc from Thuoc where MaThuoc like ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maThuoc);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a.setTenThuoc(rs.getString("TenThuoc"));
				a.setDonViTinh(rs.getString("DonViTinh"));
				a.setGia(rs.getDouble("GiaThuoc"));
//				a.setSoLuong(rs.getInt("SoLuong"));
				System.out.println(a);
				return a;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public int getSoLuongConLaiTrongKho(String maThuoc) {
		String sql = "select SoLuong from Thuoc where maThuoc=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maThuoc);
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				return rs.getInt("SoLuong");
			return -1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}

	public boolean kiemTraMaThuoc(String maThuoc) {
		String sql = "select * from Thuoc where MaThuoc like ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maThuoc);
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			}
			return count > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public ArrayList<Thuoc> timKiemThuoc(String str) {
		ArrayList<Thuoc> a = new ArrayList<Thuoc>();
		String sql = "select MaThuoc, TenThuoc, GiaThuoc, tl.MaLoai,TenLoai, DonViTinh from Thuoc t inner join [dbo].[TheLoai] tl on t.MaLoai = tl.MaLoai where MaThuoc like '%"
				+ str + "%'";
		String sql1 = "select MaThuoc, TenThuoc, GiaThuoc, tl.MaLoai,TenLoai, DonViTinh from Thuoc t inner join [dbo].[TheLoai] tl on t.MaLoai = tl.MaLoai where TenThuoc like '%"
				+ str + "%'";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ResultSet rs = ps.executeQuery();
			ResultSet rs1 = ps1.executeQuery();
			while (rs.next()) {
				Thuoc temp = new Thuoc();
				temp.setMaThuoc(rs.getString("MaThuoc"));
				temp.setTenThuoc(rs.getString("TenThuoc"));
				temp.setGia(rs.getDouble("GiaThuoc"));
				TheLoai theLoai = new TheLoai();
				theLoai.setMaTheLoai(rs.getString("MaLoai"));
				theLoai.setTenTheLoai(rs.getString("TenLoai"));
				temp.setLoai(theLoai);
				temp.setDonViTinh(rs.getString("DonViTinh"));

				if (!a.contains(temp)) {
					a.add(temp);
				}

			}

			while (rs1.next()) {
				Thuoc temp = new Thuoc();
				temp.setMaThuoc(rs1.getString("MaThuoc"));
				temp.setTenThuoc(rs1.getString("TenThuoc"));
				temp.setGia(rs1.getDouble("GiaThuoc"));
				TheLoai theLoai = new TheLoai();
				theLoai.setMaTheLoai(rs1.getString("MaLoai"));
				theLoai.setTenTheLoai(rs1.getString("TenLoai"));
				temp.setLoai(theLoai);
				temp.setDonViTinh(rs1.getString("DonViTinh"));

				if (!a.contains(temp)) {
					a.add(temp);
				}
			}

			return a;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public Thuoc getChiTietThuocTheoMa(String maThuoc) {
		Thuoc a = new Thuoc();
		String sql = "select MaThuoc, TenThuoc, MoTa, GiaThuoc, HSD, DonViTinh, SoLuong, TenLoai, TenNCC from Thuoc t inner join TheLoai tl on t.MaLoai = tl.MaLoai inner join NhaCungCap ncc on ncc.MaNCC = t.MaNCC where MaThuoc = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maThuoc);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				a.setMaThuoc(rs.getString("MaThuoc"));
				a.setTenThuoc(rs.getString("TenThuoc"));
				a.setMoTa(rs.getString("MoTa"));
				a.setGia(rs.getDouble("GiaThuoc"));
				a.setHanSuDung(rs.getString("HSD"));
				a.setDonViTinh(rs.getString("DonViTinh"));
				a.setSoLuong(rs.getInt("SoLuong"));
				TheLoai tempTheLoai = new TheLoai();
				tempTheLoai.setTenTheLoai(rs.getString("TenLoai"));
				a.setLoai(tempTheLoai);
				NhaCungCap tempNhaCungCap = new NhaCungCap();
				tempNhaCungCap.setTenNhaCungCap(rs.getString("TenNCC"));
				a.setNhaCungCap(tempNhaCungCap);
				return a;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}

	public static void main(String[] args) {
		new DAOThuoc().getIdThuoc("VD");
		new DAOThuoc().getThuocBan("GC-274-17");
		System.out.println(new DAOThuoc().kiemTraMaThuoc("NC46-H06-15"));
		System.out.println(new DAOThuoc().timKiemThuoc("vn"));
	}
}
