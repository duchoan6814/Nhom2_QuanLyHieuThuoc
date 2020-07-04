package boundary;

import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JScrollPane;
import javax.swing.JList;
import javax.swing.AbstractListModel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JButton;
import javax.swing.JTextField;

public class pnlQuanLyKhachHang extends JPanel {
	private JTable table;
	private JTextField txtTmKim;

	/**
	 * Create the panel.
	 */
	public pnlQuanLyKhachHang() {
		setForeground(Color.PINK);
		setLayout(null);
		
		table = new JTable();
		table.setBounds(0, 131, 850, 464);
		table.setModel(new DefaultTableModel(
			new Object[][] {
				{"STT", "               T\u00EAn Kh\u00E1ch H\u00E0ng", "   Lo\u1EA1i Th\u00E0nh Vi\u00EAn", "       Ng\u00E0y", "    T\u1ED5ng Ti\u1EC1n", "    Ghi Ch\u00FA"},
				{"", "D\u01B0\u01A1ng Anh T\u00FA", "Vip", "02/06/2020", "200000", ""},
				{"", "Tr\u01B0\u01A1ng \u0110\u1EE9c Ho\u00E0n", "Member", "05/06/2020", "2000000", ""},
				{"", "Nguy\u1EC5n Th\u1ECB Qu\u1EF3nh Mai", "Member", "07/06/2020", "2101100", ""},
				{"", "Ph\u1EA1m Xu\u00E2n V\u0169 ", "Vip", "20/06/2020", "1345660", ""},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
			},
			new String[] {
				"STT", "T\u00EAn Kh\u00E1ch H\u00E0ng", "  Lo\u1EA1i Th\u00E0nh Vi\u00EAn", "   Ng\u00E0y", "T\u1ED5ng Ti\u1EC1n", "Ghi Ch\u00FA"
			}
		));
		table.getColumnModel().getColumn(0).setPreferredWidth(53);
		table.getColumnModel().getColumn(1).setPreferredWidth(186);
		table.getColumnModel().getColumn(1).setMinWidth(30);
		table.getColumnModel().getColumn(2).setPreferredWidth(96);
		table.getColumnModel().getColumn(3).setPreferredWidth(98);
		table.getColumnModel().getColumn(4).setPreferredWidth(96);
		add(table);
		
		JButton btnNewButton = new JButton("Th\u00EAm Kh\u00E1ch H\u00E0ng");
		btnNewButton.setBackground(Color.BLUE);
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 13));
		btnNewButton.setBounds(241, 59, 164, 38);
		add(btnNewButton);
		
		txtTmKim = new JTextField();
		txtTmKim.setText("T\u00ECm ki\u1EBFm");
		txtTmKim.setBounds(614, 66, 164, 27);
		add(txtTmKim);
		txtTmKim.setColumns(10);
		
		JButton btnNewButton_1 = new JButton("t\u00ECm");
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD, 11));
		btnNewButton_1.setBounds(788, 69, 62, 21);
		add(btnNewButton_1);
		
		JButton btnNewButton_2 = new JButton("X\u00F3a Kh\u00E1ch H\u00E0ng");
		btnNewButton_2.setBackground(Color.BLUE);
		btnNewButton_2.setFont(new Font("Tahoma", Font.BOLD, 13));
		btnNewButton_2.setBounds(43, 59, 172, 38);
		add(btnNewButton_2);
		
		JLabel lblNewLabel = new JLabel("H\u1ED3 S\u01A1 Kh\u00E1ch H\u00E0ng");
		lblNewLabel.setBackground(Color.LIGHT_GRAY);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 20));
		lblNewLabel.setBounds(298, 10, 204, 27);
		add(lblNewLabel);
		
		JButton btnNewButton_3 = new JButton("S\u1EEDa");
		btnNewButton_3.setBackground(Color.BLUE);
		btnNewButton_3.setFont(new Font("Tahoma", Font.BOLD, 13));
		btnNewButton_3.setBounds(431, 60, 142, 38);
		add(btnNewButton_3);

	}
}
