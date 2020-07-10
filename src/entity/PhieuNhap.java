package entity;

import java.util.ArrayList;
import java.util.Date;

public class PhieuNhap {
	private String maPhieuNhap;
	private java.sql.Date ngayNhap;
	private NhanVien nhanVien;
	private ArrayList<LoThuoc> loThuocs;
	
	public String getMaPhieuNhap() {
		return maPhieuNhap;
	}
	public void setMaPhieuNhap(String maPhieuNhap) {
		this.maPhieuNhap = maPhieuNhap;
	}
	public java.sql.Date getNgayNhap() {
		return ngayNhap;
	}
	public void setNgayNhap(java.sql.Date ngayNhap) {
		this.ngayNhap = ngayNhap;
	}
	public NhanVien getNhanVien() {
		return nhanVien;
	}
	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}
	public ArrayList<LoThuoc> getLoThuocs() {
		return loThuocs;
	}
	public void setLoThuocs(ArrayList<LoThuoc> loThuocs) {
		this.loThuocs = loThuocs;
	}
	public PhieuNhap(String maPhieuNhap, java.sql.Date ngayNhap, NhanVien nhanVien, ArrayList<LoThuoc> loThuocs) {
		super();
		this.maPhieuNhap = maPhieuNhap;
		this.ngayNhap = ngayNhap;
		this.nhanVien = nhanVien;
		this.loThuocs = loThuocs;
	}
	public PhieuNhap(String maPhieuNhap) {
		super();
		this.maPhieuNhap = maPhieuNhap;
	}
	public PhieuNhap() {
		super();
	}
	@Override
	public String toString() {
		return "PhieuNhap [maPhieuNhap=" + maPhieuNhap + ", ngayNhap=" + ngayNhap + ", nhanVien=" + nhanVien
				+ ", loThuocs=" + loThuocs + "]";
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
	
	

}
