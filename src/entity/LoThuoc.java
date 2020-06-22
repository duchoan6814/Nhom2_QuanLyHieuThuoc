package entity;

import java.util.Date;

public class LoThuoc {
	private String maLoThuoc;
	private Date ngaySanXuat, ngayHetHan;
	private Thuoc thuoc;
	private int soLuong;
	public String getMaLoThuoc() {
		return maLoThuoc;
	}
	public void setMaLoThuoc(String maLoThuoc) {
		this.maLoThuoc = maLoThuoc;
	}
	public Date getNgaySanXuat() {
		return ngaySanXuat;
	}
	public void setNgaySanXuat(Date ngaySanXuat) {
		this.ngaySanXuat = ngaySanXuat;
	}
	public Date getNgayHetHan() {
		return ngayHetHan;
	}
	public void setNgayHetHan(Date ngayHetHan) {
		this.ngayHetHan = ngayHetHan;
	}
	public Thuoc getThuoc() {
		return thuoc;
	}
	public void setThuoc(Thuoc thuoc) {
		this.thuoc = thuoc;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	public LoThuoc(String maLoThuoc, Date ngaySanXuat, Date ngayHetHan, Thuoc thuoc, int soLuong) {
		super();
		this.maLoThuoc = maLoThuoc;
		this.ngaySanXuat = ngaySanXuat;
		this.ngayHetHan = ngayHetHan;
		this.thuoc = thuoc;
		this.soLuong = soLuong;
	}
	
	@Override
	public String toString() {
		return "LoThuoc [maLoThuoc=" + maLoThuoc + ", ngaySanXuat=" + ngaySanXuat + ", ngayHetHan=" + ngayHetHan
				+ ", thuoc=" + thuoc + ", soLuong=" + soLuong + "]";
	}
	
	public LoThuoc() {
		super();
	}
	
	
	
	
}
