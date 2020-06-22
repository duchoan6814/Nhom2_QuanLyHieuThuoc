package entity;

import java.util.ArrayList;
import java.util.Date;

public class PhieuNhap {
	private String maPhieuNhap;
	private Date ngayNhap;
	private NhanVien nhanVien;
	private ArrayList<ChiTietPhieuNhap> listChiTietPhieuNhap;

	public String getMaPhieuNhap() {
		return maPhieuNhap;
	}

	public void setMaPhieuNhap(String maPhieuNhap) {
		this.maPhieuNhap = maPhieuNhap;
	}

	public Date getNgayNhap() {
		return ngayNhap;
	}

	public void setNgayNhap(Date ngayNhap) {
		this.ngayNhap = ngayNhap;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public ArrayList<ChiTietPhieuNhap> getListChiTietPhieuNhap() {
		return listChiTietPhieuNhap;
	}

	public void setListChiTietPhieuNhap(ArrayList<ChiTietPhieuNhap> listChiTietPhieuNhap) {
		this.listChiTietPhieuNhap = listChiTietPhieuNhap;
	}

	public PhieuNhap(String maPhieuNhap, Date ngayNhap, NhanVien nhanVien) {
		super();
		this.maPhieuNhap = maPhieuNhap;
		this.ngayNhap = ngayNhap;
		this.nhanVien = nhanVien;
		this.listChiTietPhieuNhap = new ArrayList<ChiTietPhieuNhap>();
	}

	@Override
	public String toString() {
		return "PhieuNhap [maPhieuNhap=" + maPhieuNhap + ", ngayNhap=" + ngayNhap + ", nhanVien=" + nhanVien
				+ ", listChiTietPhieuNhap=" + listChiTietPhieuNhap + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((maPhieuNhap == null) ? 0 : maPhieuNhap.hashCode());
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
		PhieuNhap other = (PhieuNhap) obj;
		if (maPhieuNhap == null) {
			if (other.maPhieuNhap != null)
				return false;
		} else if (!maPhieuNhap.equals(other.maPhieuNhap))
			return false;
		return true;
	}

	public boolean themChiTietPhieuNhap(ChiTietPhieuNhap ctpn) {
		if(!this.listChiTietPhieuNhap.contains(ctpn)) {
			this.listChiTietPhieuNhap.add(ctpn);
			return true;
		}else {
			return false;
		}
	}
	
	public boolean xoaChiTietPhieuNhap(int index) {
		try {
			this.listChiTietPhieuNhap.remove(index);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	public boolean suaChiTietPhieuNhap(int index, int soLuong) {
		try {
			this.listChiTietPhieuNhap.get(index).setSoLuong(soLuong);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	public double tinhTongTienNhap() {
		double tongTien = 0;
		for (ChiTietPhieuNhap chiTietPhieuNhap : listChiTietPhieuNhap) {
			tongTien += chiTietPhieuNhap.tinhTongTienTrenDong();
		}
		return tongTien;
	}

}
