package boundary;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.Color;
import java.awt.Dimension;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.SwingConstants;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.CardLayout;

import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.border.EtchedBorder;
import javax.swing.border.MatteBorder;
import javax.swing.border.TitledBorder;

import control.DAONhanVien;
import entity.NhanVien;

import javax.swing.border.LineBorder;
import javax.swing.BoxLayout;
import java.awt.FlowLayout;
import javax.swing.ImageIcon;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.File;
import java.io.IOException;

import javax.swing.JTextField;

public class BanHang extends JFrame {

	private JPanel pnlContent;
	private JPanel pnlChoose;
	private JPanel pnlChoose_1;
	private JPanel pnlChoose_2;
	private JTextField txtTimKiem;
	private JPanel pnlChucNangKho;
	private JPanel pnlChucNangBanHang;
	private pnlBanHang pnlBanHang_1;
	private NhanVien nhanVien;
	private String username;
	private String maThuocTimKiemChon;
	private pnlQuanLyHoaDon pnlQuanLyHoaDon;
	private JPanel pnlCenter;
	
	
	

	public String getMaThuocTimKiemChon() {
		return maThuocTimKiemChon;
	}

	public void setMaThuocTimKiemChon(String maThuocTimKiemChon) {
		this.maThuocTimKiemChon = maThuocTimKiemChon;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					BanHang frame = new BanHang("duongtu6814");
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 * @throws IOException 
	 */
	public BanHang(String userName) throws IOException {
		nhanVien = new DAONhanVien().getInforNhanVien(userName);
		this.setUsername(userName);
		
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1158, 700);
		pnlContent = new JPanel();
		pnlContent.setBorder(new EmptyBorder(5, 5, 5, 5));
		pnlContent.setLayout(new BorderLayout(0, 0));
		setContentPane(pnlContent);
		
		JPanel pnlTop = new JPanel();
		pnlTop.setBorder(new MatteBorder(0, 0, 1, 0, (Color) new Color(0, 0, 0)));
		pnlTop.setLayout(null);
		pnlTop.setPreferredSize(new Dimension(10, 50));
		pnlTop.setBackground(new Color(168, 230, 207));
		pnlContent.add(pnlTop, BorderLayout.NORTH);
		
		JLabel lblLogo = new JLabel("Logo");
		lblLogo.setHorizontalAlignment(SwingConstants.CENTER);
		lblLogo.setFont(new Font("Dialog", Font.BOLD, 30));
		lblLogo.setBounds(0, 0, 271, 50);
		pnlTop.add(lblLogo);
		
		JPanel pnlTopCenter = new JPanel();
		pnlTopCenter.setLayout(null);
		pnlTopCenter.setPreferredSize(new Dimension(10, 40));
		pnlTopCenter.setBackground(new Color(220,237,193));
		pnlTopCenter.setBounds(270, 6, 607, 38);
		pnlTop.add(pnlTopCenter);
		
		JLabel lblPos = new JLabel("Pos 01");
		lblPos.setFont(new Font("Dialog", Font.BOLD, 16));
		lblPos.setHorizontalAlignment(SwingConstants.CENTER);
		lblPos.setForeground(new Color(0, 0, 0));
		lblPos.setBounds(27, 0, 70, 38);
		pnlTopCenter.add(lblPos);
		
		JLabel lblNhanVien = new JLabel("Nhân viên: "+ nhanVien.getHoTenDem()+" "+ nhanVien.getTen());
		lblNhanVien.setFont(new Font("Dialog", Font.BOLD, 16));
		lblNhanVien.setForeground(new Color(0, 0, 0));
		lblNhanVien.setBounds(126, 0, 268, 38);
		pnlTopCenter.add(lblNhanVien);
		
		JLabel lblSoHoaDon = new JLabel("S\u1ED1 h\u00F3a \u0111\u01A1n: 120");
		lblSoHoaDon.setHorizontalAlignment(SwingConstants.LEFT);
		lblSoHoaDon.setForeground(new Color(0, 0, 0));
		lblSoHoaDon.setFont(new Font("Dialog", Font.BOLD, 16));
		lblSoHoaDon.setBounds(425, 0, 158, 38);
		pnlTopCenter.add(lblSoHoaDon);
		
		JPanel pnlDateTime = new JPanel();
		pnlDateTime.setBorder(new MatteBorder(0, 0, 1, 0, (Color) new Color(0, 0, 0)));
		pnlDateTime.setBackground(new Color(168, 230, 207));
		pnlDateTime.setBounds(889, 0, 247, 50);
		pnlTop.add(pnlDateTime);
		pnlDateTime.setLayout(new GridLayout(0, 1, 0, 0));
		
		JLabel lblTime = new JLabel("11:00");
		lblTime.setHorizontalAlignment(SwingConstants.CENTER);
		pnlDateTime.add(lblTime);
		
		JLabel lblDate = new JLabel("30/01/2020");
		lblDate.setHorizontalAlignment(SwingConstants.CENTER);
		pnlDateTime.add(lblDate);
		
		JPanel pnlRight = new JPanel();
		pnlRight.setBorder(new EmptyBorder(0, 0, 0, 0));
		pnlRight.setBackground(new Color(251,211,182));
		pnlRight.setPreferredSize(new Dimension(270, 10));
		pnlContent.add(pnlRight, BorderLayout.EAST);
		pnlRight.setLayout(null);
		
		JPanel pnlRightTop = new JPanel();
		pnlRightTop.setBorder(new TitledBorder(new LineBorder(new Color(0, 0, 0, 0)), "Ch\u1EE9c n\u0103ng", TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 0, 0)));
		pnlRightTop.setBackground(new Color(251,211,182));
		pnlRightTop.setBounds(0, 12, 270, 297);
		pnlRight.add(pnlRightTop);
		pnlRightTop.setLayout(new CardLayout(0, 0));
		
		pnlChucNangBanHang = new JPanel();
		pnlChucNangBanHang.setBorder(new EmptyBorder(0, 0, 0, 0));
		pnlChucNangBanHang.setBackground(new Color(255, 211, 182));
		pnlRightTop.add(pnlChucNangBanHang, "name_7662591450020");
		pnlChucNangBanHang.setLayout(null);
		
		txtTimKiem = new JTextField();
		txtTimKiem.setBounds(12, 12, 236, 34);
		pnlChucNangBanHang.add(txtTimKiem);
		txtTimKiem.setColumns(10);
		
		JButton btnTimKiem = new JButton("Tìm kiếm");
		btnTimKiem.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				TimKiem timKiem = new TimKiem(txtTimKiem.getText());
				timKiem.setVisible(true);
				timKiem.addWindowListener(new WindowListener() {
					
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
						pnlBanHang_1.khiTimKiemXong(timKiem.getMaThuocChon());
					}
					
					@Override
					public void windowActivated(WindowEvent e) {
						// TODO Auto-generated method stub
						
					}
				});
			}
		});
		btnTimKiem.setIcon(new ImageIcon(ImageIO.read(new File("Icon\\search.png"))));
		btnTimKiem.setBackground(new Color(249,170,166));
		btnTimKiem.setBounds(12, 57, 236, 41);
		pnlChucNangBanHang.add(btnTimKiem);
		
		JButton btnChucNangHoaDon = new JButton("Hóa đơn");
		btnChucNangHoaDon.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				CardLayout cardLayout = (CardLayout) pnlCenter.getLayout();
				cardLayout.show(pnlCenter, "pnlQuanLyHoaDon");
			}
		});
		btnChucNangHoaDon.setIcon(new ImageIcon(ImageIO.read(new File("Icon\\bill.png"))));
		btnChucNangHoaDon.setBackground(new Color(255, 153, 102));
		btnChucNangHoaDon.setBounds(12, 120, 236, 41);
		pnlChucNangBanHang.add(btnChucNangHoaDon);
		
		JButton btnChucNangThongKe = new JButton("Thống kê");
		btnChucNangThongKe.setBackground(new Color(255, 153, 102));
		btnChucNangThongKe.setBounds(12, 224, 236, 41);
		pnlChucNangBanHang.add(btnChucNangThongKe);
		
		JButton btnChucNangKhachHang = new JButton("Khách hàng");
		btnChucNangKhachHang.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		btnChucNangKhachHang.setBackground(new Color(255, 153, 102));
		btnChucNangKhachHang.setBounds(12, 172, 236, 41);
		pnlChucNangBanHang.add(btnChucNangKhachHang);
		
		pnlChucNangKho = new JPanel();
		pnlChucNangKho.setBorder(new EmptyBorder(0, 0, 0, 0));
		pnlChucNangKho.setBackground(new Color(255, 211, 182));
		pnlRightTop.add(pnlChucNangKho, "name_7698100502550");
		pnlChucNangKho.setLayout(null);
		
		JButton btnNewButton = new JButton("Nhập hàng");
		btnNewButton.setBackground(new Color(255, 153, 102));
		btnNewButton.setBounds(10, 11, 240, 40);
		pnlChucNangKho.add(btnNewButton);
		
		JButton btnNewButton_1 = new JButton("Xuất hàng");
		btnNewButton_1.setBackground(new Color(255, 153, 102));
		btnNewButton_1.setBounds(10, 62, 240, 40);
		pnlChucNangKho.add(btnNewButton_1);
		
		JPanel pnlRightBottom = new JPanel();
		pnlRightBottom.setBackground(new Color(251,211,182));
		pnlRightBottom.setBorder(new TitledBorder(new LineBorder(new Color(0, 0, 0, 0)), "L\u1EF1a ch\u1ECDn", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		pnlRightBottom.setBounds(0, 321, 270, 293);
		pnlRight.add(pnlRightBottom);
		pnlRightBottom.setLayout(null);
		
		JPanel pnlBtnBanHang = new JPanel();
		pnlBtnBanHang.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				pnlChoose.setVisible(true);
				pnlChoose_1.setVisible(false);
				CardLayout cardLayout = (CardLayout) pnlRightTop.getLayout();
				cardLayout.show(pnlRightTop, "name_7662591450020");
			}
		});
		pnlBtnBanHang.setBackground(new Color(249,170,166));
		pnlBtnBanHang.setBounds(0, 38, 270, 57);
		pnlRightBottom.add(pnlBtnBanHang);
		pnlBtnBanHang.setLayout(null);
		
		JLabel lblBanHang_1 = new JLabel("Bán Hàng");
		lblBanHang_1.setIcon(new ImageIcon(ImageIO.read(new File("Icon\\salse.png"))));
		lblBanHang_1.setFont(new Font("Dialog", Font.BOLD, 18));
		lblBanHang_1.setBounds(67, 12, 135, 33);
		pnlBtnBanHang.add(lblBanHang_1);
		
		pnlChoose = new JPanel();
		pnlChoose.setBackground(new Color(153, 255, 204));
		pnlChoose.setBounds(260, 0, 10, 57);
		pnlBtnBanHang.add(pnlChoose);
		
		JPanel pnlBtnBanHang_1 = new JPanel();
		pnlBtnBanHang_1.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				pnlChoose.setVisible(false);
				pnlChoose_1.setVisible(true);
				pnlChoose_2.setVisible(false);
				CardLayout cardLayout = (CardLayout) pnlRightTop.getLayout();
				cardLayout.show(pnlRightTop, "name_7698100502550");
			}
		});
		pnlBtnBanHang_1.setLayout(null);
		pnlBtnBanHang_1.setBackground(new Color(249, 170, 166));
		pnlBtnBanHang_1.setBounds(0, 107, 270, 57);
		pnlRightBottom.add(pnlBtnBanHang_1);
		
		JLabel lblKho = new JLabel("Kho");
		lblKho.setIcon(new ImageIcon(ImageIO.read(new File("Icon\\data-warehouse.png"))));
		lblKho.setFont(new Font("Dialog", Font.BOLD, 18));
		lblKho.setBounds(67, 12, 135, 33);
		pnlBtnBanHang_1.add(lblKho);
		
		pnlChoose_1 = new JPanel();
		pnlChoose_1.setVisible(false);
		pnlChoose_1.setBackground(new Color(153, 255, 204));
		pnlChoose_1.setBounds(260, 0, 10, 57);
		pnlBtnBanHang_1.add(pnlChoose_1);
		
		JPanel pnlBtnBanHang_2 = new JPanel();
		pnlBtnBanHang_2.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				int dialogResult = JOptionPane.showConfirmDialog (null, "Bạn có muốn đăng xuất?");
				if(dialogResult == JOptionPane.YES_OPTION){
				  // Saving code here
					new TrangChu().setVisible(true);
					dispose();
				}
			}
		});
		pnlBtnBanHang_2.setLayout(null);
		pnlBtnBanHang_2.setBackground(new Color(249, 170, 166));
		pnlBtnBanHang_2.setBounds(0, 176, 270, 57);
		pnlRightBottom.add(pnlBtnBanHang_2);
		
		JLabel lblDangXuat = new JLabel("Đăng Xuất");
		lblDangXuat.setIcon(new ImageIcon(ImageIO.read(new File("Icon\\logout.png"))));
		lblDangXuat.setFont(new Font("Dialog", Font.BOLD, 18));
		lblDangXuat.setBounds(67, 12, 148, 33);
		pnlBtnBanHang_2.add(lblDangXuat);
		
		pnlChoose_2 = new JPanel();
		pnlChoose_2.setVisible(false);
		pnlChoose_2.setBackground(new Color(153, 255, 204));
		pnlChoose_2.setBounds(260, 0, 10, 57);
		pnlBtnBanHang_2.add(pnlChoose_2);
		
		pnlCenter = new JPanel();
		pnlContent.add(pnlCenter, BorderLayout.CENTER);
		pnlCenter.setLayout(new CardLayout(0, 0));
		
		pnlBanHang_1 = new pnlBanHang(userName);
		pnlCenter.add(pnlBanHang_1, "pnlBanHang");
		pnlBanHang_1.setLayout(null);
		
		pnlQuanLyHoaDon = new pnlQuanLyHoaDon();
		pnlCenter.add(pnlQuanLyHoaDon, "pnlQuanLyHoaDon");
		pnlQuanLyHoaDon.setLayout(null);
	}
}
