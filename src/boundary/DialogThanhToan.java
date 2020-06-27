package boundary;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import entity.HoaDon;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.Color;
import javax.swing.JTextField;

public class DialogThanhToan extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private JTextField textField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			DialogThanhToan dialog = new DialogThanhToan(null);
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public DialogThanhToan(HoaDon hoaDon) {
		setBounds(100, 100, 518, 456);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBackground(Color.PINK);
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		
		JLabel lblTitle = new JLabel("Thanh toán");
		lblTitle.setFont(new Font("Tahoma", Font.PLAIN, 43));
		lblTitle.setBounds(142, 11, 217, 59);
		contentPanel.add(lblTitle);
		
		JPanel panel = new JPanel();
		panel.setForeground(Color.YELLOW);
		panel.setBounds(0, 100, 502, 62);
		contentPanel.add(panel);
		panel.setLayout(null);
		
		JLabel lblThanhTien = new JLabel("Thành tiền: ");
		lblThanhTien.setFont(new Font("Tahoma", Font.PLAIN, 28));
		lblThanhTien.setBounds(10, 17, 153, 27);
		panel.add(lblThanhTien);
		
		JLabel lblSoTienPhaiTra = new JLabel("150.000đ");
		lblSoTienPhaiTra.setForeground(Color.RED);
		lblSoTienPhaiTra.setFont(new Font("Tahoma", Font.PLAIN, 33));
		lblSoTienPhaiTra.setBounds(173, 13, 319, 31);
		panel.add(lblSoTienPhaiTra);
		
		JPanel panel_1 = new JPanel();
		panel_1.setLayout(null);
		panel_1.setForeground(Color.YELLOW);
		panel_1.setBounds(0, 173, 502, 62);
		contentPanel.add(panel_1);
		
		JLabel lblTienThua = new JLabel("Tiền trả lại khách:");
		lblTienThua.setFont(new Font("Tahoma", Font.PLAIN, 28));
		lblTienThua.setBounds(10, 17, 237, 27);
		panel_1.add(lblTienThua);
		
		JLabel lblTienThoi = new JLabel("Null");
		lblTienThoi.setForeground(Color.RED);
		lblTienThoi.setFont(new Font("Tahoma", Font.PLAIN, 33));
		lblTienThoi.setBounds(248, 13, 244, 31);
		panel_1.add(lblTienThoi);
		
		JPanel panel_1_1 = new JPanel();
		panel_1_1.setLayout(null);
		panel_1_1.setForeground(Color.YELLOW);
		panel_1_1.setBounds(0, 246, 502, 62);
		contentPanel.add(panel_1_1);
		
		JLabel lblTienKhachDua = new JLabel("Khách đưa:");
		lblTienKhachDua.setFont(new Font("Tahoma", Font.PLAIN, 28));
		lblTienKhachDua.setBounds(10, 17, 151, 27);
		panel_1_1.add(lblTienKhachDua);
		
		textField = new JTextField();
		textField.setBorder(new EmptyBorder(0, 0, 0, 0));
		textField.setBackground(Color.WHITE);
		textField.setForeground(Color.RED);
		textField.setFont(new Font("Tahoma", Font.PLAIN, 33));
		textField.setBounds(169, 14, 323, 33);
		panel_1_1.add(textField);
		textField.setColumns(10);
		
		JButton btnThanhToan = new JButton("Thanh Toán");
		btnThanhToan.setBackground(new Color(30, 144, 255));
		btnThanhToan.setForeground(new Color(0, 0, 0));
		btnThanhToan.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnThanhToan.setBounds(68, 328, 168, 68);
		contentPanel.add(btnThanhToan);
		
		JButton btnHuy = new JButton("Hủy");
		btnHuy.setBackground(new Color(255, 69, 0));
		btnHuy.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnHuy.setBounds(273, 328, 168, 68);
		contentPanel.add(btnHuy);
	}
}
