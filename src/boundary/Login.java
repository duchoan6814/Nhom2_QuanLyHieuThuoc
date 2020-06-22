package boundary;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import control.DAONhanVien;

import javax.swing.JLabel;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JTextField;
import javax.swing.JPasswordField;
import javax.swing.JCheckBox;
import java.awt.Color;
import java.awt.EventQueue;

public class Login extends JDialog implements ActionListener {

	private final JPanel contentPanel = new JPanel();
	private JTextField txtUserName;
	private JPasswordField txtPassword;
	private boolean checkLogin = false;
	
	

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			Login dialog = new Login();
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean isCheckLogin() {
		return checkLogin;
	}

	public void setCheckLogin(boolean checkLogin) {
		this.checkLogin = checkLogin;
	}

	/**
	 * Create the dialog.
	 */
	public Login() {
		setBounds(100, 100, 297, 397);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBackground(new Color(248,238,238));
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		{
			JLabel lblngNhp = new JLabel("\u0110\u0103ng Nh\u1EADp");
			lblngNhp.setFont(new Font("Dialog", Font.BOLD, 25));
			lblngNhp.setBounds(66, 12, 137, 78);
			contentPanel.add(lblngNhp);
		}
		{
			JLabel lblUserName = new JLabel("User Name");
			lblUserName.setBounds(12, 90, 100, 15);
			contentPanel.add(lblUserName);
		}
		
		txtUserName = new JTextField();
		txtUserName.setBounds(12, 112, 256, 29);
		contentPanel.add(txtUserName);
		txtUserName.setColumns(10);
		
		JLabel lblPassword = new JLabel("Password");
		lblPassword.setBounds(12, 153, 106, 15);
		contentPanel.add(lblPassword);
		
		txtPassword = new JPasswordField();
		txtPassword.setBounds(12, 180, 256, 29);
		contentPanel.add(txtPassword);
		
		JButton btnDangNhap = new JButton("\u0110\u0103ng nh\u1EADp");
		btnDangNhap.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if(new DAONhanVien().getNhanVien(txtUserName.getText(), txtPassword.getText())) {
					EventQueue.invokeLater(new Runnable() {
						public void run() {
							try {
								BanHang frame = new BanHang(txtUserName.getText());
								frame.setVisible(true);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					});
					
					setCheckLogin(true);
				}
			}
		});
		btnDangNhap.setForeground(new Color(255, 255, 255));
		btnDangNhap.setBackground(new Color(122,122,122));
		btnDangNhap.setBounds(12, 259, 117, 25);
		contentPanel.add(btnDangNhap);
		
		JButton btnThoat = new JButton("Tho\u00E1t");
		btnThoat.setForeground(new Color(255, 255, 255));
		btnThoat.setBackground(new Color(122,122,122));
		btnThoat.setBounds(151, 259, 117, 25);
		contentPanel.add(btnThoat);
		
		JCheckBox chkNhoMatKhau = new JCheckBox("Nh\u1EDB m\u1EADt kh\u1EA9u");
		chkNhoMatKhau.setBackground(new Color(248,238,238));
		chkNhoMatKhau.setBounds(12, 217, 129, 23);
		contentPanel.add(chkNhoMatKhau);
		
	}

	@Override
	public void actionPerformed(ActionEvent arg0) {
		// TODO Auto-generated method stub
		
	}
}
