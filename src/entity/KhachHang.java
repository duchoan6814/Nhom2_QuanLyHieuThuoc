package entity;

import java.util.Date;

public class KhachHang {
	private String maKH, hoTenDem, ten, soDienThoai, diaChi;
	private java.sql.Date ngaySinh;
	private double diemTichLuy;
	private boolean gioiTinh;

	public String getMaKH() {
		return maKH;
	}

	public void setMaKH(String maKH) {
		this.maKH = maKH;
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

	public void setNgaySinh(java.sql.Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public double getDiemTichLuy() {
		return diemTichLuy;
	}

	public void setDiemTichLuy(double diemTichLuy) {
		this.diemTichLuy = diemTichLuy;
	}

	public boolean isGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public KhachHang(String maKH, String hoTenDem, String ten, String soDienThoai, String diaChi, java.sql.Date ngaySinh,
			double diemTichLuy, boolean gioiTinh) {
		super();
		this.maKH = maKH;
		this.hoTenDem = hoTenDem;
		this.ten = ten;
		this.soDienThoai = soDienThoai;
		this.diaChi = diaChi;
		this.ngaySinh = ngaySinh;
		this.diemTichLuy = diemTichLuy;
		this.gioiTinh = gioiTinh;
	}

	public KhachHang() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "KhachHang [maKH=" + maKH + ", hoTenDem=" + hoTenDem + ", ten=" + ten + ", soDienThoai=" + soDienThoai
				+ ", diaChi=" + diaChi + ", ngaySinh=" + ngaySinh + ", diemTichLuy=" + diemTichLuy + ", gioiTinh="
				+ gioiTinh + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((maKH == null) ? 0 : maKH.hashCode());
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
		KhachHang other = (KhachHang) obj;
		if (maKH == null) {
			if (other.maKH != null)
				return false;
		} else if (!maKH.equals(other.maKH))
			return false;
		return true;
	}

}
