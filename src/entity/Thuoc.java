package entity;

import java.util.ArrayList;
import java.util.Date;

public class Thuoc {
	private String maThuoc, tenThuoc, moTa, donViTinh;
	private double gia;
	private Date ngaySanXuat, ngayHetHan;
	private NhaCungCap nhaCungCap;
	private ArrayList<TheLoai> listTheLoai;
	
	public String getMaThuoc() {
		return maThuoc;
	}
	public void setMaThuoc(String maThuoc) {
		this.maThuoc = maThuoc;
	}
	public String getTenThuoc() {
		return tenThuoc;
	}
	public void setTenThuoc(String tenThuoc) {
		this.tenThuoc = tenThuoc;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getDonViTinh() {
		return donViTinh;
	}
	public void setDonViTinh(String donViTinh) {
		this.donViTinh = donViTinh;
	}
	public double getGia() {
		return gia;
	}
	public void setGia(double gia) {
		this.gia = gia;
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
	public NhaCungCap getNhaCungCap() {
		return nhaCungCap;
	}
	public void setNhaCungCap(NhaCungCap nhaCungCap) {
		this.nhaCungCap = nhaCungCap;
	}
	public ArrayList<TheLoai> getListTheLoai() {
		return listTheLoai;
	}
	public void setListTheLoai(ArrayList<TheLoai> listTheLoai) {
		this.listTheLoai = listTheLoai;
	}
	public Thuoc(String maThuoc, String tenThuoc, String moTa, String donViTinh, double gia, Date ngaySanXuat,
			Date ngayHetHan, NhaCungCap nhaCungCap) {
		super();
		this.maThuoc = maThuoc;
		this.tenThuoc = tenThuoc;
		this.moTa = moTa;
		this.donViTinh = donViTinh;
		this.gia = gia;
		this.ngaySanXuat = ngaySanXuat;
		this.ngayHetHan = ngayHetHan;
		this.nhaCungCap = nhaCungCap;
		this.listTheLoai = new ArrayList<TheLoai>();
	}
	
	public Thuoc() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "Thuoc [maThuoc=" + maThuoc + ", tenThuoc=" + tenThuoc + ", moTa=" + moTa + ", donViTinh=" + donViTinh
				+ ", gia=" + gia + ", ngaySanXuat=" + ngaySanXuat + ", ngayHetHan=" + ngayHetHan + ", nhaCungCap="
				+ nhaCungCap + ", listTheLoai=" + listTheLoai + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((maThuoc == null) ? 0 : maThuoc.hashCode());
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
		Thuoc other = (Thuoc) obj;
		if (maThuoc == null) {
			if (other.maThuoc != null)
				return false;
		} else if (!maThuoc.equals(other.maThuoc))
			return false;
		return true;
	}
	
	
}
