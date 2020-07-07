package boundary;

import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JScrollPane;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.AbstractListModel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import control.DAOKhachHang;
import entity.KhachHang;

import javax.swing.JLabel;
import java.awt.Font;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

public class pnlQuanLyKhachHang extends JPanel {
	private JTextField txtTmKim;
	private TableModel khachHangModel;
	private JTable tblKhachHang;
	private ArrayList<KhachHang> khachHangs = new ArrayList<KhachHang>();

	/**
	 * Create the panel.
	 */
	public pnlQuanLyKhachHang() {
		setForeground(Color.PINK);
		setLayout(null);

		JButton btnNewButton = new JButton("Th\u00EAm Kh\u00E1ch H\u00E0ng");
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				DialogThemKhachHang dialogThemKhachHang = new DialogThemKhachHang("them");
				dialogThemKhachHang.setVisible(true);
				dialogThemKhachHang.setResizable(false);
				dialogThemKhachHang.addWindowListener(new WindowListener() {

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
						if (dialogThemKhachHang.isTrangThaiThem()) {
							docTatCaDucLieuVaoBang();
						}
					}

					@Override
					public void windowActivated(WindowEvent e) {
						// TODO Auto-generated method stub

					}
				});
			}
		});
		btnNewButton.setBackground(Color.CYAN);
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 13));
		btnNewButton.setBounds(241, 59, 164, 38);
		add(btnNewButton);

		txtTmKim = new JTextField();
		txtTmKim.setBounds(614, 66, 164, 27);
		add(txtTmKim);
		txtTmKim.setColumns(10);

		JButton btnNewButton_1 = new JButton("t\u00ECm");
		btnNewButton_1.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				if (txtTmKim.getText().trim().equals("")) {
					docTatCaDucLieuVaoBang();
				} else {
					khachHangs = new DAOKhachHang().timKiemDanhSachKhachHangTheoMa(txtTmKim.getText());
					if (khachHangs == null) {
						JOptionPane.showMessageDialog(null, "Tìm không thành công!");
					} else {
						((DefaultTableModel) khachHangModel).setRowCount(0);
						ArrayList<KhachHang> temp = new DAOKhachHang().timKiemKhachHangTheoTen(txtTmKim.getText());
						for (KhachHang khachHang : temp) {
							if (!khachHangs.contains(khachHang)) {
								khachHangs.add(khachHang);
							}
						}
						for (KhachHang khachHang : khachHangs) {
							((DefaultTableModel) khachHangModel).addRow(new Object[] { khachHangModel.getRowCount(),
									khachHang.getMaKH(), khachHang.getHoTenDem() + " " + khachHang.getTen(),
									chuyenDoiDinhDangTienTe(khachHang.getDiemTichLuy()), chuyenDoiDinhDangTienTe(
											new DAOKhachHang().getTongTienMuaCuaKhachHang(khachHang.getMaKH())) });
						}
					}

				}
			}
		});
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD, 11));
		btnNewButton_1.setBounds(788, 69, 62, 21);
		add(btnNewButton_1);

		JButton btnNewButton_2 = new JButton("X\u00F3a Kh\u00E1ch H\u00E0ng");
		btnNewButton_2.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				int index = tblKhachHang.getSelectedRow();
				if (index < 0) {
					JOptionPane.showMessageDialog(null, "Vui lòng chọn khách hàng cần xóa!");
				} else {
					if (new DAOKhachHang().getDiemTichLuyCuaKhac(tblKhachHang.getValueAt(index, 1).toString()) > 0) {
						JOptionPane.showMessageDialog(null, "Không xóa được các khách hàng đã mua hàng!");
					} else {
						int luaChon = JOptionPane.showConfirmDialog(null, "Bạn có chắc muốn xóa!");
						if (luaChon == JOptionPane.YES_OPTION) {
							if (!new DAOKhachHang().xoaKhachHang(tblKhachHang.getValueAt(index, 1).toString())) {
								JOptionPane.showMessageDialog(null, "Xoá không thành công!");
							} else {
								JOptionPane.showMessageDialog(null, "Xóa thành công.");
								docTatCaDucLieuVaoBang();
							}
						}
					}
				}
			}
		});
		btnNewButton_2.setBackground(Color.CYAN);
		btnNewButton_2.setFont(new Font("Tahoma", Font.BOLD, 13));
		btnNewButton_2.setBounds(43, 59, 172, 38);
		add(btnNewButton_2);

		JLabel lblNewLabel = new JLabel("H\u1ED3 S\u01A1 Kh\u00E1ch H\u00E0ng");
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setBackground(Color.LIGHT_GRAY);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 20));
		lblNewLabel.setBounds(328, 10, 204, 27);
		add(lblNewLabel);

		JButton btnNewButton_3 = new JButton("S\u1EEDa");
		btnNewButton_3.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				int index = tblKhachHang.getSelectedRow();
				if (index < 0) {
					JOptionPane.showMessageDialog(null, "Vui lòng chọn người cần sửa");
				} else {
					String maKhachHang = tblKhachHang.getValueAt(index, 1).toString();
					try {
						DialogThemKhachHang dialog = new DialogThemKhachHang("sua_" + maKhachHang);
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
								if (dialog.isTrangThaiThem()) {
									docTatCaDucLieuVaoBang();
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

			}
		});
		btnNewButton_3.setBackground(Color.CYAN);
		btnNewButton_3.setFont(new Font("Tahoma", Font.BOLD, 13));
		btnNewButton_3.setBounds(431, 60, 142, 38);
		add(btnNewButton_3);

		String[] colheader = { "STT", "Mã khách hàng", "Tên Khách Hàng", "Điểm tích lũy", "Tổng tiền mua" };
		khachHangModel = new DefaultTableModel(colheader, 0);
		tblKhachHang = new JTable(khachHangModel);
		JScrollPane scrollPane = new JScrollPane(tblKhachHang);
		scrollPane.setBounds(10, 126, 840, 468);
		add(scrollPane);

		docTatCaDucLieuVaoBang();

	}

	public String chuyenDoiDinhDangTienTe(double soTien) {
		Locale localeVN = new Locale("vi", "VN");
		NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
		return currencyVN.format(soTien);
	}

	public void docTatCaDucLieuVaoBang() {
		khachHangs = new DAOKhachHang().getListKhachHang();
		((DefaultTableModel) khachHangModel).setRowCount(0);
		for (KhachHang khachHang : khachHangs) {
			((DefaultTableModel) khachHangModel).addRow(new Object[] { khachHangModel.getRowCount(),
					khachHang.getMaKH(), khachHang.getHoTenDem() + " " + khachHang.getTen(),
					chuyenDoiDinhDangTienTe(khachHang.getDiemTichLuy()),
					chuyenDoiDinhDangTienTe(new DAOKhachHang().getTongTienMuaCuaKhachHang(khachHang.getMaKH())) });
		}
	}
}
