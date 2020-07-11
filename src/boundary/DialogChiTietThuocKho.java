package boundary;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import control.DAOLoThuoc;
import control.DAOThuoc;
import entity.PhieuNhap;
import entity.Thuoc;

import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;
import java.util.ArrayList;

import javax.swing.SwingConstants;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class DialogChiTietThuocKho extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private TableModel loThuocModel;
	private JTable tblLoThuoc;
	private JLabel lblMaThuoc;
	private JLabel lblTenThuoc;
	private JLabel lblGiaThuoc;
	private JLabel lblDonViTinh;
	private JLabel lblHanSuDung;
	private JLabel lblTonKho;
	private JLabel lblLoaiThuoc;
	private JLabel lblNCC;
	private JLabel lblMoTa;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			DialogChiTietThuocKho dialog = new DialogChiTietThuocKho("VD-10858-10");
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public DialogChiTietThuocKho(String maThuoc) {
		setBounds(100, 100, 653, 639);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		
		JPanel contentPanel_1 = new JPanel();
		contentPanel_1.setLayout(null);
		contentPanel_1.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPanel_1.setBackground(new Color(188, 238, 251));
		contentPanel_1.setBounds(0, 0, 637, 600);
		contentPanel.add(contentPanel_1);
		
		JLabel lblTitle = new JLabel("Chi tiết thuốc");
		lblTitle.setHorizontalAlignment(SwingConstants.CENTER);
		lblTitle.setFont(new Font("Tahoma", Font.PLAIN, 30));
		lblTitle.setBounds(140, 10, 243, 37);
		contentPanel_1.add(lblTitle);
		
		JLabel lblNewLabel = new JLabel("Mã thuốc:");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblNewLabel.setBounds(10, 75, 80, 14);
		contentPanel_1.add(lblNewLabel);
		
		JLabel lblTnThuc = new JLabel("Tên thuốc:");
		lblTnThuc.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblTnThuc.setBounds(10, 100, 80, 14);
		contentPanel_1.add(lblTnThuc);
		
		JLabel lblGiThuc = new JLabel("Giá thuốc");
		lblGiThuc.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblGiThuc.setBounds(10, 125, 80, 14);
		contentPanel_1.add(lblGiThuc);
		
		JLabel lblnVTnh = new JLabel("Đơn vị tính:");
		lblnVTnh.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblnVTnh.setBounds(10, 150, 80, 14);
		contentPanel_1.add(lblnVTnh);
		
		JLabel lblHnSDung = new JLabel("Hạn sử dung:");
		lblHnSDung.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblHnSDung.setBounds(10, 175, 80, 14);
		contentPanel_1.add(lblHnSDung);
		
		JLabel lblLngTnKho = new JLabel("Lượng tồn kho:");
		lblLngTnKho.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblLngTnKho.setBounds(10, 200, 125, 14);
		contentPanel_1.add(lblLngTnKho);
		
		JLabel lblLoiThuc = new JLabel("Loại thuốc:");
		lblLoiThuc.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblLoiThuc.setBounds(10, 225, 80, 14);
		contentPanel_1.add(lblLoiThuc);
		
		JLabel lblNhCungCp = new JLabel("Nhà cung cấp:");
		lblNhCungCp.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblNhCungCp.setBounds(10, 250, 93, 14);
		contentPanel_1.add(lblNhCungCp);
		
		lblTonKho = new JLabel("");
		lblTonKho.setBounds(107, 200, 406, 14);
		contentPanel_1.add(lblTonKho);
		
		lblLoaiThuoc = new JLabel("");
		lblLoaiThuoc.setBounds(107, 225, 406, 14);
		contentPanel_1.add(lblLoaiThuoc);
		
		lblNCC = new JLabel("");
		lblNCC.setBounds(107, 250, 406, 14);
		contentPanel_1.add(lblNCC);
		
		lblHanSuDung = new JLabel("");
		lblHanSuDung.setBounds(107, 175, 406, 14);
		contentPanel_1.add(lblHanSuDung);
		
		lblDonViTinh = new JLabel("");
		lblDonViTinh.setBounds(107, 150, 406, 14);
		contentPanel_1.add(lblDonViTinh);
		
		lblGiaThuoc = new JLabel("");
		lblGiaThuoc.setBounds(107, 125, 406, 14);
		contentPanel_1.add(lblGiaThuoc);
		
		lblTenThuoc = new JLabel("");
		lblTenThuoc.setBounds(107, 100, 406, 14);
		contentPanel_1.add(lblTenThuoc);
		
		lblMaThuoc = new JLabel("");
		lblMaThuoc.setBounds(107, 75, 406, 14);
		contentPanel_1.add(lblMaThuoc);
		
		JLabel lblMT = new JLabel("Mô tả:");
		lblMT.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblMT.setBounds(10, 275, 93, 14);
		contentPanel_1.add(lblMT);
		
		lblMoTa = new JLabel("");
		lblMoTa.setBounds(107, 275, 406, 14);
		contentPanel_1.add(lblMoTa);
		
		String[] colHead = {"Mã phiếu Nhập", "Ngày nhập", "Ngày sản xuất", "Ngày hết hạn", "Số lượng"};
		loThuocModel = new DefaultTableModel(colHead, 0);
		tblLoThuoc = new JTable(loThuocModel);
		JScrollPane scrollPane = new JScrollPane(tblLoThuoc);
		scrollPane.setBounds(10, 306, 617, 283);
		contentPanel_1.add(scrollPane);
		
		doDuLieuVaoTable(maThuoc);
	}
	
	public void doDuLieuVaoTable(String maThuoc) {
		Thuoc thuoc = new DAOThuoc().getChiTietThuocTheoMa(maThuoc);
		ArrayList<PhieuNhap> list = new DAOLoThuoc().getListLoThuocByID(maThuoc);
		
		lblMaThuoc.setText(thuoc.getMaThuoc());
		lblTenThuoc.setText(thuoc.getTenThuoc());
		lblDonViTinh.setText(thuoc.getDonViTinh());
		lblHanSuDung.setText(thuoc.getHanSuDung());
		lblGiaThuoc.setText(thuoc.getGia()+ "");
		lblLoaiThuoc.setText(thuoc.getLoai().getTenTheLoai());
		lblMoTa.setText(thuoc.getMoTa());
		lblNCC.setText(thuoc.getNhaCungCap().getTenNhaCungCap());
		lblTonKho.setText(thuoc.getSoLuong()+"");
		
		for (PhieuNhap phieuNhap : list) {
			((DefaultTableModel) loThuocModel).addRow(new Object[] {
					phieuNhap.getMaPhieuNhap(),
					phieuNhap.getNgayNhap(),
					phieuNhap.getLoThuocs().get(0).getNgaySanXuat(),
					phieuNhap.getLoThuocs().get(0).getNgayHetHan(),
					phieuNhap.getLoThuocs().get(0).getSoLuong(),
			});
		}
	}

}
