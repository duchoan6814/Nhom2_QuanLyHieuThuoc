package entity;

import java.util.ArrayList;
import java.util.Date;

public class HoaDon {
	private String maHD;
	private double vAT;
	private Date ngayLap;
	private NhanVien nhanVien;
	private KhachHang khachHang;
	private ArrayList<ChiTietHoaDon> listChiTietHoaDon;
	
	

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public KhachHang getKhachHang() {
		return khachHang;
	}

	public void setKhachHang(KhachHang khachHang) {
		this.khachHang = khachHang;
	}

	public String getMaHD() {
		return maHD;
	}

	public void setMaHD(String maHD) {
		this.maHD = maHD;
	}

	public double getvAT() {
		return vAT;
	}

	public void setvAT(double vAT) {
		this.vAT = vAT;
	}

	public Date getNgayLap() {
		return ngayLap;
	}

	public void setNgayLap(Date ngayLap) {
		this.ngayLap = ngayLap;
	}

	public ArrayList<ChiTietHoaDon> getListChiTietHoaDon() {
		return listChiTietHoaDon;
	}

	public void setListChiTietHoaDon(ArrayList<ChiTietHoaDon> listChiTietHoaDon) {
		this.listChiTietHoaDon = listChiTietHoaDon;
	}

	public HoaDon(String maHD, double vAT, Date ngayLap) {
		super();
		this.maHD = maHD;
		this.vAT = vAT;
		this.ngayLap = ngayLap;
		this.listChiTietHoaDon = new ArrayList<ChiTietHoaDon>();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((maHD == null) ? 0 : maHD.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HoaDon other = (HoaDon) obj;
		if (maHD == null) {
			if (other.maHD != null)
				return false;
		} else if (!maHD.equals(other.maHD))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "HoaDon [maHD=" + maHD + ", vAT=" + vAT + ", ngayLap=" + ngayLap + ", listChiTietHoaDon="
				+ listChiTietHoaDon + "]";
	}

	public boolean themChiTietHoaDon(ChiTietHoaDon CTHD) {
		if (!this.listChiTietHoaDon.contains(CTHD)) {
			this.listChiTietHoaDon.add(CTHD);
			return true;
		}
		return false;
	}

	public boolean suaChiTietHoaDon(int soLuong, int index) {
		try {
			this.listChiTietHoaDon.get(index).setSoLuong(soLuong);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	public boolean xoaChiTietHoaDon(int index) {
		try {
			this.listChiTietHoaDon.remove(index);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	public double tinhTongTienHoaDon() {
		double tongTien = 0;
		for (ChiTietHoaDon chiTietHoaDon : listChiTietHoaDon) {
			tongTien += chiTietHoaDon.tinhTongTienChiTietHoaDon();
		}
		return tongTien;
	}
	
	public double tinhThanhTienHoaDon() {
		double tongTien = 0;
		for (ChiTietHoaDon chiTietHoaDon : listChiTietHoaDon) {
			tongTien += chiTietHoaDon.tinhTongTienChiTietHoaDon();
		}
		return tongTien + (tongTien * this.getvAT());
	}
}
