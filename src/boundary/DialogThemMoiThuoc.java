package boundary;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import control.DAOLoaiThuoc;
import control.DAONhaCungCap;
import control.DAOThuoc;
import entity.NhaCungCap;
import entity.TheLoai;
import entity.Thuoc;

import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import java.util.ArrayList;

import javax.swing.SwingConstants;
import javax.swing.JTextField;
import java.awt.Color;
import javax.swing.JTextPane;
import javax.swing.JComboBox;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class DialogThemMoiThuoc extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private JTextField txtMaThuoc;
	private JTextField txtTenThuoc;
	private JTextField txtGiaThuoc;
	private JTextField txtDonViTinh;
	private JTextField txtHanSuDung;
	private JComboBox cbxLoaiThuoc;
	private JLabel lblTbHanSuDung;
	private JLabel lblTbDonViTinh;
	private JLabel lblTbGiaThuoc;
	private JLabel lblTbTenThuoc;
	private JLabel lblTbMaThuoc;
	private JLabel lblTbLoaiThuoc;
	private JLabel lblTbNhaCungCap;
	private JLabel lblTenCongTyTimDuoc;
	private JTextPane txtMoTa;
	private JComboBox cbxMaNhaCungCap;
	private boolean trangThaiThemMoi = false;
	
	

	public boolean isTrangThaiThemMoi() {
		return trangThaiThemMoi;
	}

	public void setTrangThaiThemMoi(boolean trangThaiThemMoi) {
		this.trangThaiThemMoi = trangThaiThemMoi;
	}

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			DialogThemMoiThuoc dialog = new DialogThemMoiThuoc();
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public DialogThemMoiThuoc() {
		setBounds(100, 100, 529, 635);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		JLabel lblNewLabel = new JLabel("Mã thuốc:");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblNewLabel.setBounds(10, 74, 80, 14);
		contentPanel.add(lblNewLabel);

		JLabel lblTnThuc = new JLabel("Tên thuốc:");
		lblTnThuc.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblTnThuc.setBounds(10, 120, 80, 14);
		contentPanel.add(lblTnThuc);

		JLabel lblGiThuc = new JLabel("Giá thuốc");
		lblGiThuc.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblGiThuc.setBounds(10, 166, 80, 14);
		contentPanel.add(lblGiThuc);

		JLabel lblnVTnh = new JLabel("Đơn vị tính:");
		lblnVTnh.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblnVTnh.setBounds(10, 212, 80, 14);
		contentPanel.add(lblnVTnh);

		JLabel lblHnSDung = new JLabel("Hạn sử dung:");
		lblHnSDung.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblHnSDung.setBounds(10, 258, 80, 14);
		contentPanel.add(lblHnSDung);

		JLabel lblLoiThuc = new JLabel("Loại thuốc:");
		lblLoiThuc.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblLoiThuc.setBounds(10, 304, 80, 14);
		contentPanel.add(lblLoiThuc);

		JLabel lblNhCungCp = new JLabel("Nhà cung cấp:");
		lblNhCungCp.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblNhCungCp.setBounds(10, 350, 93, 14);
		contentPanel.add(lblNhCungCp);

		JLabel lblMT = new JLabel("Mô tả:");
		lblMT.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblMT.setBounds(10, 431, 93, 14);
		contentPanel.add(lblMT);

		JLabel lblNewLabel_1 = new JLabel("Thêm thuốc");
		lblNewLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1.setFont(new Font("Tahoma", Font.PLAIN, 30));
		lblNewLabel_1.setBounds(201, 11, 243, 50);
		contentPanel.add(lblNewLabel_1);

		txtMaThuoc = new JTextField();
		txtMaThuoc.setBounds(113, 71, 379, 20);
		contentPanel.add(txtMaThuoc);
		txtMaThuoc.setColumns(10);

		lblTbMaThuoc = new JLabel("(*)");
		lblTbMaThuoc.setForeground(Color.RED);
		lblTbMaThuoc.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbMaThuoc.setBounds(113, 92, 379, 14);
		contentPanel.add(lblTbMaThuoc);

		txtTenThuoc = new JTextField();
		txtTenThuoc.setColumns(10);
		txtTenThuoc.setBounds(113, 117, 379, 20);
		contentPanel.add(txtTenThuoc);

		lblTbTenThuoc = new JLabel("(*)");
		lblTbTenThuoc.setForeground(Color.RED);
		lblTbTenThuoc.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbTenThuoc.setBounds(113, 138, 379, 14);
		contentPanel.add(lblTbTenThuoc);

		txtGiaThuoc = new JTextField();
		txtGiaThuoc.setColumns(10);
		txtGiaThuoc.setBounds(113, 163, 379, 20);
		contentPanel.add(txtGiaThuoc);

		lblTbGiaThuoc = new JLabel("(*)");
		lblTbGiaThuoc.setForeground(Color.RED);
		lblTbGiaThuoc.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbGiaThuoc.setBounds(113, 184, 379, 14);
		contentPanel.add(lblTbGiaThuoc);

		txtDonViTinh = new JTextField();
		txtDonViTinh.setColumns(10);
		txtDonViTinh.setBounds(113, 209, 379, 20);
		contentPanel.add(txtDonViTinh);

		lblTbDonViTinh = new JLabel("(*)");
		lblTbDonViTinh.setForeground(Color.RED);
		lblTbDonViTinh.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbDonViTinh.setBounds(113, 230, 379, 14);
		contentPanel.add(lblTbDonViTinh);

		txtHanSuDung = new JTextField();
		txtHanSuDung.setColumns(10);
		txtHanSuDung.setBounds(113, 255, 379, 20);
		contentPanel.add(txtHanSuDung);

		lblTbHanSuDung = new JLabel("(*)");
		lblTbHanSuDung.setForeground(Color.RED);
		lblTbHanSuDung.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbHanSuDung.setBounds(113, 276, 379, 14);
		contentPanel.add(lblTbHanSuDung);

		lblTbLoaiThuoc = new JLabel("(*)");
		lblTbLoaiThuoc.setForeground(Color.RED);
		lblTbLoaiThuoc.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbLoaiThuoc.setBounds(113, 322, 379, 14);
		contentPanel.add(lblTbLoaiThuoc);

		lblTbNhaCungCap = new JLabel("(*)");
		lblTbNhaCungCap.setForeground(Color.RED);
		lblTbNhaCungCap.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblTbNhaCungCap.setBounds(113, 368, 379, 14);
		contentPanel.add(lblTbNhaCungCap);

		lblTenCongTyTimDuoc = new JLabel();
		lblTenCongTyTimDuoc.setBounds(113, 393, 379, 20);
		contentPanel.add(lblTenCongTyTimDuoc);

		txtMoTa = new JTextPane();
		txtMoTa.setBounds(113, 431, 379, 50);
		contentPanel.add(txtMoTa);

		cbxLoaiThuoc = new JComboBox();
		cbxLoaiThuoc.setBounds(113, 300, 379, 22);
		contentPanel.add(cbxLoaiThuoc);

		JButton btnNewButton = new JButton("Thêm");
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				if(!kiemTraKhongNhap(txtMaThuoc, lblTbMaThuoc))
					return;
				
				if(!kiemTraKhongNhap(txtTenThuoc, lblTbTenThuoc))
					return;
				
				if(!kiemTraKhongNhap(txtGiaThuoc, lblTbGiaThuoc))
					return;
				
				if(!kiemTraKhongNhap(txtDonViTinh, lblTbDonViTinh))
					return;
				
				if(!kiemTraKhongNhap(txtHanSuDung, lblTbHanSuDung))
					return;
				
				if(!kiemTraGiaThuoc())
					return;
				
				if(!kiemTraHanSuDung())
					return;
				NhaCungCap nhaCungCap = new NhaCungCap();
				nhaCungCap.setMaNhaCungCap(cbxMaNhaCungCap.getSelectedItem().toString());
				nhaCungCap.setTenNhaCungCap(lblTenCongTyTimDuoc.getText());
				
				TheLoai theLoai = new TheLoai();
				theLoai.setMaTheLoai(new DAOLoaiThuoc().getMaLoaiThuocTheoTen(cbxLoaiThuoc.getSelectedItem().toString()));
				Thuoc thuoc = new Thuoc(txtMaThuoc.getText(), txtTenThuoc.getText(), txtMoTa.getText(),
						txtDonViTinh.getText(),Double.parseDouble(txtGiaThuoc.getText()), nhaCungCap, theLoai, 0, txtHanSuDung.getText() + " tháng");
				if(!new DAOThuoc().themThuocMoi(thuoc)) {
					JOptionPane.showMessageDialog(null, "Thêm thuốc không thành công, do mã thuốc bị trùng hay một lý do nào đó!");
				}else {
					JOptionPane.showMessageDialog(null, "Thêm thuốc thành công.");
					dispose();
				}
			}
		});
		btnNewButton.setBounds(113, 531, 125, 43);
		contentPanel.add(btnNewButton);

		JButton btnNewButton_1 = new JButton("Thoát");
		btnNewButton_1.setBounds(293, 531, 125, 43);
		contentPanel.add(btnNewButton_1);

		cbxMaNhaCungCap = new JComboBox();
		cbxMaNhaCungCap.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				lblTenCongTyTimDuoc.setText(
						new DAONhaCungCap().getTenNhaCungCapTheoMa(cbxMaNhaCungCap.getSelectedItem().toString()));
			}
		});
		cbxMaNhaCungCap.setBounds(113, 346, 379, 22);
		contentPanel.add(cbxMaNhaCungCap);
		docDuLieuVaoCBXLoaiThuoc();
		docDuLieuVaoCBXNhaCungCap();
	}

	public void docDuLieuVaoCBXLoaiThuoc() {
		ArrayList<TheLoai> theLoais = new DAOLoaiThuoc().getListLoaiThuoc();
		for (TheLoai theLoai : theLoais) {
			cbxLoaiThuoc.addItem(theLoai.getTenTheLoai());
		}

	}

	public void docDuLieuVaoCBXNhaCungCap() {
		ArrayList<NhaCungCap> cungCaps = new DAONhaCungCap().getListNhaCungCap();
		for (NhaCungCap nhaCungCap : cungCaps) {
			cbxMaNhaCungCap.addItem(nhaCungCap.getMaNhaCungCap());
		}
	}
	
	public boolean kiemTraGiaThuoc() {
		try {
			Double.parseDouble(txtGiaThuoc.getText());
			lblTbGiaThuoc.setText("(*)");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			lblTbGiaThuoc.setText("Giá thuốc phải là số. Tính theo VNĐ");
			txtGiaThuoc.requestFocus();
			return false;
		}
	}
	
	public boolean kiemTraHanSuDung() {
		try {
			Integer.parseInt(txtHanSuDung.getText());
			lblTbHanSuDung.setText("(*)");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			lblTbHanSuDung.setText("Hạn sử dụng chỉ được nhập số, đơn vị tháng");
			txtHanSuDung.requestFocus();
			return false;
		}
	}
	
	public boolean kiemTraKhongNhap(JTextField txt, JLabel tb) {
		if(txt.getText().equals("")) {
			tb.setText("Không được bỏ trống!");
			txt.requestFocus();
			return false;
		}else {
			tb.setText("(*)");
			return true;
		}
	}

}
