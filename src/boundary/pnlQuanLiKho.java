package boundary;

import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import java.util.ArrayList;
import java.awt.Color;
import javax.swing.border.BevelBorder;
import javax.swing.border.CompoundBorder;
import javax.swing.border.LineBorder;
import javax.swing.table.DefaultTableModel;

import control.DAOThuoc;
import entity.Thuoc;

import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

public class pnlQuanLiKho extends JPanel {
	private JTextField txtTimKiem;
	private DefaultTableModel thuocModal;
	private JTable tblThuoc;
	private ArrayList<Thuoc> thuocTemp;
	private JPanel panel_2;
	private JPanel panel_2_1;
	private JPanel panel_2_2;
	private JPanel panel_2_3;
	private JPanel panel_2_4;
	private JPanel panel_2_5;
	private JPanel panel_2_6;
	private JPanel panel_2_7;
	private JPanel panel_2_8;
	private JPanel panel_2_9;
	private JPanel panel_2_9_1;

	/**
	 * Create the panel.
	 */
	public pnlQuanLiKho() {
		setBackground(new Color(255, 204, 255));
		setLayout(null);

		JLabel lblNewLabel = new JLabel("Kho");
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 40));
		lblNewLabel.setBounds(355, 11, 149, 42);
		add(lblNewLabel);

		txtTimKiem = new JTextField();
		txtTimKiem.setBounds(10, 68, 233, 31);
		add(txtTimKiem);
		txtTimKiem.setColumns(10);

		JButton btnNewButton = new JButton("Tìm Kiếm");
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(244, 164, 96));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);
				handleDSThuoc();
			}
		});
		btnNewButton.setBounds(253, 69, 126, 29);
		add(btnNewButton);

		JPanel panel = new JPanel();
		panel.setBounds(0, 110, 860, 495);
		add(panel);
		panel.setLayout(null);

		JPanel panel_1 = new JPanel();
		panel_1.setBackground(new Color(255, 250, 240));
		panel_1.setBounds(0, 0, 167, 495);
		panel.add(panel_1);
		panel_1.setLayout(null);

		panel_2 = new JPanel();
		panel_2.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(244, 164, 96));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
							thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}
			}
		});
		panel_2.setBackground(new Color(244, 164, 96));
		panel_2.setBounds(0, 0, 167, 34);
		panel_1.add(panel_2);
		panel_2.setLayout(null);

		JLabel lblNewLabel_1 = new JLabel("Tất cả");
		lblNewLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1.setBounds(0, 10, 167, 14);
		panel_2.add(lblNewLabel_1);

		panel_2_1 = new JPanel();
		panel_2_1.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(255, 218, 185));
				panel_2_1.setBackground(new Color(244, 164, 96));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("1"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}
			}
		});
		panel_2_1.setLayout(null);
		panel_2_1.setBackground(new Color(255, 218, 185));
		panel_2_1.setBounds(0, 45, 167, 34);
		panel_1.add(panel_2_1);

		JLabel lblNewLabel_1_1 = new JLabel("Gây mê");
		lblNewLabel_1_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1_1.setBounds(0, 10, 167, 14);
		panel_2_1.add(lblNewLabel_1_1);

		panel_2_2 = new JPanel();
		panel_2_2.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(255, 218, 185));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(244, 164, 96));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("10"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}
			}
		});
		panel_2_2.setLayout(null);
		panel_2_2.setBackground(new Color(255, 218, 185));
		panel_2_2.setBounds(0, 90, 167, 34);
		panel_1.add(panel_2_2);

		JLabel lblNewLabel_1_2 = new JLabel("Tẩy uế");
		lblNewLabel_1_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1_2.setBounds(0, 10, 167, 14);
		panel_2_2.add(lblNewLabel_1_2);

		panel_2_3 = new JPanel();
		panel_2_3.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(255, 218, 185));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(244, 164, 96));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("2"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}
			}
		});
		panel_2_3.setLayout(null);
		panel_2_3.setBackground(new Color(255, 218, 185));
		panel_2_3.setBounds(0, 135, 167, 34);
		panel_1.add(panel_2_3);

		JLabel lblNewLabel_1_3 = new JLabel("Giải độc");
		lblNewLabel_1_3.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1_3.setBounds(0, 10, 167, 14);
		panel_2_3.add(lblNewLabel_1_3);

		panel_2_4 = new JPanel();
		panel_2_4.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(255, 218, 185));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(244, 164, 96));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("3"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}
			}
		});
		panel_2_4.setLayout(null);
		panel_2_4.setBackground(new Color(255, 218, 185));
		panel_2_4.setBounds(0, 180, 167, 34);
		panel_1.add(panel_2_4);

		JLabel lblNewLabel_1_4 = new JLabel("Chống co giật");
		lblNewLabel_1_4.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1_4.setBounds(0, 10, 167, 14);
		panel_2_4.add(lblNewLabel_1_4);

		panel_2_5 = new JPanel();
		panel_2_5.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(255, 218, 185));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(244, 164, 96));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("4"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}
			}
		});
		panel_2_5.setLayout(null);
		panel_2_5.setBackground(new Color(255, 218, 185));
		panel_2_5.setBounds(0, 225, 167, 34);
		panel_1.add(panel_2_5);

		JLabel lblNewLabel_1_5 = new JLabel("Truyền nhiễm");
		lblNewLabel_1_5.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1_5.setBounds(0, 10, 167, 14);
		panel_2_5.add(lblNewLabel_1_5);

		panel_2_6 = new JPanel();
		panel_2_6.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(255, 218, 185));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(244, 164, 96));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("5"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}

			}
		});
		panel_2_6.setLayout(null);
		panel_2_6.setBackground(new Color(255, 218, 185));
		panel_2_6.setBounds(0, 270, 167, 34);
		panel_1.add(panel_2_6);

		JLabel lblNewLabel_1_6 = new JLabel("Đau nửa đầu");
		lblNewLabel_1_6.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1_6.setBounds(0, 10, 167, 14);
		panel_2_6.add(lblNewLabel_1_6);

		panel_2_7 = new JPanel();
		panel_2_7.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(255, 218, 185));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(244, 164, 96));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("6"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}
			}
		});
		panel_2_7.setLayout(null);
		panel_2_7.setBackground(new Color(255, 218, 185));
		panel_2_7.setBounds(0, 315, 167, 34);
		panel_1.add(panel_2_7);

		JLabel lblNewLabel_1_7 = new JLabel("Chống khối u");
		lblNewLabel_1_7.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1_7.setBounds(0, 10, 167, 14);
		panel_2_7.add(lblNewLabel_1_7);

		panel_2_8 = new JPanel();
		panel_2_8.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(255, 218, 185));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(244, 164, 96));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("7"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}
			}
		});
		panel_2_8.setLayout(null);
		panel_2_8.setBackground(new Color(255, 218, 185));
		panel_2_8.setBounds(0, 360, 167, 34);
		panel_1.add(panel_2_8);

		JLabel lblNewLabel_1_8 = new JLabel("Ảnh hưởng máu");
		lblNewLabel_1_8.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1_8.setBounds(0, 10, 167, 14);
		panel_2_8.add(lblNewLabel_1_8);

		panel_2_9 = new JPanel();
		panel_2_9.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(255, 218, 185));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(244, 164, 96));
				panel_2_9_1.setBackground(new Color(255, 218, 185));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("8"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}
			}
		});
		panel_2_9.setLayout(null);
		panel_2_9.setBackground(new Color(255, 218, 185));
		panel_2_9.setBounds(0, 405, 167, 34);
		panel_1.add(panel_2_9);

		JLabel lblNewLabel_1_9 = new JLabel("Tim mạch");
		lblNewLabel_1_9.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1_9.setBounds(0, 10, 167, 14);
		panel_2_9.add(lblNewLabel_1_9);

		panel_2_9_1 = new JPanel();
		panel_2_9_1.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				panel_2.setBackground(new Color(255, 218, 185));
				panel_2_1.setBackground(new Color(255, 218, 185));
				panel_2_2.setBackground(new Color(255, 218, 185));
				panel_2_3.setBackground(new Color(255, 218, 185));
				panel_2_4.setBackground(new Color(255, 218, 185));
				panel_2_5.setBackground(new Color(255, 218, 185));
				panel_2_6.setBackground(new Color(255, 218, 185));
				panel_2_7.setBackground(new Color(255, 218, 185));
				panel_2_8.setBackground(new Color(255, 218, 185));
				panel_2_9.setBackground(new Color(255, 218, 185));
				panel_2_9_1.setBackground(new Color(244, 164, 96));
				((DefaultTableModel) thuocModal).setRowCount(0);

				for (Thuoc thuoc : thuocTemp) {
					if (thuoc.getLoai().getMaTheLoai().equals("9"))
						((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
								thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
				}
			}
		});
		panel_2_9_1.setLayout(null);
		panel_2_9_1.setBackground(new Color(255, 218, 185));
		panel_2_9_1.setBounds(0, 450, 167, 34);
		panel_1.add(panel_2_9_1);

		JLabel lblNewLabel_1_9_1 = new JLabel("Da liễu");
		lblNewLabel_1_9_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1_9_1.setBounds(0, 10, 167, 14);
		panel_2_9_1.add(lblNewLabel_1_9_1);

		String[] colHeader = { "Mã thuốc", "Tên thuốc", "Giá", "Loại thuốc", "Đơn vị tính", "Số lương tồn" };
		thuocModal = new DefaultTableModel(colHeader, 0);

		tblThuoc = new JTable(thuocModal);
		JScrollPane scrollPane = new JScrollPane(tblThuoc);
		scrollPane.setBounds(177, 11, 673, 473);
		panel.add(scrollPane);

		handleDSThuoc();

		JButton btnThm = new JButton("Thêm");
		btnThm.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				try {
					DialogThemMoiThuoc dialog = new DialogThemMoiThuoc();
					dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
					dialog.setVisible(true);
					dialog.addWindowListener(new WindowListener() {
						
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
							if (dialog.isTrangThaiThemMoi()) {
								handleDSThuoc();
							}
						}
						
						@Override
						public void windowActivated(WindowEvent e) {
							// TODO Auto-generated method stub
							
						}
					});
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		});
		btnThm.setBounds(572, 69, 86, 29);
		add(btnThm);

		JButton btnXa = new JButton("Xóa");
		btnXa.setBounds(668, 69, 86, 29);
		add(btnXa);

		JButton btnSa = new JButton("Sửa");
		btnSa.setBounds(764, 69, 86, 29);
		add(btnSa);

		JButton btnChitiet = new JButton("Chi tiết");
		btnChitiet.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				int index = tblThuoc.getSelectedRow();
				if (index < 0) {
					JOptionPane.showMessageDialog(null, "Vui lòng chọn thuốc cần xem!");
				}else {
					try {
						DialogChiTietThuocKho dialog = new DialogChiTietThuocKho(tblThuoc.getValueAt(index, 0)+"");
						dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
						dialog.setVisible(true);
					} catch (Exception e1) {
						e1.printStackTrace();
					}
				}
			}
		});
		btnChitiet.setBounds(476, 69, 86, 29);
		add(btnChitiet);

	}

	public void handleDSThuoc() {
		thuocTemp = new DAOThuoc().timKiemThuoc(txtTimKiem.getText());
		if (thuocTemp == null) {
			JOptionPane.showMessageDialog(null, "Tìm kiếm bị lỗi!");
		} else {
			for (Thuoc thuoc : thuocTemp) {
				((DefaultTableModel) thuocModal).addRow(new Object[] { thuoc.getMaThuoc(), thuoc.getTenThuoc(),
						thuoc.getGia(), thuoc.getLoai().getTenTheLoai(), thuoc.getDonViTinh(), thuoc.getSoLuong() });
			}

		}
	}
}
