package boundary;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import control.DAOThuoc;
import entity.Thuoc;

import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.util.ArrayList;
import java.awt.Dimension;

public class TimKiem extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private JTextField txtTimKiem;
	private JTable tblDSThuoc;
	private TableModel thuocModal;
	private JPanel pnlGayMe;
	private JPanel pnlTatCa;
	private JPanel pnlTayUe;
	private JPanel pnlGiaiDoc;
	private JPanel pnlChongCoGiat;
	private JPanel pnlChuyenNhiem;
	private JPanel pnlDauNuaDau;
	private JPanel panel_5;
	private JPanel panel_5_1;
	private JPanel panel_5_2;
	private JPanel panel_5_3;
	private JPanel pnlActive;
	private JPanel pnlActive_1;
	private JPanel pnlActive_2;
	private JPanel pnlActive_3;
	private JPanel pnlActive_4;
	private JPanel pnlActive_5;
	private JPanel pnlActive_6;
	private JPanel pnlActive_7;
	private JPanel pnlActive_8;
	private JPanel pnlActive_9;
	private JPanel pnlActive_10;
	private ArrayList<Thuoc> thuocTemp = new ArrayList<Thuoc>();
	private String maThuocChon = "";

	public String getMaThuocChon() {
		return maThuocChon;
	}

	public void setMaThuocChon(String maThuocChon) {
		this.maThuocChon = maThuocChon;
	}

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			TimKiem dialog = new TimKiem("abc");
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public TimKiem(String keyword) {
		setBounds(100, 100, 827, 813);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		JPanel panel = new JPanel();
		panel.setBackground(Color.PINK);
		panel.setBounds(0, 0, 811, 61);
		contentPanel.add(panel);
		panel.setLayout(null);

		JLabel lblTitle = new JLabel("Tìm kiếm thuốc");
		lblTitle.setHorizontalAlignment(SwingConstants.CENTER);
		lblTitle.setFont(new Font("Tahoma", Font.PLAIN, 50));
		lblTitle.setBounds(201, 5, 408, 45);
		panel.add(lblTitle);

		JPanel panel_1 = new JPanel();
		panel_1.setBackground(new Color(95, 199, 227));
		panel_1.setBounds(0, 59, 811, 61);
		contentPanel.add(panel_1);
		panel_1.setLayout(null);

		txtTimKiem = new JTextField();
		txtTimKiem.setText(keyword);
		txtTimKiem.setFont(new Font("Tahoma", Font.PLAIN, 18));
		txtTimKiem.setBounds(127, 11, 414, 39);
		panel_1.add(txtTimKiem);
		txtTimKiem.setColumns(10);

		JButton btnTimKiem = new JButton("Tìm kiếm");
		btnTimKiem.setForeground(Color.WHITE);
		btnTimKiem.setBackground(new Color(71, 115, 170));
		btnTimKiem.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				((DefaultTableModel) thuocModal).setRowCount(0);
				handleDSThuoc();
			}
		});
		btnTimKiem.setFont(new Font("Tahoma", Font.PLAIN, 16));
		btnTimKiem.setBounds(551, 11, 132, 39);
		panel_1.add(btnTimKiem);

		JPanel panel_2 = new JPanel();
		panel_2.setBackground(new Color(237, 244, 146));
		panel_2.setBounds(0, 120, 163, 662);
		contentPanel.add(panel_2);
		panel_2.setLayout(null);

		pnlTatCa = new JPanel();
		pnlTatCa.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(true);
				pnlActive_1.setVisible(false);
				pnlActive_2.setVisible(false);
				pnlActive_3.setVisible(false);
				pnlActive_4.setVisible(false);
				pnlActive_5.setVisible(false);
				pnlActive_6.setVisible(false);
				pnlActive_7.setVisible(false);
				pnlActive_8.setVisible(false);
				pnlActive_9.setVisible(false);
				pnlActive_10.setVisible(false);

				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
							thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		pnlTatCa.setBackground(new Color(168, 223, 101));
		pnlTatCa.setBounds(0, 11, 163, 48);
		panel_2.add(pnlTatCa);
		pnlTatCa.setLayout(null);

		pnlActive = new JPanel();
		pnlActive.setBackground(Color.PINK);
		pnlActive.setBounds(0, 0, 10, 48);
		pnlTatCa.add(pnlActive);

		JLabel lblTatCa = new JLabel("Tất cả");
		lblTatCa.setHorizontalAlignment(SwingConstants.CENTER);
		lblTatCa.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblTatCa.setBounds(10, 11, 143, 26);
		pnlTatCa.add(lblTatCa);

		pnlGayMe = new JPanel();
		pnlGayMe.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(false);
				pnlActive_1.setVisible(true);
				pnlActive_2.setVisible(false);
				pnlActive_3.setVisible(false);
				pnlActive_4.setVisible(false);
				pnlActive_5.setVisible(false);
				pnlActive_6.setVisible(false);
				pnlActive_7.setVisible(false);
				pnlActive_8.setVisible(false);
				pnlActive_9.setVisible(false);
				pnlActive_10.setVisible(false);

				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("1"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		pnlGayMe.setLayout(null);
		pnlGayMe.setBackground(new Color(168, 223, 101));
		pnlGayMe.setBounds(0, 70, 163, 48);
		panel_2.add(pnlGayMe);

		pnlActive_1 = new JPanel();
		pnlActive_1.setVisible(false);
		pnlActive_1.setBackground(Color.PINK);
		pnlActive_1.setBounds(0, 0, 10, 48);
		pnlGayMe.add(pnlActive_1);

		JLabel lblTatCa_1 = new JLabel("Gây mê");
		lblTatCa_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblTatCa_1.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblTatCa_1.setBounds(10, 11, 143, 26);
		pnlGayMe.add(lblTatCa_1);

		pnlTayUe = new JPanel();
		pnlTayUe.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(false);
				pnlActive_1.setVisible(false);
				pnlActive_2.setVisible(true);
				pnlActive_3.setVisible(false);
				pnlActive_4.setVisible(false);
				pnlActive_5.setVisible(false);
				pnlActive_6.setVisible(false);
				pnlActive_7.setVisible(false);
				pnlActive_8.setVisible(false);
				pnlActive_9.setVisible(false);
				pnlActive_10.setVisible(false);

				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("10"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		pnlTayUe.setLayout(null);
		pnlTayUe.setBackground(new Color(168, 223, 101));
		pnlTayUe.setBounds(0, 129, 163, 48);
		panel_2.add(pnlTayUe);

		pnlActive_2 = new JPanel();
		pnlActive_2.setVisible(false);
		pnlActive_2.setBackground(Color.PINK);
		pnlActive_2.setBounds(0, 0, 10, 48);
		pnlTayUe.add(pnlActive_2);

		JLabel lblTatCa_2 = new JLabel("Tẩy uế");
		lblTatCa_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblTatCa_2.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblTatCa_2.setBounds(10, 11, 143, 26);
		pnlTayUe.add(lblTatCa_2);

		pnlGiaiDoc = new JPanel();
		pnlGiaiDoc.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(false);
				pnlActive_1.setVisible(false);
				pnlActive_2.setVisible(false);
				pnlActive_3.setVisible(true);
				pnlActive_4.setVisible(false);
				pnlActive_5.setVisible(false);
				pnlActive_6.setVisible(false);
				pnlActive_7.setVisible(false);
				pnlActive_8.setVisible(false);
				pnlActive_9.setVisible(false);
				pnlActive_10.setVisible(false);

				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("2"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		pnlGiaiDoc.setLayout(null);
		pnlGiaiDoc.setBackground(new Color(168, 223, 101));
		pnlGiaiDoc.setBounds(0, 188, 163, 48);
		panel_2.add(pnlGiaiDoc);

		pnlActive_3 = new JPanel();
		pnlActive_3.setVisible(false);
		pnlActive_3.setBackground(Color.PINK);
		pnlActive_3.setBounds(0, 0, 10, 48);
		pnlGiaiDoc.add(pnlActive_3);

		JLabel lblGiic = new JLabel("Giải độc");
		lblGiic.setHorizontalAlignment(SwingConstants.CENTER);
		lblGiic.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblGiic.setBounds(10, 11, 143, 26);
		pnlGiaiDoc.add(lblGiic);

		pnlChongCoGiat = new JPanel();
		pnlChongCoGiat.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(false);
				pnlActive_1.setVisible(false);
				pnlActive_2.setVisible(false);
				pnlActive_3.setVisible(false);
				pnlActive_4.setVisible(true);
				pnlActive_5.setVisible(false);
				pnlActive_6.setVisible(false);
				pnlActive_7.setVisible(false);
				pnlActive_8.setVisible(false);
				pnlActive_9.setVisible(false);
				pnlActive_10.setVisible(false);

				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("3"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		pnlChongCoGiat.setLayout(null);
		pnlChongCoGiat.setBackground(new Color(168, 223, 101));
		pnlChongCoGiat.setBounds(0, 247, 163, 48);
		panel_2.add(pnlChongCoGiat);

		pnlActive_4 = new JPanel();
		pnlActive_4.setVisible(false);
		pnlActive_4.setBackground(Color.PINK);
		pnlActive_4.setBounds(0, 0, 10, 48);
		pnlChongCoGiat.add(pnlActive_4);

		JLabel lblChngCoGit = new JLabel("Chống co giật");
		lblChngCoGit.setHorizontalAlignment(SwingConstants.CENTER);
		lblChngCoGit.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblChngCoGit.setBounds(10, 11, 143, 26);
		pnlChongCoGiat.add(lblChngCoGit);

		pnlChuyenNhiem = new JPanel();
		pnlChuyenNhiem.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(false);
				pnlActive_1.setVisible(false);
				pnlActive_2.setVisible(false);
				pnlActive_3.setVisible(false);
				pnlActive_4.setVisible(false);
				pnlActive_5.setVisible(true);
				pnlActive_6.setVisible(false);
				pnlActive_7.setVisible(false);
				pnlActive_8.setVisible(false);
				pnlActive_9.setVisible(false);
				pnlActive_10.setVisible(false);

				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("4"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		pnlChuyenNhiem.setLayout(null);
		pnlChuyenNhiem.setBackground(new Color(168, 223, 101));
		pnlChuyenNhiem.setBounds(0, 306, 163, 48);
		panel_2.add(pnlChuyenNhiem);

		pnlActive_5 = new JPanel();
		pnlActive_5.setVisible(false);
		pnlActive_5.setBackground(Color.PINK);
		pnlActive_5.setBounds(0, 0, 10, 48);
		pnlChuyenNhiem.add(pnlActive_5);

		JLabel lblBnhChuynNhim = new JLabel("Chuyền nhiễm");
		lblBnhChuynNhim.setHorizontalAlignment(SwingConstants.CENTER);
		lblBnhChuynNhim.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblBnhChuynNhim.setBounds(10, 11, 143, 26);
		pnlChuyenNhiem.add(lblBnhChuynNhim);

		pnlDauNuaDau = new JPanel();
		pnlDauNuaDau.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(false);
				pnlActive_1.setVisible(false);
				pnlActive_2.setVisible(false);
				pnlActive_3.setVisible(false);
				pnlActive_4.setVisible(false);
				pnlActive_5.setVisible(false);
				pnlActive_6.setVisible(true);
				pnlActive_7.setVisible(false);
				pnlActive_8.setVisible(false);
				pnlActive_9.setVisible(false);
				pnlActive_10.setVisible(false);

				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("5"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		pnlDauNuaDau.setLayout(null);
		pnlDauNuaDau.setBackground(new Color(168, 223, 101));
		pnlDauNuaDau.setBounds(0, 365, 163, 48);
		panel_2.add(pnlDauNuaDau);

		pnlActive_6 = new JPanel();
		pnlActive_6.setVisible(false);
		pnlActive_6.setBackground(Color.PINK);
		pnlActive_6.setBounds(0, 0, 10, 48);
		pnlDauNuaDau.add(pnlActive_6);

		JLabel lblauNau = new JLabel("Đau nửa đầu");
		lblauNau.setHorizontalAlignment(SwingConstants.CENTER);
		lblauNau.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblauNau.setBounds(10, 11, 143, 26);
		pnlDauNuaDau.add(lblauNau);

		panel_5 = new JPanel();
		panel_5.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(false);
				pnlActive_1.setVisible(false);
				pnlActive_2.setVisible(false);
				pnlActive_3.setVisible(false);
				pnlActive_4.setVisible(false);
				pnlActive_5.setVisible(false);
				pnlActive_6.setVisible(false);
				pnlActive_7.setVisible(true);
				pnlActive_8.setVisible(false);
				pnlActive_9.setVisible(false);
				pnlActive_10.setVisible(false);

				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("6"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		panel_5.setLayout(null);
		panel_5.setBackground(new Color(168, 223, 101));
		panel_5.setBounds(0, 424, 163, 48);
		panel_2.add(panel_5);

		pnlActive_7 = new JPanel();
		pnlActive_7.setVisible(false);
		pnlActive_7.setBackground(Color.PINK);
		pnlActive_7.setBounds(0, 0, 10, 48);
		panel_5.add(pnlActive_7);

		JLabel lblChngKhiU = new JLabel("Chống khối u");
		lblChngKhiU.setHorizontalAlignment(SwingConstants.CENTER);
		lblChngKhiU.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblChngKhiU.setBounds(10, 11, 143, 26);
		panel_5.add(lblChngKhiU);

		panel_5_1 = new JPanel();
		panel_5_1.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(false);
				pnlActive_1.setVisible(false);
				pnlActive_2.setVisible(false);
				pnlActive_3.setVisible(false);
				pnlActive_4.setVisible(false);
				pnlActive_5.setVisible(false);
				pnlActive_6.setVisible(false);
				pnlActive_7.setVisible(false);
				pnlActive_8.setVisible(true);
				pnlActive_9.setVisible(false);
				pnlActive_10.setVisible(false);

				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("7"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		panel_5_1.setLayout(null);
		panel_5_1.setBackground(new Color(168, 223, 101));
		panel_5_1.setBounds(0, 483, 163, 48);
		panel_2.add(panel_5_1);

		pnlActive_8 = new JPanel();
		pnlActive_8.setVisible(false);
		pnlActive_8.setBackground(Color.PINK);
		pnlActive_8.setBounds(0, 0, 10, 48);
		panel_5_1.add(pnlActive_8);

		JLabel lblnhHngMu = new JLabel("Ảnh hưởng máu");
		lblnhHngMu.setHorizontalAlignment(SwingConstants.CENTER);
		lblnhHngMu.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblnhHngMu.setBounds(10, 11, 143, 26);
		panel_5_1.add(lblnhHngMu);

		panel_5_2 = new JPanel();
		panel_5_2.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(false);
				pnlActive_1.setVisible(false);
				pnlActive_2.setVisible(false);
				pnlActive_3.setVisible(false);
				pnlActive_4.setVisible(false);
				pnlActive_5.setVisible(false);
				pnlActive_6.setVisible(false);
				pnlActive_7.setVisible(false);
				pnlActive_8.setVisible(false);
				pnlActive_9.setVisible(true);
				pnlActive_10.setVisible(false);
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("8"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		panel_5_2.setLayout(null);
		panel_5_2.setBackground(new Color(168, 223, 101));
		panel_5_2.setBounds(0, 542, 163, 48);
		panel_2.add(panel_5_2);

		pnlActive_9 = new JPanel();
		pnlActive_9.setVisible(false);
		pnlActive_9.setBackground(Color.PINK);
		pnlActive_9.setBounds(0, 0, 10, 48);
		panel_5_2.add(pnlActive_9);

		JLabel lblTimMch = new JLabel("Tim mạch");
		lblTimMch.setHorizontalAlignment(SwingConstants.CENTER);
		lblTimMch.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblTimMch.setBounds(10, 11, 143, 26);
		panel_5_2.add(lblTimMch);

		panel_5_3 = new JPanel();
		panel_5_3.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlActive.setVisible(false);
				pnlActive_1.setVisible(false);
				pnlActive_2.setVisible(false);
				pnlActive_3.setVisible(false);
				pnlActive_4.setVisible(false);
				pnlActive_5.setVisible(false);
				pnlActive_6.setVisible(false);
				pnlActive_7.setVisible(false);
				pnlActive_8.setVisible(false);
				pnlActive_9.setVisible(false);
				pnlActive_10.setVisible(true);
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("9"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
				}
			}
		});
		panel_5_3.setLayout(null);
		panel_5_3.setBackground(new Color(168, 223, 101));
		panel_5_3.setBounds(0, 601, 163, 48);
		panel_2.add(panel_5_3);

		pnlActive_10 = new JPanel();
		pnlActive_10.setVisible(false);
		pnlActive_10.setBackground(Color.PINK);
		pnlActive_10.setBounds(0, 0, 10, 48);
		panel_5_3.add(pnlActive_10);

		JLabel lblDaLiu = new JLabel("Da liễu");
		lblDaLiu.setHorizontalAlignment(SwingConstants.CENTER);
		lblDaLiu.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblDaLiu.setBounds(10, 11, 143, 26);
		panel_5_3.add(lblDaLiu);

		String[] colHeader = { "Mã thuốc", "Tên thuốc", "Giá", "Loại thuốc", "Đơn vị tính" };
		thuocModal = new DefaultTableModel(colHeader, 0);

		handleDSThuoc();

		JPanel panel_4 = new JPanel();
		panel_4.setBounds(164, 120, 647, 643);
		contentPanel.add(panel_4);
		panel_4.setLayout(null);

		JLabel lblDanhSach = new JLabel("Danh sách thuốc");
		lblDanhSach.setHorizontalAlignment(SwingConstants.CENTER);
		lblDanhSach.setFont(new Font("Tahoma", Font.PLAIN, 17));
		lblDanhSach.setBounds(240, 17, 166, 27);
		panel_4.add(lblDanhSach);

		JPanel panel_3 = new JPanel();
		panel_3.setPreferredSize(new Dimension(10, 100));
		panel_3.setBounds(0, 55, 647, 588);
		panel_4.add(panel_3);
		panel_3.setLayout(new BorderLayout(0, 0));
		tblDSThuoc = new JTable(thuocModal);
		tblDSThuoc.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				System.out.println("table");
				int index = tblDSThuoc.getSelectedRow();
				ChiTietTimKiem chiTietTimKiem = new ChiTietTimKiem(tblDSThuoc.getValueAt(index, 0).toString());
				chiTietTimKiem.setVisible(true);
				chiTietTimKiem.addWindowListener(new WindowListener() {

					@Override
					public void windowOpened(WindowEvent e) {
						// TODO Auto-generated method stub

					}

					@Override
					public void windowIconified(WindowEvent e) {
						// TODO Auto-generated method stub

					}

					@Override
					public void windowDeiconified(WindowEvent e) {
						// TODO Auto-generated method stub

					}

					@Override
					public void windowDeactivated(WindowEvent e) {
						// TODO Auto-generated method stub

					}

					@Override
					public void windowClosing(WindowEvent e) {
						// TODO Auto-generated method stub

					}

					@Override
					public void windowClosed(WindowEvent e) {
						// TODO Auto-generated method stub
						if (chiTietTimKiem.isChoose()) {
							setMaThuocChon(tblDSThuoc.getValueAt(tblDSThuoc.getSelectedRow(), 0).toString());
							dispose();
						}
					}

					@Override
					public void windowActivated(WindowEvent e) {
						// TODO Auto-generated method stub

					}
				});
			}
		});
		JScrollPane scrDSThuoc = new JScrollPane(tblDSThuoc);

		panel_3.add(scrDSThuoc, BorderLayout.CENTER);
	}

	public void handleDSThuoc() {
		thuocTemp = new DAOThuoc().timKiemThuoc(txtTimKiem.getText());
		if (thuocTemp == null) {
			JOptionPane.showMessageDialog(null, "Tìm kiếm bị lỗi!");
		} else {
			for (Thuoc thuoc : thuocTemp) {
				((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
						thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh() });
			}

		}
	}
}
