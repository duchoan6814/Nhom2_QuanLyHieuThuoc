package boundary;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.SystemColor;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JTextField;
import com.toedter.calendar.JDateChooser;

import control.DAOKhachHang;
import entity.KhachHang;

import javax.swing.JComboBox;
import java.awt.Color;
import javax.swing.SwingConstants;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.UUID;

public class DialogThemKhachHang extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private JTextField txtDiaChi;
	private JDateChooser dateNgaySinh;
	private JComboBox cbxGioiTinh;
	private JLabel lblTbHoKhachHang;
	private JLabel lblTbTenKhachHang;
	private JLabel lblTbNgaySinh;
	private JLabel lblTbGioiTinh;
	private JLabel lblTbDiaChi;
	private boolean trangThaiThem = false;
	private KhachHang khachHang = new KhachHang();
	private JLabel lblNewLabel;
	private JTextField txtHoKhachHang;
	private JTextField txtTenKhachHang;
	private JButton btnThem;

	public boolean isTrangThaiThem() {
		return trangThaiThem;
	}

	public void setTrangThaiThem(boolean trangThaiThem) {
		this.trangThaiThem = trangThaiThem;
	}

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			DialogThemKhachHang dialog = new DialogThemKhachHang("sua_18054321");
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public DialogThemKhachHang(String type) {
		setBounds(100, 100, 558, 575);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBackground(SystemColor.info);
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		{
			if (type.equals("them")) {
				lblNewLabel = new JLabel("Thêm khách hàng");
			} else {
				lblNewLabel = new JLabel("Sửa khách hàng");
			}

			lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
			lblNewLabel.setBounds(107, 10, 328, 41);
			lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 34));
			contentPanel.add(lblNewLabel);
		}

		JLabel lblNewLabel_1 = new JLabel("Họ khách hàng:");
		lblNewLabel_1.setBounds(25, 92, 89, 14);
		contentPanel.add(lblNewLabel_1);

		txtHoKhachHang = new JTextField();
		txtHoKhachHang.setBounds(139, 89, 377, 20);
		contentPanel.add(txtHoKhachHang);
		txtHoKhachHang.setColumns(10);

		txtTenKhachHang = new JTextField();
		txtTenKhachHang.setColumns(10);
		txtTenKhachHang.setBounds(139, 140, 377, 20);
		contentPanel.add(txtTenKhachHang);

		JLabel lblNewLabel_1_1 = new JLabel("Tên Khách Hàng:");
		lblNewLabel_1_1.setBounds(25, 143, 89, 14);
		contentPanel.add(lblNewLabel_1_1);

		txtDiaChi = new JTextField();
		txtDiaChi.setColumns(10);
		txtDiaChi.setBounds(139, 297, 377, 20);
		contentPanel.add(txtDiaChi);

		JLabel lblNewLabel_1_2 = new JLabel("Địa chỉ:");
		lblNewLabel_1_2.setBounds(25, 300, 89, 14);
		contentPanel.add(lblNewLabel_1_2);

		JLabel lblNewLabel_1_1_1 = new JLabel("Ngày sinh:");
		lblNewLabel_1_1_1.setBounds(25, 197, 89, 14);
		contentPanel.add(lblNewLabel_1_1_1);

		dateNgaySinh = new JDateChooser();
		dateNgaySinh.setBounds(139, 191, 377, 20);
		contentPanel.add(dateNgaySinh);

		JLabel lblNewLabel_1_1_1_1 = new JLabel("Giới tính:");
		lblNewLabel_1_1_1_1.setBounds(25, 248, 89, 14);
		contentPanel.add(lblNewLabel_1_1_1_1);

		cbxGioiTinh = new JComboBox();
		cbxGioiTinh.setBounds(139, 244, 377, 22);
		cbxGioiTinh.addItem("Nam");
		cbxGioiTinh.addItem("Nữ");
		contentPanel.add(cbxGioiTinh);

		lblTbHoKhachHang = new JLabel("*");
		lblTbHoKhachHang.setForeground(Color.RED);
		lblTbHoKhachHang.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbHoKhachHang.setBounds(139, 109, 377, 20);
		contentPanel.add(lblTbHoKhachHang);

		lblTbTenKhachHang = new JLabel("*");
		lblTbTenKhachHang.setForeground(Color.RED);
		lblTbTenKhachHang.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbTenKhachHang.setBounds(139, 160, 377, 20);
		contentPanel.add(lblTbTenKhachHang);

		lblTbNgaySinh = new JLabel("*");
		lblTbNgaySinh.setForeground(Color.RED);
		lblTbNgaySinh.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbNgaySinh.setBounds(139, 213, 377, 20);
		contentPanel.add(lblTbNgaySinh);

		lblTbGioiTinh = new JLabel("*");
		lblTbGioiTinh.setForeground(Color.RED);
		lblTbGioiTinh.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbGioiTinh.setBounds(139, 266, 377, 20);
		contentPanel.add(lblTbGioiTinh);

		lblTbDiaChi = new JLabel("*");
		lblTbDiaChi.setForeground(Color.RED);
		lblTbDiaChi.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbDiaChi.setBounds(139, 317, 377, 20);
		contentPanel.add(lblTbDiaChi);
		if (type.equals("them")) {
			btnThem = new JButton("Thêm");
			btnThem.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {

					if (!kiemTraHoTenKhachHang(lblTbHoKhachHang, txtHoKhachHang))
						return;
					if (!kiemTraHoTenKhachHang(lblTbTenKhachHang, txtTenKhachHang))
						return;
					if (!kiemTraNgaySinh())
						return;

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					KhachHang khachHang = new KhachHang();
					khachHang.setMaKH(UUID.randomUUID().toString());
					khachHang.setHoTenDem(txtHoKhachHang.getText());
					khachHang.setTen(txtTenKhachHang.getText());
					khachHang.setNgaySinh(new Date(dateNgaySinh.getDate().getTime()));
					khachHang.setGioiTinh(cbxGioiTinh.getSelectedItem().toString() == "Nam" ? true : false);
					khachHang.setDiemTichLuy(0);
					khachHang.setDiaChi(txtDiaChi.getText());
					if (!new DAOKhachHang().themKhachHang(khachHang)) {
						JOptionPane.showMessageDialog(null, "Thêm không thành công!");
					} else {
						JOptionPane.showMessageDialog(null, "Thêm thành công.");
						setTrangThaiThem(true);
						dispose();
					}
				}
			});
		} else {
			btnThem = new JButton("Sửa");
			btnThem.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {

					if (!kiemTraHoTenKhachHang(lblTbHoKhachHang, txtHoKhachHang))
						return;
					if (!kiemTraHoTenKhachHang(lblTbTenKhachHang, txtTenKhachHang))
						return;
					if (!kiemTraNgaySinh())
						return;

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					KhachHang khachHang = new KhachHang();
					khachHang.setMaKH(type.split("_")[1]);
					khachHang.setHoTenDem(txtHoKhachHang.getText());
					khachHang.setTen(txtTenKhachHang.getText());
					khachHang.setNgaySinh(new Date(dateNgaySinh.getDate().getTime()));
					khachHang.setGioiTinh(cbxGioiTinh.getSelectedItem().toString() == "Nam" ? true : false);
					khachHang.setDiemTichLuy(0);
					khachHang.setDiaChi(txtDiaChi.getText());
					if (!new DAOKhachHang().suaThongTinKhachHang(khachHang)) {
						JOptionPane.showMessageDialog(null, "Sửa không thành công!");
					} else {
						JOptionPane.showMessageDialog(null, "Sửa thành công.");
						setTrangThaiThem(true);
						dispose();
					}
				}
			});
		}

		btnThem.setBounds(70, 414, 165, 68);
		contentPanel.add(btnThem);

		JButton btnThoat = new JButton("Thoát");
		btnThoat.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				dispose();
			}
		});
		btnThoat.setBounds(305, 414, 165, 68);
		contentPanel.add(btnThoat);

		if (!type.equals("them")) {
			docDuLieuVaoFormSua(type.split("_")[1]);
		}
	}

	public boolean kiemTraHoTenKhachHang(JLabel tb, JTextField txt) {
		if (!txt.getText().matches("[\\D]+")) {
			tb.setText("Chỉ được nhập chữ cái và không được nhập số!");
			return false;
		}
		tb.setText("*");
		return true;

	}

	public boolean kiemTraNgaySinh() {
		java.util.Date toDay = new java.util.Date();
		if (dateNgaySinh.getDate().getTime() > toDay.getTime()) {
			lblTbNgaySinh.setText("Ngày sinh không được lớn hơn ngày hiện tại!");
			return false;
		}
		lblTbNgaySinh.setText("*");
		return true;
	}

	public void docDuLieuVaoFormSua(String maKhachHang) {
		khachHang = new DAOKhachHang().timKhachHangTheoMa(maKhachHang);
		txtHoKhachHang.setText(khachHang.getHoTenDem());
		txtTenKhachHang.setText(khachHang.getTen());
		txtDiaChi.setText(khachHang.getDiaChi());
		dateNgaySinh.setDate(khachHang.getNgaySinh());
		if(!khachHang.isGioiTinh())
			cbxGioiTinh.setSelectedIndex(1);
	}
}
