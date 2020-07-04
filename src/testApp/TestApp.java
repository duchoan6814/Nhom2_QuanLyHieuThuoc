package testApp;

import java.awt.EventQueue;

import boundary.TrangChu;

public class TestApp {
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					TrangChu frame = new TrangChu();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
}
