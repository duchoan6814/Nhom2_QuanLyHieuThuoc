package boundary;

import javax.swing.JPanel;
import javax.swing.JScrollBar;
import javax.swing.JTable;
import java.awt.Color;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JComboBox;
import javax.swing.ComboBoxModel;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Vector;
import java.awt.event.ActionEvent;
import com.toedter.calendar.JDateChooser;

import control.DAOHoaDon;
import control.DAONhanVien;
import entity.HoaDon;

import javax.swing.JScrollPane;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class pnlQuanLyHoaDon extends JPanel {
	private JTextField txtNhpSHa;
	private TableModel hoaDonModel;
	private JTable tblHoaDon;
	private ArrayList<HoaDon> hoaDonHienThi;
	private JLabel lblSoDong;
	private Vector listNhanVienCBX = new Vector();

	/**
	 * Create the panel.
	 */
	public pnlQuanLyHoaDon() {
		setLayout(null);

		lblSoDong = new JLabel("S\u1ED1 d\u00F2ng: 29");
		lblSoDong.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblSoDong.setBounds(36, 572, 90, 23);
		add(lblSoDong);

		JLabel lblNewLabel_1 = new JLabel("T\u00ECm ki\u1EBFm");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblNewLabel_1.setBounds(71, 89, 66, 23);
		add(lblNewLabel_1);

		txtNhpSHa = new JTextField();
		txtNhpSHa.setText("nh\u1EADp s\u1ED1 h\u00F3a \u0111\u01A1n");
		txtNhpSHa.setBounds(150, 91, 189, 19);
		add(txtNhpSHa);
		txtNhpSHa.setColumns(10);

		JLabel lblNewLabel_2 = new JLabel("Truy xu\u1EA5t H\u0110");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel_2.setBounds(24, 44, 116, 13);
		add(lblNewLabel_2);

		JComboBox comboBox = new JComboBox(listNhanVienCBX);
		comboBox.setFont(new Font("Tahoma", Font.BOLD, 12));
		comboBox.setBounds(133, 41, 219, 21);
		add(comboBox);

		JLabel lblNewLabel_3 = new JLabel("T\u1EEB ng\u00E0y");
		lblNewLabel_3.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblNewLabel_3.setBounds(374, 50, 66, 13);
		add(lblNewLabel_3);

		JLabel lblNewLabel_4 = new JLabel("\u0110\u1EBFn ng\u00E0y");
		lblNewLabel_4.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblNewLabel_4.setBounds(527, 50, 66, 13);
		add(lblNewLabel_4);

		JButton btnNewButton = new JButton("\u0110i\u1EC1u ch\u1EC9nh");
		btnNewButton.setBackground(Color.ORANGE);
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnNewButton.setBounds(524, 90, 95, 21);
		add(btnNewButton);

		JButton btnNewButton_1 = new JButton("H\u1EE7y H\u0110");
		btnNewButton_1.setBackground(Color.ORANGE);
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnNewButton_1.setBounds(654, 90, 95, 21);
		add(btnNewButton_1);

		JLabel lblNewLabel_5 = new JLabel("TTH\u0110 b\u00E1n ra:");
		lblNewLabel_5.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel_5.setBounds(501, 577, 116, 13);
		add(lblNewLabel_5);

		JLabel lblNewLabel_6 = new JLabel("550000");
		lblNewLabel_6.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblNewLabel_6.setBounds(606, 578, 72, 13);
		add(lblNewLabel_6);

		JLabel lblNewLabel_7 = new JLabel("TT Gi\u1EA3m:   0");
		lblNewLabel_7.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel_7.setBounds(700, 577, 90, 13);
		add(lblNewLabel_7);

		JButton btnNewButton_2 = new JButton("T\u00ECm");
		btnNewButton_2.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnNewButton_2.setBounds(347, 90, 60, 21);
		add(btnNewButton_2);

		JLabel lblNewLabel_8 = new JLabel("H\u1ED3 S\u01A1 H\u00F3a \u0110\u01A1n");
		lblNewLabel_8.setFont(new Font("Tahoma", Font.BOLD, 19));
		lblNewLabel_8.setBounds(352, 10, 196, 22);
		add(lblNewLabel_8);

		JDateChooser dateChooser = new JDateChooser();
		dateChooser.setBounds(436, 44, 81, 20);
		add(dateChooser);
		
		

		JDateChooser dateChooser_1 = new JDateChooser();
		dateChooser_1.setBounds(603, 44, 90, 20);
		add(dateChooser_1);

		String[] colHeader = { "STT", "Mã HD", "Ngày lập", "Nhân Viên", "Khách hàng", "Tổng tiền" };
		hoaDonModel = new DefaultTableModel(colHeader, 0);
		tblHoaDon = new JTable(hoaDonModel);
		JScrollPane scrollPane = new JScrollPane(tblHoaDon);
		scrollPane.setBounds(10, 121, 840, 440);
		add(scrollPane);
		
		JButton btnLoc = new JButton("Lọc");
		btnLoc.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				String startDate = sdf.format(dateChooser.getDate().getTime());
				String endDate = sdf.format(dateChooser_1.getDate().getTime());
				
				String[] temp = endDate.split("-");
				temp[2] = Integer.toString((Integer.parseInt(temp[2]) + 1));
				
				endDate = String.join("-", temp);
				if (dateChooser.getDate().getTime() > dateChooser_1.getDate().getTime()) {
					JOptionPane.showMessageDialog(null, "Ngày bắt đầu không được lớn hơn ngày kết thúc");
				}else {
					addHoaDonToTableTuNgayToiNgay(startDate, endDate);
				}
				
				
				System.out.println(endDate);
				System.out.println(dateChooser.getDate().getTime() < dateChooser_1.getDate().getTime());
			}
		});
		btnLoc.setBounds(714, 41, 89, 23);
		add(btnLoc);

		addAllHoaDonToTable();
		setNhanVienCBX();
	}

	public void addAllHoaDonToTable() {
		hoaDonHienThi = new DAOHoaDon().getAllHoaDon();
		if(hoaDonHienThi == null) {
			JOptionPane.showMessageDialog(null, "Có lỗi sảy ra trong quá trình lấy hóa đơn!");
		}else {
			lblSoDong.setText("Số dòng: "+ Integer.toString(hoaDonHienThi.size()));
			for (HoaDon hoaDon : hoaDonHienThi) {
				((DefaultTableModel) hoaDonModel).addRow(new Object[] {
						hoaDonModel.getRowCount(),
						hoaDon.getMaHD(),
						hoaDon.getNgayLap(),
						hoaDon.getNhanVien().getHoTenDem()+ " "+hoaDon.getNhanVien().getTen(),
						hoaDon.getKhachHang().getHoTenDem()+ " "+ hoaDon.getKhachHang().getTen(),
						hoaDon.getTongTien()
				});
			}
			
		}
	}
	
	public void addHoaDonToTableTuNgayToiNgay(String startDate, String endDate) {
		((DefaultTableModel) hoaDonModel).setRowCount(0);
		hoaDonHienThi = new DAOHoaDon().getHoaDonTuNgayDenNgay(startDate, endDate);
		if(hoaDonHienThi == null) {
			JOptionPane.showMessageDialog(null, "Có lỗi sảy ra trong quá trình lấy hóa đơn!");
		}else {
			lblSoDong.setText("Số dòng: "+ Integer.toString(hoaDonHienThi.size()));
			for (HoaDon hoaDon : hoaDonHienThi) {
				((DefaultTableModel) hoaDonModel).addRow(new Object[] {
						hoaDonModel.getRowCount(),
						hoaDon.getMaHD(),
						hoaDon.getNgayLap(),
						hoaDon.getNhanVien().getHoTenDem()+ " "+hoaDon.getNhanVien().getTen(),
						hoaDon.getKhachHang().getHoTenDem()+ " "+ hoaDon.getKhachHang().getTen(),
						hoaDon.getTongTien()
				});
			}
			
		}
	}
	
	public void setNhanVienCBX() {
		ArrayList<String> a = new DAONhanVien().getListTenNhanVien();
		for (String string : a) {
			listNhanVienCBX.addElement(string);
		}
	}
}
