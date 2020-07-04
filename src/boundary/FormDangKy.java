package boundary;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.border.EmptyBorder;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

import control.DAONhanVien;
import entity.NhanVien;
import entity.TaiKhoan;

import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.JComboBox;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.UUID;

public class FormDangKy extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private JTextField txtHoTenDem;
	private JTextField textTen;
	private JTextField txtSoDienThoai;
	private JTextField txtTenTaiKhoan;
	private JTextField txtMatKhau;
	private JTextField txtNhapLaiMatKhau;
	private JLabel lblTbHoTenDem;
	private JLabel lblTbTen;
	private JLabel lblTbSoDienThoai;
	private JLabel lblTbTenTaiKhoan;
	private JLabel tbMatKhau;
	private JLabel tbNhapLaiMatKhau;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			FormDangKy dialog = new FormDangKy();
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public FormDangKy() {
		setResizable(false);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		setBounds(100, 100, 538, 626);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBackground(new Color(247, 245, 221));
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		JLabel lblTitle = new JLabel("Đăng ký");
		lblTitle.setHorizontalAlignment(SwingConstants.CENTER);
		lblTitle.setFont(new Font("Tahoma", Font.PLAIN, 50));
		lblTitle.setBounds(116, 11, 278, 88);
		contentPanel.add(lblTitle);

		JLabel lblHoTenDem = new JLabel("Họ và tên đệm");
		lblHoTenDem.setBounds(25, 110, 125, 14);
		contentPanel.add(lblHoTenDem);

		txtHoTenDem = new JTextField();
		txtHoTenDem.setBounds(25, 135, 221, 20);
		contentPanel.add(txtHoTenDem);
		txtHoTenDem.setColumns(10);
		txtHoTenDem.getDocument().addDocumentListener(new DocumentListener() {

			@Override
			public void removeUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraRong(txtHoTenDem, lblTbHoTenDem);
				kiemTraHoTen(txtHoTenDem, lblTbHoTenDem);
			}

			@Override
			public void insertUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraRong(txtHoTenDem, lblTbHoTenDem);
				kiemTraHoTen(txtHoTenDem, lblTbHoTenDem);
			}

			@Override
			public void changedUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub

			}
		});

		JLabel lblTen = new JLabel("Tên");
		lblTen.setBounds(256, 110, 46, 14);
		contentPanel.add(lblTen);

		textTen = new JTextField();
		textTen.setBounds(256, 135, 244, 20);
		contentPanel.add(textTen);
		textTen.setColumns(10);
		textTen.getDocument().addDocumentListener(new DocumentListener() {

			@Override
			public void removeUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraRong(textTen, lblTbTen);
				kiemTraHoTen(textTen, lblTbTen);
			}

			@Override
			public void insertUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraRong(textTen, lblTbTen);
				kiemTraHoTen(textTen, lblTbTen);
			}

			@Override
			public void changedUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub

			}
		});

		JLabel lblSoDienThoai = new JLabel("Số điện thoại");
		lblSoDienThoai.setBounds(25, 181, 114, 14);
		contentPanel.add(lblSoDienThoai);

		txtSoDienThoai = new JTextField();
		txtSoDienThoai.setBounds(25, 206, 284, 20);
		contentPanel.add(txtSoDienThoai);
		txtSoDienThoai.setColumns(10);
		txtSoDienThoai.getDocument().addDocumentListener(new DocumentListener() {

			@Override
			public void removeUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraSoDienThoai(txtSoDienThoai, lblTbSoDienThoai);
			}

			@Override
			public void insertUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraSoDienThoai(txtSoDienThoai, lblTbSoDienThoai);
			}

			@Override
			public void changedUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub

			}
		});

		JComboBox cbxGioiTinh = new JComboBox();
		cbxGioiTinh.setBounds(319, 205, 181, 22);
		contentPanel.add(cbxGioiTinh);
		cbxGioiTinh.addItem("Nam");
		cbxGioiTinh.addItem("Nữ");

		JLabel lblGioiTinh = new JLabel("Giới tính");
		lblGioiTinh.setBounds(319, 180, 94, 14);
		contentPanel.add(lblGioiTinh);

		JLabel lblTenTaiKhoan = new JLabel("Tên tài khoản");
		lblTenTaiKhoan.setBounds(25, 253, 203, 14);
		contentPanel.add(lblTenTaiKhoan);

		txtTenTaiKhoan = new JTextField();
		txtTenTaiKhoan.setBounds(25, 278, 475, 20);
		contentPanel.add(txtTenTaiKhoan);
		txtTenTaiKhoan.setColumns(10);
		txtTenTaiKhoan.getDocument().addDocumentListener(new DocumentListener() {

			@Override
			public void removeUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraTenTaiKhoan();
			}

			@Override
			public void insertUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraTenTaiKhoan();
			}

			@Override
			public void changedUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub

			}
		});

		JLabel lblMatKhau = new JLabel("Mật khẩu");
		lblMatKhau.setBounds(25, 325, 94, 14);
		contentPanel.add(lblMatKhau);

		txtMatKhau = new JPasswordField();
		txtMatKhau.setBounds(25, 350, 475, 20);
		contentPanel.add(txtMatKhau);
		txtMatKhau.setColumns(10);
		txtMatKhau.getDocument().addDocumentListener(new DocumentListener() {

			@Override
			public void removeUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraMatKhau();
			}

			@Override
			public void insertUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraMatKhau();
			}

			@Override
			public void changedUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub

			}
		});

		JLabel lblNhapLaiMatKhau = new JLabel("Nhập lại mật khẩu");
		lblNhapLaiMatKhau.setBounds(25, 404, 125, 14);
		contentPanel.add(lblNhapLaiMatKhau);

		txtNhapLaiMatKhau = new JPasswordField();
		txtNhapLaiMatKhau.setBounds(25, 429, 475, 20);
		contentPanel.add(txtNhapLaiMatKhau);
		txtNhapLaiMatKhau.setColumns(10);
		txtNhapLaiMatKhau.getDocument().addDocumentListener(new DocumentListener() {

			@Override
			public void removeUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraNhapLaiMatKhau();
			}

			@Override
			public void insertUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub
				kiemTraNhapLaiMatKhau();
			}

			@Override
			public void changedUpdate(DocumentEvent e) {
				// TODO Auto-generated method stub

			}
		});

		JButton btnDangKy = new JButton("Đăng ký");
		btnDangKy.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				if (!kiemTraHoTen(txtHoTenDem, lblTbHoTenDem)
						|| !kiemTraHoTen(textTen, lblTbTen) || !kiemTraSoDienThoai(txtSoDienThoai, lblTbSoDienThoai)
								|| !kiemTraMatKhau() || !kiemTraNhapLaiMatKhau()) {
					return;
				}

				NhanVien a = new NhanVien(UUID.randomUUID().toString());
				TaiKhoan temple = new TaiKhoan(txtTenTaiKhoan.getText(), txtMatKhau.getText());
				a.setTaiKhoan(temple);
				a.setHoTenDem(txtHoTenDem.getText());
				a.setTen(textTen.getText());
				a.setGioiTinh(cbxGioiTinh.getSelectedItem().toString() == "Nam" ? true : false);
				a.setSoDienThoai(txtSoDienThoai.getText());
				if(!new DAONhanVien().themTaiKhoan(a) || !new DAONhanVien().themNhanVien(a)) {
					JOptionPane.showMessageDialog(null, "Đăng ký không thành công!");
				}else {
					JOptionPane.showMessageDialog(null, "Đăng ký thành công!");
					dispose();
				}

			}
		});
		btnDangKy.setBackground(new Color(155, 222, 172));
		btnDangKy.setBounds(116, 506, 131, 51);
		contentPanel.add(btnDangKy);

		JButton btnThoat = new JButton("Thoát");
		btnThoat.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				int res = JOptionPane.showConfirmDialog(null, "Bạn có chắc muốn thoát đăng ký!");
				if (res == JOptionPane.YES_OPTION) {
					dispose();
				}

			}
		});
		btnThoat.setForeground(Color.WHITE);
		btnThoat.setBackground(new Color(231, 48, 91));
		btnThoat.setBounds(257, 506, 137, 51);
		contentPanel.add(btnThoat);

		tbNhapLaiMatKhau = new JLabel("*");
		tbNhapLaiMatKhau.setForeground(Color.RED);
		tbNhapLaiMatKhau.setFont(new Font("Tahoma", Font.ITALIC, 11));
		tbNhapLaiMatKhau.setBounds(25, 450, 475, 14);
		contentPanel.add(tbNhapLaiMatKhau);

		tbMatKhau = new JLabel("*");
		tbMatKhau.setForeground(Color.RED);
		tbMatKhau.setFont(new Font("Tahoma", Font.ITALIC, 11));
		tbMatKhau.setBounds(25, 370, 475, 14);
		contentPanel.add(tbMatKhau);

		lblTbTenTaiKhoan = new JLabel("*");
		lblTbTenTaiKhoan.setForeground(Color.RED);
		lblTbTenTaiKhoan.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbTenTaiKhoan.setBounds(25, 300, 475, 14);
		contentPanel.add(lblTbTenTaiKhoan);

		lblTbSoDienThoai = new JLabel("*");
		lblTbSoDienThoai.setForeground(Color.RED);
		lblTbSoDienThoai.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbSoDienThoai.setBounds(25, 228, 475, 14);
		contentPanel.add(lblTbSoDienThoai);

		lblTbHoTenDem = new JLabel("*");
		lblTbHoTenDem.setForeground(Color.RED);
		lblTbHoTenDem.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbHoTenDem.setBounds(25, 156, 221, 14);
		contentPanel.add(lblTbHoTenDem);

		lblTbTen = new JLabel("*");
		lblTbTen.setForeground(Color.RED);
		lblTbTen.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbTen.setBounds(256, 155, 221, 14);
		contentPanel.add(lblTbTen);
	}

	public boolean kiemTraRong(JTextField txt, JLabel tb) {
		if (txt.getText().equals("")) {
			tb.setText("Không được để trống!");
			return false;
		}
		tb.setText("*");
		return true;
	}

	public boolean kiemTraHoTen(JTextField txt, JLabel tb) {
		if (!txt.getText().matches("[\\D]+")) {
			tb.setText("Nhập không đúng định dạng!");
			return false;
		}
		tb.setText("*");
		return true;
	}

	public boolean kiemTraSoDienThoai(JTextField txt, JLabel tb) {
		if (!txt.getText().matches("0[0-9\\s.-]{9,13}")) {
			tb.setText("Số điện thoại nhập không đúng!");
			return false;
		}
		tb.setText("*");
		return true;
	}

	public boolean kiemTraTenTaiKhoan() {
		if (!txtTenTaiKhoan.getText().matches("[a-zA-Z0-9_]{8,}")) {
			lblTbTenTaiKhoan.setText("Tên tài khoản phải từ 8 ký tự và không chứa ký tự đặc biệt!");
			return false;
		}
		lblTbTenTaiKhoan.setText("*");
		return true;
	}

	public boolean kiemTraMatKhau() {
		if (!txtMatKhau.getText().matches("(?=^.{8,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$")) {
			tbMatKhau.setText("Mật khầu tối thiểu 8 ký tự và phải chứa chữ cái và số!");
			return false;
		}
		tbMatKhau.setText("*");
		return true;
	}

	public boolean kiemTraNhapLaiMatKhau() {
		if (!txtNhapLaiMatKhau.getText().equals(txtMatKhau.getText())) {
			tbNhapLaiMatKhau.setText("Mật khẩu chưa khớp!");
			return false;
		}
		tbNhapLaiMatKhau.setText("*");
		return true;
	}
}
