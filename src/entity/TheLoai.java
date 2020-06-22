package entity;

public class TheLoai {
	private String maTheLoai, tenTheLoai, moTa;

	public String getMaTheLoai() {
		return maTheLoai;
	}

	public void setMaTheLoai(String maTheLoai) {
		this.maTheLoai = maTheLoai;
	}

	public String getTenTheLoai() {
		return tenTheLoai;
	}

	public void setTenTheLoai(String tenTheLoai) {
		this.tenTheLoai = tenTheLoai;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public TheLoai(String maTheLoai, String tenTheLoai, String moTa) {
		super();
		this.maTheLoai = maTheLoai;
		this.tenTheLoai = tenTheLoai;
		this.moTa = moTa;
	}

	@Override
	public String toString() {
		return "TheLoai [maTheLoai=" + maTheLoai + ", tenTheLoai=" + tenTheLoai + ", moTa=" + moTa + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((maTheLoai == null) ? 0 : maTheLoai.hashCode());
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
		TheLoai other = (TheLoai) obj;
		if (maTheLoai == null) {
			if (other.maTheLoai != null)
				return false;
		} else if (!maTheLoai.equals(other.maTheLoai))
			return false;
		return true;
	}

	
	
}
