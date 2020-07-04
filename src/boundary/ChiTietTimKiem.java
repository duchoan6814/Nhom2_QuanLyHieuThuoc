package boundary;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import control.DAOThuoc;
import entity.Thuoc;

import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.SwingConstants;
import java.awt.Font;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class ChiTietTimKiem extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private JLabel lblMaThuoc;
	private JLabel lblTenThuoc;
	private JLabel lblGiaThuoc;
	private JLabel lblDonViTinh;
	private JLabel lblHanSuDung;
	private JLabel lblTonKho;
	private JLabel lblLoaiThuoc;
	private JLabel lblNCC;
	private JLabel lblMoTa;
	private Thuoc thuoc;
	private boolean isChoose = false;
	
	

	public boolean isChoose() {
		return isChoose;
	}

	public void setChoose(boolean isChoose) {
		this.isChoose = isChoose;
	}

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			ChiTietTimKiem dialog = new ChiTietTimKiem("nv");
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public ChiTietTimKiem(String maThuoc) {
		setResizable(false);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 529, 419);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBackground(new Color(188,238,251));
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		
		JLabel lblTitle = new JLabel("Chi tiết thuốc");
		lblTitle.setFont(new Font("Tahoma", Font.PLAIN, 30));
		lblTitle.setHorizontalAlignment(SwingConstants.CENTER);
		lblTitle.setBounds(140, 10, 243, 37);
		contentPanel.add(lblTitle);
		
		JLabel lblNewLabel = new JLabel("Mã thuốc:");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblNewLabel.setBounds(10, 75, 80, 14);
		contentPanel.add(lblNewLabel);
		
		JLabel lblTnThuc = new JLabel("Tên thuốc:");
		lblTnThuc.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblTnThuc.setBounds(10, 100, 80, 14);
		contentPanel.add(lblTnThuc);
		
		JLabel lblGiThuc = new JLabel("Giá thuốc");
		lblGiThuc.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblGiThuc.setBounds(10, 125, 80, 14);
		contentPanel.add(lblGiThuc);
		
		JLabel lblnVTnh = new JLabel("Đơn vị tính:");
		lblnVTnh.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblnVTnh.setBounds(10, 150, 80, 14);
		contentPanel.add(lblnVTnh);
		
		JLabel lblHnSDung = new JLabel("Hạn sử dung:");
		lblHnSDung.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblHnSDung.setBounds(10, 175, 80, 14);
		contentPanel.add(lblHnSDung);
		
		JLabel lblLngTnKho = new JLabel("Lượng tồn kho:");
		lblLngTnKho.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblLngTnKho.setBounds(10, 200, 125, 14);
		contentPanel.add(lblLngTnKho);
		
		JLabel lblLoiThuc = new JLabel("Loại thuốc:");
		lblLoiThuc.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblLoiThuc.setBounds(10, 225, 80, 14);
		contentPanel.add(lblLoiThuc);
		
		JLabel lblNhCungCp = new JLabel("Nhà cung cấp:");
		lblNhCungCp.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblNhCungCp.setBounds(10, 250, 93, 14);
		contentPanel.add(lblNhCungCp);
		
		lblTonKho = new JLabel("");
		lblTonKho.setBounds(107, 200, 406, 14);
		contentPanel.add(lblTonKho);
		
		lblLoaiThuoc = new JLabel("");
		lblLoaiThuoc.setBounds(107, 225, 406, 14);
		contentPanel.add(lblLoaiThuoc);
		
		lblNCC = new JLabel("");
		lblNCC.setBounds(107, 250, 406, 14);
		contentPanel.add(lblNCC);
		
		lblHanSuDung = new JLabel("");
		lblHanSuDung.setBounds(107, 175, 406, 14);
		contentPanel.add(lblHanSuDung);
		
		lblDonViTinh = new JLabel("");
		lblDonViTinh.setBounds(107, 150, 406, 14);
		contentPanel.add(lblDonViTinh);
		
		lblGiaThuoc = new JLabel("");
		lblGiaThuoc.setBounds(107, 125, 406, 14);
		contentPanel.add(lblGiaThuoc);
		
		lblTenThuoc = new JLabel("");
		lblTenThuoc.setBounds(107, 100, 406, 14);
		contentPanel.add(lblTenThuoc);
		
		lblMaThuoc = new JLabel("");
		lblMaThuoc.setBounds(107, 75, 406, 14);
		contentPanel.add(lblMaThuoc);
		
		JLabel lblMT = new JLabel("Mô tả:");
		lblMT.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblMT.setBounds(10, 275, 93, 14);
		contentPanel.add(lblMT);
		
		lblMoTa = new JLabel("");
		lblMoTa.setBounds(107, 275, 406, 14);
		contentPanel.add(lblMoTa);
		
		JButton btnThem = new JButton("Thêm");
		btnThem.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				isChoose = true;
				dispose();
			}
		});
		btnThem.setBounds(143, 341, 89, 23);
		contentPanel.add(btnThem);
		
		JButton btnThoat = new JButton("Thoát");
		btnThoat.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				dispose();
			}
		});
		btnThoat.setBounds(242, 341, 89, 23);
		contentPanel.add(btnThoat);
		
		setDataForDialog(maThuoc);
	}
	
	public void setDataForDialog(String str) {
		thuoc = new DAOThuoc().getChiTietThuocTheoMa(str);
		if (thuoc == null) {
			JOptionPane.showMessageDialog(null, "Có lỗi sảy ra!");
		}else {
			lblMaThuoc.setText(thuoc.getMaThuoc());
			lblTenThuoc.setText(thuoc.getTenThuoc());
			lblGiaThuoc.setText(Double.toString(thuoc.getGia()));
			lblDonViTinh.setText(thuoc.getDonViTinh());
			lblHanSuDung.setText(thuoc.getHanSuDung());
			lblTonKho.setText(Integer.toString(thuoc.getSoLuong()));
			lblLoaiThuoc.setText(thuoc.getLoai().getTenTheLoai());
			lblNCC.setText(thuoc.getNhaCungCap().getTenNhaCungCap());
			lblMoTa.setText(thuoc.getMoTa());
		}
	}
}
