package entity;

public class ChiTietPhieuNhap {
	private double giaNhap;
	private int soLuong;
	
	public double getGiaNhap() {
		return giaNhap;
	}
	public void setGiaNhap(double giaNhap) {
		this.giaNhap = giaNhap;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	public ChiTietPhieuNhap(double giaNhap, int soLuong) {
		super();
		this.giaNhap = giaNhap;
		this.soLuong = soLuong;
	}
	
	@Override
	public String toString() {
		return "ChiTietPhieuNhap [giaNhap=" + giaNhap + ", soLuong=" + soLuong + "]";
	}
	
	public double tinhTongTienTrenDong() {
		return this.getGiaNhap() * this.getSoLuong();
	}
	
}
