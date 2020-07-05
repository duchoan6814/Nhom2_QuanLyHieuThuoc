package boundary;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import control.DAOHoaDon;
import entity.HoaDon;

import javax.swing.JLabel;
import java.awt.Font;
import java.text.NumberFormat;
import java.util.Locale;

import javax.swing.SwingConstants;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import java.awt.Color;

public class ChiTietHoaDon extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private TableModel chiTietHoaDonModel;
	private JTable tblChiTietHoaDon;
	private JLabel lblNhanVien;
	private JLabel lblKhachHang;
	private JLabel lblNgay;
	private JLabel lblGio;
	private JLabel lblMaHoaDon;
	private JLabel lblTongTien;
	private JLabel lblDienTichLuy;
	private JLabel lblDiemSuDung;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			ChiTietHoaDon dialog = new ChiTietHoaDon("a703237c-db57-4c84-84ee-d5997b767429");
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public ChiTietHoaDon(String maHoaDon) {
		setBounds(100, 100, 496, 783);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBackground(Color.WHITE);
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		
		JLabel lblLogo = new JLabel("Logo");
		lblLogo.setHorizontalAlignment(SwingConstants.CENTER);
		lblLogo.setFont(new Font("Tahoma", Font.PLAIN, 62));
		lblLogo.setBounds(163, 11, 153, 89);
		contentPanel.add(lblLogo);
		
		JLabel lblNha = new JLabel("Nhân viên:");
		lblNha.setBounds(10, 110, 65, 14);
		contentPanel.add(lblNha);
		
		lblNhanVien = new JLabel("Trương Đức Hoàn");
		lblNhanVien.setBounds(85, 110, 231, 14);
		contentPanel.add(lblNhanVien);
		
		JLabel lblNewLabel = new JLabel("Ngày:");
		lblNewLabel.setBounds(317, 110, 46, 14);
		contentPanel.add(lblNewLabel);
		
		lblNgay = new JLabel("05/07/2020");
		lblNgay.setBounds(373, 110, 97, 14);
		contentPanel.add(lblNgay);
		
		JLabel lblNewLabel_1 = new JLabel("Giờ:");
		lblNewLabel_1.setBounds(317, 135, 46, 14);
		contentPanel.add(lblNewLabel_1);
		
		lblGio = new JLabel("19:00");
		lblGio.setBounds(373, 135, 46, 14);
		contentPanel.add(lblGio);
		
		JLabel lblNewLabel_2 = new JLabel("Khách hàng:");
		lblNewLabel_2.setBounds(10, 135, 79, 14);
		contentPanel.add(lblNewLabel_2);
		
		lblKhachHang = new JLabel("Phạm Xuân Vũ");
		lblKhachHang.setBounds(85, 135, 231, 14);
		contentPanel.add(lblKhachHang);
		
		JLabel lblNewLabel_3 = new JLabel("Mã hóa đơn:");
		lblNewLabel_3.setBounds(10, 160, 92, 14);
		contentPanel.add(lblNewLabel_3);
		
		lblMaHoaDon = new JLabel("VJA-125552");
		lblMaHoaDon.setBounds(112, 160, 358, 14);
		contentPanel.add(lblMaHoaDon);
		
		String[] colHeader = {"Tên", "Số lượng", "Giá"};
		chiTietHoaDonModel = new DefaultTableModel(colHeader, 0);
		
		tblChiTietHoaDon = new JTable(chiTietHoaDonModel);
		
		JScrollPane scrollPane = new JScrollPane(tblChiTietHoaDon);
		scrollPane.setBounds(10, 196, 460, 332);
		contentPanel.add(scrollPane);
		
		JLabel lblNewLabel_5 = new JLabel("Tổng tiền:");
		lblNewLabel_5.setBounds(10, 562, 65, 14);
		contentPanel.add(lblNewLabel_5);
		
		JLabel lblNewLabel_6 = new JLabel("Điểm tích lũy trong giao dịch:");
		lblNewLabel_6.setBounds(10, 587, 189, 14);
		contentPanel.add(lblNewLabel_6);
		
		JLabel lblNewLabel_7 = new JLabel("Điểm sử dụng trong giao dịch:");
		lblNewLabel_7.setBounds(10, 612, 189, 14);
		contentPanel.add(lblNewLabel_7);
		
		JLabel lblNewLabel_8 = new JLabel("Cảm ơn quý khách!");
		lblNewLabel_8.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_8.setFont(new Font("Tahoma", Font.PLAIN, 28));
		lblNewLabel_8.setBounds(96, 667, 288, 34);
		contentPanel.add(lblNewLabel_8);
		
		lblTongTien = new JLabel("");
		lblTongTien.setBounds(72, 562, 398, 14);
		contentPanel.add(lblTongTien);
		
		lblDienTichLuy = new JLabel("");
		lblDienTichLuy.setBounds(209, 587, 261, 14);
		contentPanel.add(lblDienTichLuy);
		
		lblDiemSuDung = new JLabel("");
		lblDiemSuDung.setBounds(209, 612, 261, 14);
		contentPanel.add(lblDiemSuDung);
		
		setDataForDialog(maHoaDon);
	}
	
	public String chuyenDoiDinhDangTienTe(double soTien) {
		Locale localeVN = new Locale("vi", "VN");
		NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
		return currencyVN.format(soTien);
	}
	
	public void setDataForDialog(String maHoaDon) {
		HoaDon hoaDon = new DAOHoaDon().getHoaDonTheoMa(maHoaDon);
		System.out.println(hoaDon);
		lblNhanVien.setText(hoaDon.getNhanVien().getHoTenDem()+" "+hoaDon.getNhanVien().getTen());
		lblKhachHang.setText(hoaDon.getKhachHang().getHoTenDem()+" "+hoaDon.getKhachHang().getTen());
		lblMaHoaDon.setText(hoaDon.getMaHD());
		lblNgay.setText(hoaDon.getNgayLap().getDay()+"/"+hoaDon.getNgayLap().getMonth()+"/"+hoaDon.getNgayLap().getYear());
		lblGio.setText(hoaDon.getNgayLap().getHours()+":"+hoaDon.getNgayLap().getMinutes());
		lblTongTien.setText(chuyenDoiDinhDangTienTe(hoaDon.tinhThanhTienHoaDon()));
		lblDienTichLuy.setText(chuyenDoiDinhDangTienTe(hoaDon.tinhTongTienHoaDon()* 0.01));
		lblDiemSuDung.setText(chuyenDoiDinhDangTienTe(hoaDon.getDiemSuDung()));
		
		for (entity.ChiTietHoaDon i : hoaDon.getListChiTietHoaDon()) {
			((DefaultTableModel) chiTietHoaDonModel).addRow(new Object[] {
					i.getThuoc().getTenThuoc(),
					i.getSoLuong(),
					chuyenDoiDinhDangTienTe(i.tinhTongTienChiTietHoaDon())
			});
		}
	}
}
