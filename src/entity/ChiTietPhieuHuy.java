package entity;

import java.util.Date;

public class ChiTietPhieuHuy {
	private Date ngayLap;
	private int soLuong;
	
	public Date getNgayLap() {
		return ngayLap;
	}
	public void setNgayLap(Date ngayLap) {
		this.ngayLap = ngayLap;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	public ChiTietPhieuHuy(Date ngayLap, int soLuong) {
		super();
		this.ngayLap = ngayLap;
		this.soLuong = soLuong;
	}
	
	@Override
	public String toString() {
		return "ChiTietPhieuHuy [ngayLap=" + ngayLap + ", soLuong=" + soLuong + "]";
	}
	
	
	
}
