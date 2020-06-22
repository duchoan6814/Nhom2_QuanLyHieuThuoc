package entity;

public class ChiTietHoaDon {
	private Thuoc thuoc;
	private double giaBan;
	private int soLuong;
	
	public Thuoc getThuoc() {
		return thuoc;
	}
	public void setThuoc(Thuoc thuoc) {
		this.thuoc = thuoc;
	}
	public double getGiaBan() {
		return giaBan;
	}
	public void setGiaBan(double giaBan) {
		this.giaBan = giaBan;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	public ChiTietHoaDon(Thuoc thuoc, double giaBan, int soLuong) {
		super();
		this.thuoc = thuoc;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
	}
	
	public ChiTietHoaDon() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ChiTietHoaDon [thuoc=" + thuoc + ", giaBan=" + giaBan + ", soLuong=" + soLuong + "]";
	}
	
	
	
	public double tinhTongTienChiTietHoaDon() {
		return this.getGiaBan() * this.getSoLuong();
	}
}
