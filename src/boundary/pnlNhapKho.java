package boundary;

import javax.swing.JPanel;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.SystemColor;
import javax.swing.border.TitledBorder;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

import java.awt.Color;
import javax.swing.JTextField;
import javax.swing.JComboBox;
import javax.swing.JCheckBox;
import javax.swing.JScrollBar;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.text.JTextComponent;
import javax.swing.border.BevelBorder;
import javax.swing.border.LineBorder;
import javax.swing.AbstractListModel;
import javax.swing.JScrollPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.util.Date;
import java.util.UUID;
import java.util.Vector;
import java.awt.event.ActionEvent;
import com.toedter.calendar.JDateChooser;

import control.DAOLoThuoc;
import control.DAONhanVien;
import control.DAOPhieuNhap;
import control.DAOThuoc;
import entity.LoThuoc;
import entity.NhanVien;
import entity.PhieuNhap;
import entity.Thuoc;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Timestamp;

public class pnlNhapKho extends JPanel {
	private JTextField txtDonGia;
	private JTextField txtSoLuong;
	private JTextField textField_8;
	private DefaultTableModel loThuocModel;
	private JTable tblLoThuoc;
	private JTextField txtTenSanPham;
	private JTextComponent tc;
	private JButton btnThemLoThuoc;
	private JDateChooser dateNgayHetHan;
	private JDateChooser dateNgaySanXuat;
	private JComboBox cbxMaSanPham;
	private Vector maThuocModel;
	private PhieuNhap phieuNhap;
	private NhanVien nhanVienBanHang;
	private JLabel lblTongTien;

	/**
	 * Create the panel.
	 */
	public pnlNhapKho(String userName) {
		nhanVienBanHang = new NhanVien(new DAONhanVien().getInforNhanVien(userName).getMaNhanVien());
		setBackground(new Color(255, 240, 245));
		setForeground(new Color(255, 228, 225));
		setLayout(null);

		JLabel lblNewLabel = new JLabel("PHI\u1EBEU NH\u1EACP");
		lblNewLabel.setBounds(32, 23, 291, 24);
		lblNewLabel.setForeground(SystemColor.infoText);
		lblNewLabel.setFont(new Font("Times New Roman", Font.PLAIN, 22));
		add(lblNewLabel);

		JPanel panel = new JPanel();
		panel.setBounds(26, 58, 809, 154);
		panel.setBackground(new Color(255, 250, 205));
		panel.setBorder(new TitledBorder(null, "Th\u00F4ng Tin Phi\u1EBFu", TitledBorder.LEADING, TitledBorder.TOP,
				null, SystemColor.textHighlight));
		add(panel);
		panel.setLayout(null);

		JLabel lblNewLabel_1 = new JLabel("Mã thuốc");
		lblNewLabel_1.setBounds(10, 31, 54, 22);
		panel.add(lblNewLabel_1);

		JLabel lblNewLabel_1_3 = new JLabel("Số lượng");
		lblNewLabel_1_3.setBounds(10, 64, 54, 22);
		panel.add(lblNewLabel_1_3);

		JLabel lblNewLabel_1_4_1 = new JLabel("Đơn giá");
		lblNewLabel_1_4_1.setBounds(10, 100, 54, 22);
		panel.add(lblNewLabel_1_4_1);

		txtDonGia = new JTextField();
		txtDonGia.setBounds(74, 101, 148, 21);
		panel.add(txtDonGia);
		txtDonGia.setColumns(10);

		txtSoLuong = new JTextField();
		txtSoLuong.setBounds(74, 65, 148, 20);
		panel.add(txtSoLuong);
		txtSoLuong.setColumns(10);
		maThuocModel = new Vector();
		cbxMaSanPham = new JComboBox(maThuocModel);
		cbxMaSanPham.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				txtTenSanPham
						.setText(new DAOThuoc().getThuocBan(cbxMaSanPham.getSelectedItem().toString()).getTenThuoc());
				txtDonGia.setText(new DAOThuoc().getThuocBan(cbxMaSanPham.getSelectedItem().toString()).getGia() + "");
			}
		});
		cbxMaSanPham.setEditable(true);
		cbxMaSanPham.setBounds(74, 31, 148, 22);
		panel.add(cbxMaSanPham);

		tc = (JTextComponent) cbxMaSanPham.getEditor().getEditorComponent();
		tc.getDocument().addDocumentListener(new DocumentListener() {

			@Override
			public void insertUpdate(DocumentEvent e) {
				// TODO Auto-generated method
				maThuocModel.clear();
				Vector a = new DAOThuoc().getIdThuoc(tc.getText());
				for (int i = 0; i < a.size(); i++) {
					maThuocModel.add(a.get(i).toString());
				}
			}

			@Override
			public void removeUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				maThuocModel.clear();
				Vector a = new DAOThuoc().getIdThuoc(tc.getText());
				for (int i = 0; i < a.size(); i++) {
					maThuocModel.add(a.get(i).toString());
				}

			}

			@Override
			public void changedUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				maThuocModel.clear();
				Vector a = new DAOThuoc().getIdThuoc(tc.getText());
				for (int i = 0; i < a.size(); i++) {
					maThuocModel.add(a.get(i).toString());
				}
			}
		});

		txtTenSanPham = new JTextField();
		txtTenSanPham.setEditable(false);
		txtTenSanPham.setBounds(232, 32, 266, 20);
		panel.add(txtTenSanPham);
		txtTenSanPham.setColumns(10);

		JLabel lblNewLabel_2 = new JLabel("Ngày sản xuất");
		lblNewLabel_2.setBounds(232, 68, 83, 14);
		panel.add(lblNewLabel_2);

		JLabel lblNewLabel_2_1 = new JLabel("Ngày Hết Hạn");
		lblNewLabel_2_1.setBounds(232, 104, 83, 14);
		panel.add(lblNewLabel_2_1);

		dateNgaySanXuat = new JDateChooser();
		dateNgaySanXuat.setBounds(325, 64, 173, 20);
		panel.add(dateNgaySanXuat);

		dateNgayHetHan = new JDateChooser();
		dateNgayHetHan.setBounds(325, 102, 173, 20);
		panel.add(dateNgayHetHan);

		btnThemLoThuoc = new JButton("Thêm");
		btnThemLoThuoc.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				if (!kiemTraMaThuoc())
					return;
				if (!kiemTraNhapSo(txtSoLuong))
					return;
				if (!kiemTraNhapSo(txtDonGia))
					return;
				if (!kiemTraNgay(dateNgaySanXuat))
					return;
				if (!kiemTraNgay(dateNgayHetHan))
					return;

				LoThuoc loThuoc = new LoThuoc();
				Thuoc thuoc = new Thuoc();
				thuoc.setMaThuoc(tc.getText());
				loThuoc.setThuoc(thuoc);
				loThuoc.setSoLuong(Integer.parseInt(txtSoLuong.getText()));
				loThuoc.setDonGia(Double.parseDouble(txtDonGia.getText()));
				loThuoc.setNgaySanXuat(new java.sql.Date(dateNgaySanXuat.getDate().getTime()));
				loThuoc.setNgayHetHan(new java.sql.Date(dateNgayHetHan.getDate().getTime()));

				if (loThuocModel.getRowCount() <= 0) {
					phieuNhap = new PhieuNhap();
					phieuNhap.setMaPhieuNhap(UUID.randomUUID().toString());
					phieuNhap.setNgayNhap(new Timestamp(new Date().getTime()));
					phieuNhap.setNhanVien(nhanVienBanHang);
					loThuocModel.setRowCount(0);
					phieuNhap.getLoThuocs().add(loThuoc);
					loThuocModel.addRow(new Object[] { loThuocModel.getRowCount(), tc.getText(),
							dateNgaySanXuat.getDate().toString(), dateNgayHetHan.getDate().toString(),
							txtSoLuong.getText(), txtDonGia.getText(), loThuoc.tinhTongTienLoThuoc() });

					lblTongTien.setText(phieuNhap.tinhTongGiaNhap() + "");
					tc.setText("");
					txtTenSanPham.setText("");
					txtSoLuong.setText("");
					txtDonGia.setText("");

				} else {
					if (!kiemTraChiTietHoaDonTonTai()) {
						phieuNhap.getLoThuocs().add(loThuoc);
						loThuocModel.addRow(new Object[] { loThuocModel.getRowCount(), tc.getText(),
								dateNgaySanXuat.getDate().toString(), dateNgayHetHan.getDate().toString(),
								txtSoLuong.getText(), txtDonGia.getText(), loThuoc.tinhTongTienLoThuoc() });
						lblTongTien.setText(phieuNhap.tinhTongGiaNhap() + "");
						tc.setText("");
						txtTenSanPham.setText("");
						txtSoLuong.setText("");
						txtDonGia.setText("");
					} else {
						int count = 0;
						for (LoThuoc lt : phieuNhap.getLoThuocs()) {
							if (lt.getThuoc().getMaThuoc().equals(tc.getText())) {
								break;
							}
							count++;
						}
						int soLuongMoi = Integer.parseInt(tblLoThuoc.getValueAt(count, 4).toString())
								+ loThuoc.getSoLuong();
						tblLoThuoc.setValueAt(soLuongMoi, count, 4);
						phieuNhap.getLoThuocs().get(count).setSoLuong(soLuongMoi);
						tblLoThuoc.setValueAt(phieuNhap.getLoThuocs().get(count).tinhTongTienLoThuoc(), count, 6);
						lblTongTien.setText(phieuNhap.tinhTongGiaNhap() + "");
						tc.setText("");
						txtTenSanPham.setText("");
						txtSoLuong.setText("");
						txtDonGia.setText("");
						
					}

				}

			}
		});
		btnThemLoThuoc.setBounds(508, 31, 291, 55);
		panel.add(btnThemLoThuoc);

		JLabel lblNewLabel_3 = new JLabel("Tổng tiền:");
		lblNewLabel_3.setBounds(508, 104, 62, 14);
		panel.add(lblNewLabel_3);

		lblTongTien = new JLabel("0đ");
		lblTongTien.setBounds(580, 104, 219, 14);
		panel.add(lblTongTien);

		textField_8 = new JTextField();
		textField_8.setBounds(76, 574, 211, 20);
		add(textField_8);
		textField_8.setColumns(10);

		JLabel lblNewLabel_1_2_1 = new JLabel("Ghi ch\u00FA");
		lblNewLabel_1_2_1.setBounds(31, 573, 54, 22);
		add(lblNewLabel_1_2_1);

		JButton btnInPhiu = new JButton(" In phi\u1EBFu");
		btnInPhiu.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				new DAOPhieuNhap().themMoiPhieuNhap(phieuNhap);
				for (LoThuoc lt : phieuNhap.getLoThuocs()) {
					new DAOLoThuoc().themLoThuocMoi(phieuNhap.getMaPhieuNhap(), lt);
					new DAOThuoc().updateSoLuongThuoc(lt.getSoLuong(), lt.getThuoc().getMaThuoc());
				}
				JOptionPane.showMessageDialog(null, "Nhập hàng thành công!");
				loThuocModel.setRowCount(0);
				tc.setText("");
				txtTenSanPham.setText("");
				txtSoLuong.setText("");
				txtDonGia.setText("");
				lblTongTien.setText("0đ");
			}
		});
		btnInPhiu.setBounds(440, 573, 197, 23);
		add(btnInPhiu);

		JButton btnXa = new JButton("X\u00F3a");
		btnXa.setBounds(647, 573, 89, 23);
		add(btnXa);

		JButton btnSa = new JButton("S\u1EEDa");
		btnSa.setBounds(746, 573, 89, 23);
		add(btnSa);

		String[] colHead = { "STT", "Mã thuốc", "Ngày sản xuất", "Ngày hết hạn", "Số lượng", "Đơn giá", "Tổng tiền" };

		loThuocModel = new DefaultTableModel(colHead, 0);
		tblLoThuoc = new JTable(loThuocModel);

		JScrollPane scrollPane = new JScrollPane(tblLoThuoc);
		scrollPane.setBounds(32, 226, 803, 337);
		add(scrollPane);

	}

	public boolean kiemTraMaThuoc() {
		if (!new DAOThuoc().kiemTraMaThuoc(tc.getText())) {
			JOptionPane.showMessageDialog(null, "Mã thuốc không tồn tại");
			return false;
		}
		return true;
	}

	public boolean kiemTraNhapSo(JTextField txt) {
		try {
			Double.parseDouble(txt.getText());
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			JOptionPane.showMessageDialog(null, "Vui lòng nhập đúng định dạng số!");
			return false;
		}
	}

	public boolean kiemTraNgay(JDateChooser txt) {
		try {
			txt.getDate().toString();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			JOptionPane.showMessageDialog(null, "Vui lòng chọn ngày");
			return false;
		}
	}

	public boolean kiemTraChiTietHoaDonTonTai() {
		for (LoThuoc lt : phieuNhap.getLoThuocs()) {
			if (lt.getThuoc().getMaThuoc().equals(tc.getText())) {
				return true;
			}
		}
		return false;
	}
}
