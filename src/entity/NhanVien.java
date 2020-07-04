package entity;

import java.util.Date;

public class NhanVien {
	private String maNhanVien, hoTenDem, ten, soDienThoai, diaChi;
	private Date ngaySinh;
	private double luongTrenGio, soGioLam;
	private boolean gioiTinh;
	private TaiKhoan taiKhoan;
	

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public String getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(String maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	public String getHoTenDem() {
		return hoTenDem;
	}

	public void setHoTenDem(String hoTenDem) {
		this.hoTenDem = hoTenDem;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public double getLuongTrenGio() {
		return luongTrenGio;
	}

	public void setLuongTrenGio(double luongTrenGio) {
		this.luongTrenGio = luongTrenGio;
	}

	public double getSoGioLam() {
		return soGioLam;
	}

	public void setSoGioLam(double soGioLam) {
		this.soGioLam = soGioLam;
	}

	public boolean isGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public NhanVien(String maNhanVien, String hoTenDem, String ten, String soDienThoai, String diaChi, Date ngaySinh,
			double luongTrenGio, double soGioLam, boolean gioiTinh) {
		super();
		this.maNhanVien = maNhanVien;
		this.hoTenDem = hoTenDem;
		this.ten = ten;
		this.soDienThoai = soDienThoai;
		this.diaChi = diaChi;
		this.ngaySinh = ngaySinh;
		this.luongTrenGio = luongTrenGio;
		this.soGioLam = soGioLam;
		this.gioiTinh = gioiTinh;
	}

	public NhanVien() {
		// TODO Auto-generated constructor stub
	}
	
	

	public NhanVien(String maNhanVien) {
		super();
		this.maNhanVien = maNhanVien;
	}

	@Override
	public String toString() {
		return "NhanVien [maNhanVien=" + maNhanVien + ", hoTenDem=" + hoTenDem + ", ten=" + ten + ", soDienThoai="
				+ soDienThoai + ", diaChi=" + diaChi + ", ngaySinh=" + ngaySinh + ", luongTrenGio=" + luongTrenGio
				+ ", soGioLam=" + soGioLam + ", gioiTinh=" + gioiTinh + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((maNhanVien == null) ? 0 : maNhanVien.hashCode());
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
		NhanVien other = (NhanVien) obj;
		if (maNhanVien == null) {
			if (other.maNhanVien != null)
				return false;
		} else if (!maNhanVien.equals(other.maNhanVien))
			return false;
		return true;
	}
	
	public double tinhLuongNhanVien() {
		return this.getSoGioLam() * this.getLuongTrenGio();
	}
}