package boundary;

import javax.swing.JPanel;
import javax.swing.JScrollBar;
import javax.swing.JTable;
import java.awt.Color;
import javax.swing.table.DefaultTableModel;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class pnlQuanLyHoaDon extends JPanel {
	private JTable table;
	private JTextField txtNhpSHa;

	/**
	 * Create the panel.
	 */
	public pnlQuanLyHoaDon() {
		setLayout(null);
		
		JScrollBar scrollBar = new JScrollBar();
		scrollBar.setBounds(843, 98, 17, 471);
		add(scrollBar);
		
		table = new JTable();
		table.setModel(new DefaultTableModel(
			new Object[][] {
				{"   S\u1ED1 H\u0110", " Nh\u00E2n Vi\u00EAn", "    Ng\u00E0y l\u1EADp H\u0110", "                Kh\u00E1ch H\u00E0ng", "    T\u1ED5ng Ti\u1EC1n"},
				{"0001", "MHD1", "01/06/2020", "Nguy\u1EC5n V\u0103n Ch\u1ED5i", "120000"},
				{"0002", "MHD2", "01/06/2020", "D\u01B0\u01A1ng Anh T\u00FA", "20000"},
				{"0003", "MHD3", "03/06/2020", "Tr\u01B0\u01A1ng \u0110\u1EE9c Ho\u00E0n", "300000"},
				{"0004", "MHD4", "03/06/2020", "Ph\u1EA1m Xu\u00E2n V\u0169", "10000"},
				{"0005", "MHD5", "04/06/2020", "Nguy\u1EC5n Th\u1ECB Qu\u1EF3nh Mai", "200000"},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
				{null, null, null, null, null},
			},
			new String[] {
				"New column", "New column", "New column", "New column", "New column"
			}
		));
		table.getColumnModel().getColumn(0).setResizable(false);
		table.getColumnModel().getColumn(0).setPreferredWidth(60);
		table.getColumnModel().getColumn(0).setMinWidth(27);
		table.getColumnModel().getColumn(0).setMaxWidth(65);
		table.getColumnModel().getColumn(1).setPreferredWidth(70);
		table.getColumnModel().getColumn(2).setPreferredWidth(89);
		table.getColumnModel().getColumn(3).setPreferredWidth(183);
		table.setBounds(10, 98, 850, 464);
		add(table);
		
		JLabel lblNewLabel = new JLabel("S\u1ED1 d\u00F2ng: 29");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel.setBounds(36, 572, 90, 23);
		add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("T\u00ECm ki\u1EBFm");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblNewLabel_1.setBounds(74, 66, 66, 23);
		add(lblNewLabel_1);
		
		txtNhpSHa = new JTextField();
		txtNhpSHa.setText("nh\u1EADp s\u1ED1 h\u00F3a \u0111\u01A1n");
		txtNhpSHa.setBounds(150, 69, 189, 19);
		add(txtNhpSHa);
		txtNhpSHa.setColumns(10);
		
		JLabel lblNewLabel_2 = new JLabel("Truy xu\u1EA5t H\u0110");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel_2.setBounds(24, 44, 116, 13);
		add(lblNewLabel_2);
		
		JComboBox comboBox = new JComboBox();
		comboBox.setModel(new DefaultComboBoxModel(new String[] {"Th\u00E1ng n\u00E0y"}));
		comboBox.setFont(new Font("Tahoma", Font.BOLD, 12));
		comboBox.setBounds(133, 42, 90, 21);
		add(comboBox);
		
		JLabel lblNewLabel_3 = new JLabel("T\u1EEB ng\u00E0y");
		lblNewLabel_3.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblNewLabel_3.setBounds(258, 46, 81, 13);
		add(lblNewLabel_3);
		
		JComboBox comboBox_1 = new JComboBox();
		comboBox_1.setModel(new DefaultComboBoxModel(new String[] {"01/06/2020"}));
		comboBox_1.setFont(new Font("Tahoma", Font.PLAIN, 12));
		comboBox_1.setForeground(new Color(0, 0, 0));
		comboBox_1.setBounds(327, 42, 106, 21);
		add(comboBox_1);
		
		JLabel lblNewLabel_4 = new JLabel("\u0110\u1EBFn ng\u00E0y");
		lblNewLabel_4.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblNewLabel_4.setBounds(468, 45, 66, 13);
		add(lblNewLabel_4);
		
		JComboBox comboBox_2 = new JComboBox();
		comboBox_2.setFont(new Font("Tahoma", Font.PLAIN, 12));
		comboBox_2.setModel(new DefaultComboBoxModel(new String[] {"30/06/2020"}));
		comboBox_2.setBounds(544, 42, 106, 21);
		add(comboBox_2);
		
		JButton btnNewButton = new JButton("\u0110i\u1EC1u ch\u1EC9nh");
		btnNewButton.setBackground(Color.ORANGE);
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnNewButton.setBounds(566, 67, 95, 21);
		add(btnNewButton);
		
		JButton btnNewButton_1 = new JButton("H\u1EE7y H\u0110");
		btnNewButton_1.setBackground(Color.ORANGE);
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnNewButton_1.setBounds(695, 67, 95, 21);
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
		btnNewButton_2.setBounds(348, 68, 60, 21);
		add(btnNewButton_2);
		
		JLabel lblNewLabel_8 = new JLabel("H\u1ED3 S\u01A1 H\u00F3a \u0110\u01A1n");
		lblNewLabel_8.setFont(new Font("Tahoma", Font.BOLD, 19));
		lblNewLabel_8.setBounds(352, 10, 196, 22);
		add(lblNewLabel_8);

	}
}
