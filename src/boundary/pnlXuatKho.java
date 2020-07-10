package boundary;

import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.border.TitledBorder;
import javax.swing.JTextField;
import javax.swing.JScrollPane;
import javax.swing.ScrollPaneConstants;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.JButton;

public class pnlXuatKho extends JPanel {
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTextField textField_4;
	private JTextField textField_5;
	private JTextField textField_6;
	private JTextField textField_7;
	private JTextField textField_8;
	private JTable table;
	private JTextField textField_9;

	/**
	 * Create the panel.
	 */
	public pnlXuatKho() {
		setBackground(Color.PINK);
		setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Xu\u1EA5t Kho");
		lblNewLabel.setFont(new Font("Times New Roman", Font.BOLD, 30));
		lblNewLabel.setBounds(374, 11, 132, 36);
		add(lblNewLabel);
		
		JPanel panel = new JPanel();
		panel.setBorder(new TitledBorder(null, "Th\u00F4ng tin phi\u1EBFu", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		panel.setBackground(new Color(135, 206, 250));
		panel.setBounds(0, 68, 860, 115);
		add(panel);
		panel.setLayout(null);
		
		JLabel lblMThuc = new JLabel("M\u00E3 Thu\u1ED1c:");
		lblMThuc.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblMThuc.setBounds(10, 26, 73, 14);
		panel.add(lblMThuc);
		
		textField = new JTextField();
		textField.setBounds(84, 24, 165, 20);
		panel.add(textField);
		textField.setColumns(10);
		
		JLabel lblMT = new JLabel("M\u00F4 T\u1EA3:");
		lblMT.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblMT.setBounds(10, 53, 46, 14);
		panel.add(lblMT);
		
		textField_1 = new JTextField();
		textField_1.setBounds(84, 51, 165, 20);
		panel.add(textField_1);
		textField_1.setColumns(10);
		
		JLabel lblGiThuc = new JLabel("Gi\u00E1 Thu\u1ED1c:");
		lblGiThuc.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblGiThuc.setBounds(10, 78, 64, 14);
		panel.add(lblGiThuc);
		
		textField_2 = new JTextField();
		textField_2.setBounds(84, 76, 165, 20);
		panel.add(textField_2);
		textField_2.setColumns(10);
		
		JLabel lblNewLabel_1 = new JLabel("T\u00EAn Thu\u1ED1c:");
		lblNewLabel_1.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblNewLabel_1.setBounds(276, 27, 73, 14);
		panel.add(lblNewLabel_1);
		
		textField_3 = new JTextField();
		textField_3.setBounds(349, 24, 165, 20);
		panel.add(textField_3);
		textField_3.setColumns(10);
		
		JLabel lblNewLabel_2 = new JLabel("Ng\u00E0y SX:");
		lblNewLabel_2.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblNewLabel_2.setBounds(276, 53, 73, 20);
		panel.add(lblNewLabel_2);
		
		textField_4 = new JTextField();
		textField_4.setBounds(349, 51, 165, 20);
		panel.add(textField_4);
		textField_4.setColumns(10);
		
		JLabel lblNewLabel_3 = new JLabel("H\u1EA1n SD:");
		lblNewLabel_3.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblNewLabel_3.setBounds(276, 79, 73, 14);
		panel.add(lblNewLabel_3);
		
		textField_5 = new JTextField();
		textField_5.setBounds(349, 76, 165, 20);
		panel.add(textField_5);
		textField_5.setColumns(10);
		
		JLabel lblNewLabel_4 = new JLabel("\u0110\u01A1n V\u1ECB T\u00EDnh:");
		lblNewLabel_4.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblNewLabel_4.setBounds(547, 26, 77, 14);
		panel.add(lblNewLabel_4);
		
		textField_6 = new JTextField();
		textField_6.setBounds(634, 24, 165, 20);
		panel.add(textField_6);
		textField_6.setColumns(10);
		
		JLabel lblMNcc = new JLabel("M\u00E3 NCC:");
		lblMNcc.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblMNcc.setBounds(547, 54, 77, 14);
		panel.add(lblMNcc);
		
		textField_7 = new JTextField();
		textField_7.setBounds(634, 51, 165, 20);
		panel.add(textField_7);
		textField_7.setColumns(10);
		
		JLabel lblMLoi = new JLabel("M\u00E3 Lo\u1EA1i:");
		lblMLoi.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblMLoi.setBounds(547, 79, 77, 14);
		panel.add(lblMLoi);
		
		textField_8 = new JTextField();
		textField_8.setBounds(633, 76, 166, 20);
		panel.add(textField_8);
		textField_8.setColumns(10);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(0, 194, 860, 375);
		add(scrollPane);
		
		table = new JTable();
		table.setModel(new DefaultTableModel(
			new Object[][] {
				{"STT", "Ma Thuoc", "Mo Ta", "Gia Thuoc", "Ten Thuoc", "Ngay SX", "HSD", "Don Vi Tinh", "Ma NCC", "Ma Loai"},
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
				{null, null, null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null, null, null},
			},
			new String[] {
				"New column", "New column", "New column", "New column", "New column", "New column", "New column", "New column", "New column", "New column"
			}
		));
		table.getColumnModel().getColumn(0).setResizable(false);
		table.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		scrollPane.setColumnHeaderView(table);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBackground(Color.PINK);
		panel_1.setBounds(0, 571, 860, 34);
		add(panel_1);
		panel_1.setLayout(null);
		
		JLabel lblGhiCh = new JLabel("Ghi Ch\u00FA:");
		lblGhiCh.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		lblGhiCh.setBounds(10, 11, 57, 14);
		panel_1.add(lblGhiCh);
		
		textField_9 = new JTextField();
		textField_9.setBounds(64, 8, 164, 20);
		panel_1.add(textField_9);
		textField_9.setColumns(10);
		
		JButton btnThm = new JButton("Th\u00EAm");
		btnThm.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		btnThm.setBounds(250, 8, 89, 23);
		panel_1.add(btnThm);
		
		JButton btnXa = new JButton("X\u00F3a");
		btnXa.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		btnXa.setBounds(376, 7, 89, 23);
		panel_1.add(btnXa);
		
		JButton btnSa = new JButton("S\u1EEDa");
		btnSa.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		btnSa.setBounds(499, 8, 89, 23);
		panel_1.add(btnSa);
		
		JButton btnXutPhiu = new JButton("Xu\u1EA5t Phi\u1EBFu");
		btnXutPhiu.setFont(new Font("Times New Roman", Font.PLAIN, 15));
		btnXutPhiu.setBounds(619, 8, 111, 23);
		panel_1.add(btnXutPhiu);

	}
}
