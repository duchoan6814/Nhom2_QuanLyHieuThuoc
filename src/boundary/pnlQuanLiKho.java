package boundary;

import javax.swing.JPanel;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.Color;
import javax.swing.border.BevelBorder;
import javax.swing.border.CompoundBorder;
import javax.swing.border.LineBorder;
import javax.swing.JComboBox;
import javax.swing.JTextField;

public class pnlQuanLiKho extends JPanel {
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTextField textField_4;

	/**
	 * Create the panel.
	 */
	public pnlQuanLiKho() {
		setBackground(new Color(255, 204, 255));
		setLayout(null);
		
		JLabel lblNewLabel = new JLabel("PHI\u1EBEU NH\u1EACP KHO");
		lblNewLabel.setBounds(337, 10, 179, 36);
		lblNewLabel.setForeground(new Color(204, 51, 0));
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 16));
		add(lblNewLabel);
		
		JPanel panel = new JPanel();
		panel.setBounds(28, 42, 782, 173);
		panel.setBackground(new Color(255, 204, 153));
		panel.setBorder(new LineBorder(new Color(0, 0, 0), 0));
		add(panel);
		panel.setLayout(null);
		
		JLabel lblNewLabel_1 = new JLabel("\u0110\u01A1n v\u1ECB giao d\u1ECBch");
		lblNewLabel_1.setBounds(21, 10, 83, 19);
		panel.add(lblNewLabel_1);
		
		JLabel lblNewLabel_2 = new JLabel("\u0110\u1EA1i di\u1EC7n");
		lblNewLabel_2.setBounds(31, 39, 83, 19);
		panel.add(lblNewLabel_2);
		
		textField = new JTextField();
		textField.setBounds(100, 39, 207, 19);
		panel.add(textField);
		textField.setColumns(10);
		
		textField_1 = new JTextField();
		textField_1.setBounds(100, 10, 207, 19);
		panel.add(textField_1);
		textField_1.setColumns(10);
		
		JLabel lblNewLabel_3 = new JLabel(" Ng\u01B0\u1EDDi nh\u1EADn");
		lblNewLabel_3.setBounds(21, 72, 68, 13);
		panel.add(lblNewLabel_3);
		
		textField_2 = new JTextField();
		textField_2.setBounds(99, 69, 208, 19);
		panel.add(textField_2);
		textField_2.setColumns(10);
		
		JLabel lblNewLabel_4 = new JLabel("Sdt ng\u01B0\u1EDDi nh\u1EADn");
		lblNewLabel_4.setBounds(21, 97, 68, 13);
		panel.add(lblNewLabel_4);
		
		textField_3 = new JTextField();
		textField_3.setBounds(100, 98, 207, 19);
		panel.add(textField_3);
		textField_3.setColumns(10);
		
		JLabel lblNewLabel_5 = new JLabel("Nh\u00E2n vi\u00EAn l\u1EADp phi\u1EBFu");
		lblNewLabel_5.setBounds(21, 132, 45, 13);
		panel.add(lblNewLabel_5);
		
		textField_4 = new JTextField();
		textField_4.setBounds(100, 129, 207, 19);
		panel.add(textField_4);
		textField_4.setColumns(10);
		
		JLabel lblNewLabel_6 = new JLabel("New label");
		lblNewLabel_6.setBounds(365, 72, 45, 13);
		panel.add(lblNewLabel_6);

	}
}
