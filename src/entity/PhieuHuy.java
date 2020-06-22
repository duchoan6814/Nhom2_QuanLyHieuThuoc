package entity;

import java.util.ArrayList;
import java.util.Date;

public class PhieuHuy {
	private String maPhieuHuy;
	private Date ngayHuy;
	private NhanVien nhanVien;
	private ArrayList<ChiTietPhieuHuy> listChiTietPhieuHuy;

	public ArrayList<ChiTietPhieuHuy> getListChiTietPhieuHuy() {
		return listChiTietPhieuHuy;
	}

	public void setListChiTietPhieuHuy(ArrayList<ChiTietPhieuHuy> listChiTietPhieuHuy) {
		this.listChiTietPhieuHuy = listChiTietPhieuHuy;
	}

	public String getMaPhieuHuy() {
		return maPhieuHuy;
	}

	public void setMaPhieuHuy(String maPhieuHuy) {
		this.maPhieuHuy = maPhieuHuy;
	}

	public Date getNgayHuy() {
		return ngayHuy;
	}

	public void setNgayHuy(Date ngayHuy) {
		this.ngayHuy = ngayHuy;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public PhieuHuy(String maPhieuHuy, Date ngayHuy, NhanVien nhanVien) {
		super();
		this.maPhieuHuy = maPhieuHuy;
		this.ngayHuy = ngayHuy;
		this.nhanVien = nhanVien;
		this.listChiTietPhieuHuy = new ArrayList<ChiTietPhieuHuy>();
	}

	@Override
	public String toString() {
		return "PhieuHuy [maPhieuHuy=" + maPhieuHuy + ", ngayHuy=" + ngayHuy + ", nhanVien=" + nhanVien + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((maPhieuHuy == null) ? 0 : maPhieuHuy.hashCode());
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
		PhieuHuy other = (PhieuHuy) obj;
		if (maPhieuHuy == null) {
			if (other.maPhieuHuy != null)
				return false;
		} else if (!maPhieuHuy.equals(other.maPhieuHuy))
			return false;
		return true;
	}

	public boolean themChiTietPhieuHuy(ChiTietPhieuHuy ctph) {
		if (!this.listChiTietPhieuHuy.contains(ctph)) {
			this.listChiTietPhieuHuy.add(ctph);
			return true;
		} else {
			return false;
		}
	}
	
	public boolean xoaChiTietPhieuHuy(int index) {
		try {
			this.listChiTietPhieuHuy.remove(index);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	public boolean suaChiTietHoaDon(int soLuong, int index) {
		try {
			this.listChiTietPhieuHuy.get(index).setSoLuong(soLuong);
			return true;	
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
}
