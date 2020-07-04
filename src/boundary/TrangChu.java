package boundary;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.Dimension;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.SwingConstants;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.Image;

import javax.swing.UIManager;
import java.awt.SystemColor;
import javax.swing.border.LineBorder;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class TrangChu extends JFrame {

	private JPanel pnlContent;

	/**
	 * Launch the application.
	 */
//	public static void main(String[] args) {
//		EventQueue.invokeLater(new Runnable() {
//			public void run() {
//				try {
//					TrangChu frame = new TrangChu();
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		});
//	}

	/**
	 * Create the frame.
	 */
	public TrangChu() {
		this.setVisible(true);
		this.setResizable(false);
		this.setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1050, 617);
		pnlContent = new JPanel();
		pnlContent.setFont(new Font("Dialog", Font.PLAIN, 15));
		pnlContent.setBorder(new EmptyBorder(5, 5, 5, 5));
		pnlContent.setLayout(new BorderLayout(0, 0));
		setContentPane(pnlContent);

		JPanel pnlTop = new JPanel();
		pnlTop.setBackground(new Color(168, 230, 207));
		pnlTop.setPreferredSize(new Dimension(10, 50));
		pnlContent.add(pnlTop, BorderLayout.NORTH);
		pnlTop.setLayout(null);

		JLabel lblLogo = new JLabel("Logo");
		lblLogo.setHorizontalAlignment(SwingConstants.CENTER);
		lblLogo.setFont(new Font("Dialog", Font.BOLD, 30));
		lblLogo.setBounds(0, 0, 208, 50);
		pnlTop.add(lblLogo);

		JPanel pnlTopCenter = new JPanel();
		pnlTopCenter.setBackground(SystemColor.textInactiveText);
		pnlTopCenter.setPreferredSize(new Dimension(10, 40));
		pnlTopCenter.setBounds(202, 6, 607, 38);
		pnlTop.add(pnlTopCenter);
		pnlTopCenter.setLayout(null);

		JLabel lblPos = new JLabel("Pos 01");
		lblPos.setForeground(SystemColor.text);
		lblPos.setHorizontalAlignment(SwingConstants.CENTER);
		lblPos.setBounds(268, 11, 70, 15);
		pnlTopCenter.add(lblPos);

		JPanel pnlDateTime = new JPanel();
		pnlDateTime.setBorder(new EmptyBorder(0, 0, 0, 0));
		pnlDateTime.setBackground(new Color(168, 230, 207));
		pnlDateTime.setBounds(821, 0, 219, 50);
		pnlTop.add(pnlDateTime);
		pnlDateTime.setLayout(new GridLayout(0, 1, 0, 0));

		JLabel lblTime = new JLabel("11:00");
		lblTime.setHorizontalAlignment(SwingConstants.CENTER);
		pnlDateTime.add(lblTime);

		JLabel lblDate = new JLabel("30/01/2020");
		lblDate.setHorizontalAlignment(SwingConstants.CENTER);
		pnlDateTime.add(lblDate);

		JPanel pnlCenter = new JPanel();
		pnlCenter.setBorder(new EmptyBorder(0, 0, 0, 0));
		pnlCenter.setBackground(new Color(248,243,236));
		pnlContent.add(pnlCenter, BorderLayout.CENTER);
		pnlCenter.setLayout(null);
		
		JLabel lblGioiThieu_1 = new JLabel("Chào mừng các bạn đến với chương trình quản lý hiệu thuốc của chúng tôi.");
		lblGioiThieu_1.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lblGioiThieu_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblGioiThieu_1.setBounds(243, 180, 554, 30);
		pnlCenter.add(lblGioiThieu_1);
		
		JLabel lblLogo_1 = new JLabel("Logo");
		lblLogo_1.setFont(new Font("Dialog", Font.BOLD, 99));
		lblLogo_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblLogo_1.setBounds(301, -5, 438, 215);
		pnlCenter.add(lblLogo_1);
		
		JLabel lblGioiThieu_2 = new JLabel("Đây là một sản phẩm bài tập lớn cuối kỳ môn lập trình hướng sự kiện với công nghệ Java do cô Trần Thị Anh Thi giảng dạy.");
		lblGioiThieu_2.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblGioiThieu_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblGioiThieu_2.setBounds(65, 221, 913, 30);
		pnlCenter.add(lblGioiThieu_2);
		
		JLabel lblChcCcBn = new JLabel("Chúc các bạn trảinghiệm vui vẻ.");
		lblChcCcBn.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblChcCcBn.setHorizontalAlignment(SwingConstants.CENTER);
		lblChcCcBn.setBounds(226, 262, 582, 30);
		pnlCenter.add(lblChcCcBn);
		
		JButton btnDangNhap = new JButton("Đăng nhập");
		btnDangNhap.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				try {
					Login dialog = new Login();
					dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
					dialog.setLocationRelativeTo(null);
					dialog.setVisible(true);
					setVisible(false);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		btnDangNhap.setBorder(new EmptyBorder(0, 0, 0, 0));
		btnDangNhap.setFont(new Font("Dialog", Font.BOLD, 15));
		btnDangNhap.setBounds(314, 314, 175, 132);
		btnDangNhap.setBackground(new Color(234,172,157));
		pnlCenter.add(btnDangNhap);
		
		JButton btnDangKy = new JButton("Đăng ký");
		btnDangKy.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				new FormDangKy().setVisible(true);
			}
		});
		btnDangKy.setFont(new Font("Dialog", Font.BOLD, 15));
		btnDangKy.setBorder(new EmptyBorder(0, 0, 0, 0));
		btnDangKy.setBackground(new Color(128, 189, 171));
		btnDangKy.setBounds(539, 314, 175, 132);
		pnlCenter.add(btnDangKy);
	}
}
