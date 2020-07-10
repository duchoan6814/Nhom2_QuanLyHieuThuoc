package boundary;

import javax.swing.JPanel;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.SystemColor;
import javax.swing.border.TitledBorder;
import java.awt.Color;
import javax.swing.JTextField;
import javax.swing.JComboBox;
import javax.swing.JCheckBox;
import javax.swing.JScrollBar;
import javax.swing.JList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.border.BevelBorder;
import javax.swing.border.LineBorder;
import javax.swing.AbstractListModel;
import javax.swing.JScrollPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class pnlNhapKho extends JPanel {
	private JTextField textField;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTable table;
	private JTextField textField_4;
	private JTextField textField_5;
	private JTextField textField_6;
	private JTextField textField_7;
	private JTextField textField_8;

	/**
	 * Create the panel.
	 */
	public pnlNhapKho() {
		setBackground(new Color(255, 240, 245));
		setForeground(new Color(255, 228, 225));
		setLayout(null);
		
		JLabel lblNewLabel = new JLabel("PHI\u1EBEU NH\u1EACP");
		lblNewLabel.setBounds(32, 23, 291, 24);
		lblNewLabel.setForeground(SystemColor.infoText);
		lblNewLabel.setFont(new Font("Times New Roman", Font.PLAIN, 22));
		add(lblNewLabel);
		
		JPanel panel = new JPanel();
		panel.setBounds(26, 58, 803, 154);
		panel.setBackground(new Color(255, 250, 205));
		panel.setBorder(new TitledBorder(null, "Th\u00F4ng Tin Phi\u1EBFu", TitledBorder.LEADING, TitledBorder.TOP, null, SystemColor.textHighlight));
		add(panel);
		panel.setLayout(null);
		
		JLabel lblNewLabel_1 = new JLabel("T\u00EAn SP");
		lblNewLabel_1.setBounds(10, 31, 54, 22);
		panel.add(lblNewLabel_1);
		
		JLabel lblNewLabel_1_1 = new JLabel("DVT");
		lblNewLabel_1_1.setBounds(10, 64, 54, 22);
		panel.add(lblNewLabel_1_1);
		
		JLabel lblNewLabel_1_2 = new JLabel("Chi\u1EBFt kh\u1EA5u");
		lblNewLabel_1_2.setBounds(10, 97, 54, 22);
		panel.add(lblNewLabel_1_2);
		
		JLabel lblNewLabel_1_3 = new JLabel(" S\u1ED1 l\u01B0\u1EE3ng");
		lblNewLabel_1_3.setBounds(261, 31, 54, 22);
		panel.add(lblNewLabel_1_3);
		
		JLabel lblNewLabel_1_4 = new JLabel("\u0110\u01A1n gi\u00E1");
		lblNewLabel_1_4.setBounds(261, 64, 54, 22);
		panel.add(lblNewLabel_1_4);
		
		JLabel lblNewLabel_1_4_1 = new JLabel("S\u1ED1 phi\u1EBFu ");
		lblNewLabel_1_4_1.setBounds(512, 35, 54, 22);
		panel.add(lblNewLabel_1_4_1);
		
		JLabel lblNewLabel_1_4_2 = new JLabel("T\u1ED5ng ti\u1EC1n");
		lblNewLabel_1_4_2.setBounds(512, 68, 54, 22);
		panel.add(lblNewLabel_1_4_2);
		
		textField = new JTextField();
		textField.setBounds(70, 32, 142, 21);
		panel.add(textField);
		textField.setColumns(10);
		
		textField_2 = new JTextField();
		textField_2.setBounds(567, 32, 184, 21);
		panel.add(textField_2);
		textField_2.setColumns(10);
		
		textField_3 = new JTextField();
		textField_3.setColumns(10);
		textField_3.setBounds(567, 65, 184, 21);
		panel.add(textField_3);
		
		textField_4 = new JTextField();
		textField_4.setBounds(70, 97, 142, 20);
		panel.add(textField_4);
		textField_4.setColumns(10);
		
		textField_5 = new JTextField();
		textField_5.setBounds(325, 32, 162, 20);
		panel.add(textField_5);
		textField_5.setColumns(10);
		
		textField_6 = new JTextField();
		textField_6.setBounds(325, 65, 162, 20);
		panel.add(textField_6);
		textField_6.setColumns(10);
		
		JLabel lblNewLabel_1_4_3 = new JLabel("S\u1ED1 l\u00F4");
		lblNewLabel_1_4_3.setBounds(261, 101, 54, 22);
		panel.add(lblNewLabel_1_4_3);
		
		textField_7 = new JTextField();
		textField_7.setBounds(325, 102, 162, 20);
		panel.add(textField_7);
		textField_7.setColumns(10);
		
		JComboBox comboBox = new JComboBox();
		comboBox.setBounds(70, 64, 142, 22);
		panel.add(comboBox);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setToolTipText("");
		scrollPane.setBounds(32, 223, 792, 332);
		add(scrollPane);
		
		table = new JTable();
		table.setFont(new Font("Tahoma", Font.BOLD, 11));
		table.setModel(new DefaultTableModel(
			new Object[][] {
				{"STT", "T\u00EAn s\u1EA3n ph\u1EA9m", "DVT", "S\u1ED1 L\u01B0\u1EE3ng", "\u0110\u01A1n Gi\u00E1", "CK", "VAT", "Th\u00E0nh ti\u1EC1n", "H\u1EA1n s\u1EED d\u1EE5ng", "S\u1ED1 l\u00F4"},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
			},
			new String[] {
				"New column", "New column", "New column", "New column", "New column", "New column", "New column", "New column", "New column", "New column"
			}
		));
		table.getColumnModel().getColumn(0).setPreferredWidth(38);
		table.getColumnModel().getColumn(1).setPreferredWidth(100);
		table.getColumnModel().getColumn(5).setPreferredWidth(58);
		table.getColumnModel().getColumn(7).setPreferredWidth(97);
		table.getColumnModel().getColumn(8).setPreferredWidth(91);
		scrollPane.setColumnHeaderView(table);
		
		textField_8 = new JTextField();
		textField_8.setBounds(76, 574, 211, 20);
		add(textField_8);
		textField_8.setColumns(10);
		
		JLabel lblNewLabel_1_2_1 = new JLabel("Ghi ch\u00FA");
		lblNewLabel_1_2_1.setBounds(31, 573, 54, 22);
		add(lblNewLabel_1_2_1);
		
		JButton btnNewButton = new JButton("Th\u00EAm m\u1EDBi");
		btnNewButton.setBounds(317, 573, 89, 23);
		add(btnNewButton);
		
		JButton btnInPhiu = new JButton(" In phi\u1EBFu");
		btnInPhiu.setBounds(416, 573, 89, 23);
		add(btnInPhiu);
		
		JButton btnXa = new JButton("X\u00F3a");
		btnXa.setBounds(519, 573, 89, 23);
		add(btnXa);
		
		JButton btnSa = new JButton("S\u1EEDa");
		btnSa.setBounds(617, 573, 89, 23);
		add(btnSa);
		
		JButton btnThot = new JButton("Tho\u00E1t");
		btnThot.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnThot.setBounds(716, 573, 89, 23);
		add(btnThot);

	}
}
