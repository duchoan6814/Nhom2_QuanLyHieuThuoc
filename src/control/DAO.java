package control;

import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Connection;

/**
 * @author hoant
 *
 */
public class DAO {
	protected Connection conn;
	private String url = "jdbc:sqlserver://localhost:1433;databasename=QuanLiThuoc";
	private String userName = "duchoan6814";
	private String password = "sapassword";
	
	public DAO() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			try {
				conn = (Connection) DriverManager.getConnection(url, userName, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("ket noi that bai 2");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ket noi that bai!");
		}
		
	}
}
