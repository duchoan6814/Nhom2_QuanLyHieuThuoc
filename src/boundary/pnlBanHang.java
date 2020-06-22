package boundary;

import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Color;
import java.awt.Component;

import javax.swing.border.TitledBorder;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.text.BadLocationException;
import javax.swing.text.JTextComponent;

import control.DAOThuoc;
import entity.ChiTietHoaDon;
import entity.HoaDon;
import entity.Thuoc;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;
import java.util.Vector;
import java.util.concurrent.atomic.AtomicLong;
import java.awt.BorderLayout;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.ComboBoxModel;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import java.awt.Dimension;
import javax.swing.JComboBox;
import javax.swing.border.LineBorder;
import javax.swing.JScrollPane;
import javax.swing.border.EtchedBorder;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class pnlBanHang extends JPanel implements DocumentListener, ActionListener {
	private JTextField txtMaKhachHang;
	private JTextField txtSoLuong;
	private JTextField txtDonViTinh;
	private JTextField txtDonGia;
	private JTable tblBanHang;
	private TableModel modelSanPham;
	private DAOThuoc ctrlThuoc = new DAOThuoc();
	private Vector maThuocModel;
	private JTextComponent tc;
	private JComboBox cbxMaSanPham;
	private JTextField txtTenSanPham;
	private JButton btnThem;
	private HoaDon hoaDon;
	private static AtomicLong idCounter = new AtomicLong();
	private int count = 0;
	private JButton btnXoa;
	private JLabel lblTongTien;
	private JLabel lblThanhTien;

	/**
	 * Create the panel.
	 */
	public pnlBanHang() {
		setBackground(new Color(248, 243, 235));
		setLayout(null);

		JPanel pnlNhapLieu = new JPanel();
		pnlNhapLieu.setBackground(Color.WHITE);
		pnlNhapLieu.setBorder(new TitledBorder(
				new EtchedBorder(EtchedBorder.LOWERED, new Color(255, 255, 255), new Color(160, 160, 160)),
				"Kh\u00E1ch h\u00E0ng", TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 0, 0)));
		pnlNhapLieu.setBounds(10, 417, 409, 177);
		add(pnlNhapLieu);
		pnlNhapLieu.setLayout(null);

		txtMaKhachHang = new JTextField();
		txtMaKhachHang.setBounds(10, 53, 274, 27);
		pnlNhapLieu.add(txtMaKhachHang);
		txtMaKhachHang.setColumns(10);

		JButton btnMaKhachHang = new JButton("Tìm");
		btnMaKhachHang.setBackground(Color.PINK);
		btnMaKhachHang.setBounds(294, 53, 105, 27);
		pnlNhapLieu.add(btnMaKhachHang);

		JLabel lblTenKhachHang = new JLabel("Khách Hàng: Trương Đức Hoàn");
		lblTenKhachHang.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblTenKhachHang.setBounds(10, 103, 389, 14);
		pnlNhapLieu.add(lblTenKhachHang);

		JLabel lblDiemTichLuy = new JLabel("Điểm tích lũy: 10000");
		lblDiemTichLuy.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblDiemTichLuy.setBounds(10, 128, 389, 14);
		pnlNhapLieu.add(lblDiemTichLuy);

		JLabel lblMaKhachHang = new JLabel("Mã khách hàng");
		lblMaKhachHang.setBounds(10, 38, 129, 14);
		pnlNhapLieu.add(lblMaKhachHang);

		JPanel pnlThanhTien = new JPanel();
		pnlThanhTien.setBackground(Color.WHITE);
		pnlThanhTien.setBorder(
				new TitledBorder(null, "Th\u00E0nh ti\u1EC1n", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		pnlThanhTien.setBounds(438, 417, 409, 177);
		add(pnlThanhTien);
		pnlThanhTien.setLayout(null);

		JLabel lblNewLabel = new JLabel("Tổng tiền:");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblNewLabel.setBounds(10, 22, 80, 20);
		pnlThanhTien.add(lblNewLabel);

		JLabel lblNewLabel_1 = new JLabel("Thuế:");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblNewLabel_1.setBounds(10, 53, 46, 20);
		pnlThanhTien.add(lblNewLabel_1);

		JLabel lblNewLabel_2 = new JLabel("Thành tiền:");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblNewLabel_2.setBounds(10, 84, 87, 20);
		pnlThanhTien.add(lblNewLabel_2);

		JButton btnNewButton = new JButton("Thanh Toán");
		btnNewButton.setBackground(Color.PINK);
		btnNewButton.setFont(new Font("Tahoma", Font.PLAIN, 15));
		btnNewButton.setBounds(10, 115, 389, 33);
		pnlThanhTien.add(btnNewButton);

		lblTongTien = new JLabel("0đ ");
		lblTongTien.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblTongTien.setBounds(102, 23, 126, 19);
		pnlThanhTien.add(lblTongTien);

		JLabel lblNewLabel_4 = new JLabel("3%");
		lblNewLabel_4.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblNewLabel_4.setBounds(102, 54, 46, 19);
		pnlThanhTien.add(lblNewLabel_4);

		lblThanhTien = new JLabel("0đ");
		lblThanhTien.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblThanhTien.setBounds(102, 84, 297, 19);
		pnlThanhTien.add(lblThanhTien);

		JPanel pnlCenter = new JPanel();
		pnlCenter.setBorder(new LineBorder(Color.LIGHT_GRAY));
		pnlCenter.setBackground(Color.WHITE);
		pnlCenter.setBounds(10, 44, 837, 362);
		add(pnlCenter);
		pnlCenter.setLayout(new BorderLayout(0, 0));

		JPanel pnlCenterTop = new JPanel();
		pnlCenterTop.setBackground(new Color(255, 211, 182));
		pnlCenterTop.setPreferredSize(new Dimension(10, 50));
		pnlCenter.add(pnlCenterTop, BorderLayout.NORTH);
		pnlCenterTop.setLayout(null);

		maThuocModel = new Vector();
		cbxMaSanPham = new JComboBox(maThuocModel);
		cbxMaSanPham.setEditable(true);
		cbxMaSanPham.setBackground(Color.WHITE);
		cbxMaSanPham.setBounds(10, 22, 158, 22);
		tc = (JTextComponent) cbxMaSanPham.getEditor().getEditorComponent();
		tc.getDocument().addDocumentListener(this);
		cbxMaSanPham.addActionListener(this);
		pnlCenterTop.add(cbxMaSanPham);

		JLabel lblMaSanPham = new JLabel("Mã sản phẩm");
		lblMaSanPham.setBounds(10, 4, 83, 14);
		pnlCenterTop.add(lblMaSanPham);

		JLabel lblTenSanPham = new JLabel("Tên sản phẩm");
		lblTenSanPham.setBounds(178, 4, 83, 14);
		pnlCenterTop.add(lblTenSanPham);

		txtSoLuong = new JTextField();
		txtSoLuong.setBounds(346, 24, 86, 20);
		pnlCenterTop.add(txtSoLuong);
		txtSoLuong.setText("1");
		txtSoLuong.setColumns(10);

		JLabel lblSoLuong = new JLabel("Số lượng");
		lblSoLuong.setBounds(346, 5, 56, 14);
		pnlCenterTop.add(lblSoLuong);

		txtDonViTinh = new JTextField();
		txtDonViTinh.setEditable(false);
		txtDonViTinh.setBounds(442, 24, 86, 20);
		pnlCenterTop.add(txtDonViTinh);
		txtDonViTinh.setColumns(10);

		JLabel lblDonViTinh = new JLabel("Đơn vị tính");
		lblDonViTinh.setBounds(442, 5, 62, 14);
		pnlCenterTop.add(lblDonViTinh);

		txtDonGia = new JTextField();
		txtDonGia.setEditable(false);
		txtDonGia.setBounds(538, 24, 86, 20);
		pnlCenterTop.add(txtDonGia);
		txtDonGia.setColumns(10);

		JLabel lblDonGia = new JLabel("Đơn giá");
		lblDonGia.setBounds(538, 5, 46, 14);
		pnlCenterTop.add(lblDonGia);

		btnThem = new JButton("Thêm");
		btnThem.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				if (!validateMaThuoc()) {
					return;
				}
				if (!validateSoLuong()) {
					return;
				}
				if (modelSanPham.getRowCount() == 0) {
					hoaDon = new HoaDon(UUID.randomUUID().toString(), 0.03, new Date());

					if (ctrlThuoc.kiemTraSoLuong(Integer.parseInt(txtSoLuong.getText()),
							cbxMaSanPham.getSelectedItem().toString())) {
						Thuoc thuocTemp = new Thuoc();
						thuocTemp.setMaThuoc(cbxMaSanPham.getSelectedItem().toString());
						thuocTemp.setTenThuoc(txtTenSanPham.getText());
						thuocTemp.setDonViTinh(txtDonViTinh.getText());
						thuocTemp.setGia(Double.parseDouble(txtDonGia.getText()));

						ChiTietHoaDon a = new ChiTietHoaDon(thuocTemp, Double.parseDouble(txtDonGia.getText()),
								Integer.parseInt(txtSoLuong.getText()));

						((DefaultTableModel) modelSanPham).addRow(new Object[] { modelSanPham.getRowCount(),
								a.getThuoc().getMaThuoc(), a.getThuoc().getTenThuoc(), a.getThuoc().getDonViTinh(),
								a.getSoLuong(), a.getGiaBan(), a.tinhTongTienChiTietHoaDon() });

						hoaDon.getListChiTietHoaDon().add(a);
						System.out.println(hoaDon);
						txtSoLuong.setText("1");
						lblTongTien.setText(Double.toString(hoaDon.tinhTongTienHoaDon()));
						lblThanhTien.setText(Double.toString(hoaDon.tinhThanhTienHoaDon()));
						txtTenSanPham.setText("");
						txtDonGia.setText("");
						txtDonViTinh.setText("");
						cbxMaSanPham.getEditor().setItem("");
					} else {

						JOptionPane.showMessageDialog(null,
								"Số lượng trong kho không đủ chỉ còn "
										+ ctrlThuoc.getSoLuongConLaiTrongKho(cbxMaSanPham.getSelectedItem().toString())
										+ " sản phẩm!");

					}

				} else {
					if (kiemTraChiTietHoaDonTonTai(cbxMaSanPham.getSelectedItem().toString(),
							hoaDon.getListChiTietHoaDon())) {
						if (ctrlThuoc.kiemTraSoLuong(Integer.parseInt(txtSoLuong.getText()),
								cbxMaSanPham.getSelectedItem().toString())) {
							Thuoc thuocTemp = new Thuoc();
							thuocTemp.setMaThuoc(cbxMaSanPham.getSelectedItem().toString());
							thuocTemp.setTenThuoc(txtTenSanPham.getText());
							thuocTemp.setDonViTinh(txtDonViTinh.getText());
							thuocTemp.setGia(Double.parseDouble(txtDonGia.getText()));

							ChiTietHoaDon a = new ChiTietHoaDon(thuocTemp, Double.parseDouble(txtDonGia.getText()),
									Integer.parseInt(txtSoLuong.getText()));

							((DefaultTableModel) modelSanPham).addRow(new Object[] { modelSanPham.getRowCount(),
									a.getThuoc().getMaThuoc(), a.getThuoc().getTenThuoc(), a.getThuoc().getDonViTinh(),
									a.getSoLuong(), a.getGiaBan(), a.tinhTongTienChiTietHoaDon() });

							hoaDon.getListChiTietHoaDon().add(a);
							System.out.println(hoaDon);
							txtSoLuong.setText("1");
							lblTongTien.setText(Double.toString(hoaDon.tinhTongTienHoaDon()));
							lblThanhTien.setText(Double.toString(hoaDon.tinhThanhTienHoaDon()));
							txtTenSanPham.setText("");
							txtDonGia.setText("");
							txtDonViTinh.setText("");
							cbxMaSanPham.getEditor().setItem("");
						} else {

							JOptionPane.showMessageDialog(null, "Số lượng trong kho không đủ chỉ còn "
									+ ctrlThuoc.getSoLuongConLaiTrongKho(cbxMaSanPham.getSelectedItem().toString())
									+ " sản phẩm!");

						}
					} else {
						int count = 0;
						for (ChiTietHoaDon chiTietHoaDon : hoaDon.getListChiTietHoaDon()) {
							if (chiTietHoaDon.getThuoc().getMaThuoc()
									.equals(cbxMaSanPham.getSelectedItem().toString())) {
								break;
							}
							count++;
						}
						int soLuongMoi = Integer.parseInt(modelSanPham.getValueAt(count, 4).toString())
								+ Integer.parseInt(txtSoLuong.getText());
						System.out.println(soLuongMoi);
						modelSanPham.setValueAt(soLuongMoi, count, 4);
						hoaDon.getListChiTietHoaDon().get(count).setSoLuong(soLuongMoi);
						modelSanPham.setValueAt(hoaDon.getListChiTietHoaDon().get(count).tinhTongTienChiTietHoaDon(),
								count, 6);
					}
				}

			}
		});
		btnThem.setBackground(Color.PINK);
		btnThem.setBounds(634, 4, 89, 40);
		pnlCenterTop.add(btnThem);

		txtTenSanPham = new JTextField();
		txtTenSanPham.setEditable(false);
		txtTenSanPham.setBounds(178, 23, 158, 20);
		pnlCenterTop.add(txtTenSanPham);
		txtTenSanPham.setColumns(10);

		btnXoa = new JButton("Xóa");
		btnXoa.setBackground(Color.PINK);
		btnXoa.setBounds(733, 4, 89, 40);
		btnXoa.addActionListener(this);
		pnlCenterTop.add(btnXoa);

		JPanel pnlCenterCenter = new JPanel();
		pnlCenterCenter.setBackground(Color.WHITE);
		pnlCenter.add(pnlCenterCenter, BorderLayout.CENTER);
		pnlCenterCenter.setLayout(null);

		JScrollPane scrTableBanHang = new JScrollPane();
		scrTableBanHang.setBackground(Color.WHITE);
		scrTableBanHang.setBounds(0, 0, 835, 310);
		pnlCenterCenter.add(scrTableBanHang);

		String[] colHeader = { "STT", "Mã sản phẩm", "Tên sản phẩm", "Đơn vị", "Số lượng", "Giá bán", "Tổng tiền" };
		modelSanPham = new DefaultTableModel(colHeader, 0);
		tblBanHang = new JTable(modelSanPham);
		tblBanHang.setGridColor(Color.GRAY);
		tblBanHang.setBackground(Color.WHITE);
		scrTableBanHang.setViewportView(tblBanHang);

		JLabel lblTitle = new JLabel("Bán Hàng");
		lblTitle.setFont(new Font("Tahoma", Font.PLAIN, 25));
		lblTitle.setBounds(374, 0, 108, 43);
		add(lblTitle);

	}

	@Override
	public void insertUpdate(DocumentEvent e) {
		// TODO Auto-generated method
		maThuocModel.clear();
		Vector a = ctrlThuoc.getIdThuoc(tc.getText());
		for (int i = 0; i < a.size(); i++) {
			maThuocModel.add(a.get(i).toString());
		}
	}

	@Override
	public void removeUpdate(DocumentEvent e) {
		// TODO Auto-generated method stub
		maThuocModel.clear();
		Vector a = ctrlThuoc.getIdThuoc(tc.getText());
		for (int i = 0; i < a.size(); i++) {
			maThuocModel.add(a.get(i).toString());
		}

	}

	@Override
	public void changedUpdate(DocumentEvent e) {
		// TODO Auto-generated method stub
		maThuocModel.clear();
		Vector a = ctrlThuoc.getIdThuoc(tc.getText());
		for (int i = 0; i < a.size(); i++) {
			maThuocModel.add(a.get(i).toString());
		}
	}

	public boolean validateMaThuoc() {
		if (txtTenSanPham.getText().contentEquals("")) {
			JOptionPane.showMessageDialog(this, "Vui Lòng chọn thuốc!");
			return false;
		} else {
			if (!ctrlThuoc.kiemTraMaThuoc(tc.getText())) {
				JOptionPane.showMessageDialog(this, "Mã thuốc không đúng!");
				return false;
			} else {
				return true;
			}
		}
	}

	public boolean validateSoLuong() {
		if ("".equals(txtSoLuong.getText())) {
			JOptionPane.showMessageDialog(this, "Nhập số lượng!");
			return false;
		} else {
			try {
				Integer.parseInt(txtSoLuong.getText());
				return true;
			} catch (Exception e) {
				// TODO: handle exception
				JOptionPane.showMessageDialog(this, "Vui lòng nhập số!");
				return false;
			}
		}

	}

	public boolean kiemTraChiTietHoaDonTonTai(String maThuoc, ArrayList<ChiTietHoaDon> arr) {
		for (ChiTietHoaDon chiTietHoaDon : arr) {
			if (chiTietHoaDon.getThuoc().getMaThuoc().equals(maThuoc)) {
				return false;
			}
		}
		return true;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object obj = e.getSource();
		if (obj.equals(cbxMaSanPham)) {
			Thuoc a = ctrlThuoc.getThuocBan(cbxMaSanPham.getSelectedItem().toString());
			txtTenSanPham.setText(a.getTenThuoc());
			txtDonViTinh.setText(a.getDonViTinh());
			double donGiaBan = a.getGia() * 1.3;
			txtDonGia.setText(Double.toString(donGiaBan));
		}

		if (obj.equals(btnXoa)) {
			int index = tblBanHang.getSelectedRow();
			if (index < 0) {
				JOptionPane.showMessageDialog(this, "Vui lòng chọn dòng cần xóa!");
			} else {
				int i = JOptionPane.showConfirmDialog(this, "Bạn có chắc muốn xóa!");
				if (i == 0) {
					((DefaultTableModel) modelSanPham).removeRow(index);
					hoaDon.xoaChiTietHoaDon(index);
					lblTongTien.setText(Double.toString(hoaDon.tinhTongTienHoaDon()));
					lblThanhTien.setText(Double.toString(hoaDon.tinhThanhTienHoaDon()));
				}
			}
		}
	}
}
