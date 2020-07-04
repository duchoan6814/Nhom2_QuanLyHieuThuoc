package boundary;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

import control.DAOChiTietHoaDon;
import control.DAOHoaDon;
import control.DAOKhachHang;
import entity.ChiTietHoaDon;
import entity.HoaDon;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import java.text.NumberFormat;
import java.util.Locale;
import java.awt.Color;
import javax.swing.JTextField;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class DialogThanhToan extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private JTextField txtSoTienKhachDua;
	private JTextField txtSuDungDiem;
	private double soTienKhachDua;
	private boolean checkThanhToan = false;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			DialogThanhToan dialog = new DialogThanhToan(null);
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public DialogThanhToan(HoaDon hoaDon) {
		setBounds(100, 100, 518, 590);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBackground(Color.PINK);
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		JLabel lblTitle = new JLabel("Thanh toán");
		lblTitle.setFont(new Font("Tahoma", Font.PLAIN, 43));
		lblTitle.setBounds(142, 11, 217, 59);
		contentPanel.add(lblTitle);

		JPanel panel = new JPanel();
		panel.setForeground(Color.YELLOW);
		panel.setBounds(0, 100, 502, 62);
		contentPanel.add(panel);
		panel.setLayout(null);

		JLabel lblThanhTien = new JLabel("Thành tiền: ");
		lblThanhTien.setFont(new Font("Tahoma", Font.PLAIN, 28));
		lblThanhTien.setBounds(10, 17, 153, 27);

		panel.add(lblThanhTien);

		JLabel lblSoTienPhaiTra = new JLabel("0đ");
		lblSoTienPhaiTra.setForeground(Color.RED);
		lblSoTienPhaiTra.setFont(new Font("Tahoma", Font.PLAIN, 33));
		lblSoTienPhaiTra.setBounds(173, 13, 319, 31);
		lblSoTienPhaiTra.setText(chuyenDoiDinhDangTienTe(hoaDon.tinhThanhTienHoaDon()));
		panel.add(lblSoTienPhaiTra);

		JPanel panel_1 = new JPanel();
		panel_1.setLayout(null);
		panel_1.setForeground(Color.YELLOW);
		panel_1.setBounds(0, 173, 502, 62);
		contentPanel.add(panel_1);

		JLabel lblTienThua = new JLabel("Tiền trả lại khách:");
		lblTienThua.setFont(new Font("Tahoma", Font.PLAIN, 28));
		lblTienThua.setBounds(10, 17, 237, 27);
		panel_1.add(lblTienThua);

		JLabel lblTienThoi = new JLabel("Null");
		lblTienThoi.setForeground(Color.RED);
		lblTienThoi.setFont(new Font("Tahoma", Font.PLAIN, 33));
		lblTienThoi.setBounds(248, 13, 244, 31);
		panel_1.add(lblTienThoi);

		JPanel panel_1_1 = new JPanel();
		panel_1_1.setLayout(null);
		panel_1_1.setForeground(Color.YELLOW);
		panel_1_1.setBounds(0, 246, 502, 62);
		contentPanel.add(panel_1_1);

		JLabel lblTienKhachDua = new JLabel("Khách đưa:");
		lblTienKhachDua.setFont(new Font("Tahoma", Font.PLAIN, 28));
		lblTienKhachDua.setBounds(10, 17, 151, 27);
		panel_1_1.add(lblTienKhachDua);

		txtSoTienKhachDua = new JTextField();
		txtSoTienKhachDua.getDocument().addDocumentListener(new DocumentListener() {

			@Override
			public void removeUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				try {
					soTienKhachDua = Double.parseDouble(txtSoTienKhachDua.getText());
					lblTienThoi.setText(chuyenDoiDinhDangTienTe(soTienKhachDua - hoaDon.tinhThanhTienHoaDon()));
				} catch (Exception e1) {
					// TODO: handle exception
					JOptionPane.showMessageDialog(null, "Phải nhập số!");
					txtSoTienKhachDua.setText("");
				}
			}

			@Override
			public void insertUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				try {
					double a = Double.parseDouble(txtSoTienKhachDua.getText());
					lblTienThoi.setText(chuyenDoiDinhDangTienTe(a - hoaDon.tinhThanhTienHoaDon()));
				} catch (Exception e1) {
					// TODO: handle exception
					JOptionPane.showMessageDialog(null, "Phải nhập số!");
					txtSoTienKhachDua.setText("");
				}

			}

			@Override
			public void changedUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub

			}
		});
		txtSoTienKhachDua.setBorder(new EmptyBorder(0, 0, 0, 0));
		txtSoTienKhachDua.setBackground(Color.WHITE);
		txtSoTienKhachDua.setForeground(Color.RED);
		txtSoTienKhachDua.setFont(new Font("Tahoma", Font.PLAIN, 33));
		txtSoTienKhachDua.setBounds(169, 14, 323, 33);
		panel_1_1.add(txtSoTienKhachDua);
		txtSoTienKhachDua.setColumns(10);

		JButton btnThanhToan = new JButton("Thanh Toán");
		btnThanhToan.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				double a;
				try {
					a = Double.parseDouble(txtSoTienKhachDua.getText());
				} catch (Exception e2) {
					// TODO: handle exception
					a = 0;
				}
				if (a < hoaDon.tinhThanhTienHoaDon()) {
					JOptionPane.showMessageDialog(null, "Khách chưa đưa đủ tiền!");
				} else {
					if (!new DAOHoaDon().insertHoaDon(hoaDon)) {
						JOptionPane.showMessageDialog(null, "error");
					}
					for (ChiTietHoaDon i : hoaDon.getListChiTietHoaDon()) {
						new DAOChiTietHoaDon().insertChiTietHoaDon(hoaDon.getMaHD(), i);
					}
					if (hoaDon.getKhachHang() != null) {
						new DAOKhachHang().setDiemTichLuy(hoaDon.getDiemSuDung(), hoaDon.getKhachHang().getMaKH(), hoaDon.tinhThanhTienHoaDon() + hoaDon.getDiemSuDung());
					}
					setCheckThanhToan(true);
					JOptionPane.showMessageDialog(null, "Thanh toán thành công.");
					dispose();
				}

			}
		});
		btnThanhToan.setBackground(new Color(30, 144, 255));
		btnThanhToan.setForeground(new Color(0, 0, 0));
		btnThanhToan.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnThanhToan.setBounds(71, 472, 168, 68);
		contentPanel.add(btnThanhToan);

		JButton btnHuy = new JButton("Hủy");
		btnHuy.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				dispose();
			}
		});
		btnHuy.setBackground(new Color(255, 69, 0));
		btnHuy.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnHuy.setBounds(280, 472, 168, 68);
		contentPanel.add(btnHuy);

		JPanel panel_1_1_1 = new JPanel();
		panel_1_1_1.setLayout(null);
		panel_1_1_1.setForeground(Color.YELLOW);
		panel_1_1_1.setBounds(0, 392, 502, 62);
		contentPanel.add(panel_1_1_1);

		JLabel lblSuDungDiem = new JLabel("Sử dụng điểm: ");
		lblSuDungDiem.setFont(new Font("Tahoma", Font.PLAIN, 28));
		lblSuDungDiem.setBounds(10, 14, 193, 34);
		panel_1_1_1.add(lblSuDungDiem);

		txtSuDungDiem = new JTextField();
		txtSuDungDiem.setForeground(Color.RED);
		txtSuDungDiem.setFont(new Font("Tahoma", Font.PLAIN, 33));
		txtSuDungDiem.setColumns(10);
		txtSuDungDiem.setBorder(new EmptyBorder(0, 0, 0, 0));
		txtSuDungDiem.setBackground(Color.WHITE);
		txtSuDungDiem.setBounds(202, 14, 290, 33);
		if (hoaDon == null || hoaDon.getKhachHang() == null) {
			txtSuDungDiem.setEditable(false);
		} else {
			txtSuDungDiem.getDocument().addDocumentListener(new DocumentListener() {

				@Override
				public void removeUpdate(DocumentEvent e) {
					// TODO Auto-generated method stub
					try {
						double diemNhap = Double.parseDouble(txtSuDungDiem.getText());
						if (diemNhap > hoaDon.getKhachHang().getDiemTichLuy()) {
							JOptionPane.showMessageDialog(null,
									"Số điểm trừ không được lớn hơn số điểm tích lũy của khách hàng!");
						} else {
							hoaDon.setDiemSuDung(diemNhap);
							lblSoTienPhaiTra.setText(chuyenDoiDinhDangTienTe(hoaDon.tinhThanhTienHoaDon()));
							soTienKhachDua = Double.parseDouble(txtSoTienKhachDua.getText());
							lblTienThoi.setText(chuyenDoiDinhDangTienTe(soTienKhachDua - hoaDon.tinhThanhTienHoaDon()));
						}
					} catch (Exception e2) {
						// TODO: handle exception
						JOptionPane.showMessageDialog(null, "Phải nhập số!");
					}
				}

				@Override
				public void insertUpdate(DocumentEvent e) {
					// TODO Auto-generated method stub
					try {
						double diemNhap = Double.parseDouble(txtSuDungDiem.getText());
						if (diemNhap > hoaDon.getKhachHang().getDiemTichLuy()) {
							JOptionPane.showMessageDialog(null,
									"Số điểm trừ không được lớn hơn số điểm tích lũy của khách hàng!");
						} else {
							hoaDon.setDiemSuDung(diemNhap);
							lblSoTienPhaiTra.setText(chuyenDoiDinhDangTienTe(hoaDon.tinhThanhTienHoaDon()));
							soTienKhachDua = Double.parseDouble(txtSoTienKhachDua.getText());
							lblTienThoi.setText(chuyenDoiDinhDangTienTe(soTienKhachDua - hoaDon.tinhThanhTienHoaDon()));
						}
					} catch (Exception e2) {
						// TODO: handle exception
						JOptionPane.showMessageDialog(null, "Phải nhập số!");
					}
				}

				@Override
				public void changedUpdate(DocumentEvent e) {
					// TODO Auto-generated method stub

				}
			});
		}
		panel_1_1_1.add(txtSuDungDiem);

		JPanel panel_1_1_1_1 = new JPanel();
		panel_1_1_1_1.setLayout(null);
		panel_1_1_1_1.setForeground(Color.YELLOW);
		panel_1_1_1_1.setBounds(0, 319, 502, 62);
		contentPanel.add(panel_1_1_1_1);

		JLabel lblKhachHang = new JLabel("Khách hàng:");
		lblKhachHang.setFont(new Font("Tahoma", Font.PLAIN, 28));
		lblKhachHang.setBounds(10, 14, 157, 34);
		panel_1_1_1_1.add(lblKhachHang);

		JLabel lblKhachHangInfo = new JLabel("Null");
		lblKhachHangInfo.setForeground(Color.RED);
		lblKhachHangInfo.setFont(new Font("Tahoma", Font.PLAIN, 18));
		lblKhachHangInfo.setBounds(182, 14, 310, 34);
		if (hoaDon.getKhachHang() != null) {
			lblKhachHangInfo.setText(hoaDon.getKhachHang().getHoTenDem() + " " + hoaDon.getKhachHang().getTen() + " - "
					+ chuyenDoiDinhDangTienTe(hoaDon.getKhachHang().getDiemTichLuy()));
		}
		panel_1_1_1_1.add(lblKhachHangInfo);
	}

	public String chuyenDoiDinhDangTienTe(double soTien) {
		Locale localeVN = new Locale("vi", "VN");
		NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
		return currencyVN.format(soTien);
	}

	public boolean isCheckThanhToan() {
		return checkThanhToan;
	}

	public void setCheckThanhToan(boolean checkThanhToan) {
		this.checkThanhToan = checkThanhToan;
	}
}
