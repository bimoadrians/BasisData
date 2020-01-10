package Hospital;

import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JLabel;
import java.awt.BorderLayout;
import javax.swing.JTextField;
import javax.swing.JPasswordField;
import javax.swing.JPanel;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import javax.swing.ImageIcon;
import java.awt.Color;

public class Login {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Login window = new Login();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Login() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 655, 454);
		frame.setVisible(true);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		frame.setResizable(false);
		frame.setTitle("Hospital Management System");
		
		JPanel panel = new JPanel();
		panel.setBackground(new Color(255, 255, 255));
		panel.setBounds(12, 50, 625, 227);
		frame.getContentPane().add(panel);
		
		JButton btnDokter = new JButton("DOKTER");
		btnDokter.setBounds(49, 113, 117, 25);
		btnDokter.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Dokter dokter = new Dokter();
				frame.setVisible(false);
			}
		});
		panel.setLayout(null);
		
		JLabel lblHospital = new JLabel("Hospital Database Management System");
		lblHospital.setFont(new Font("Franklin Gothic Demi", Font.ITALIC, 29));
		lblHospital.setBounds(34, 13, 525, 46);
		lblHospital.setOpaque(false);
		panel.add(lblHospital);
		panel.add(btnDokter);
		
		JButton btnPasien = new JButton("PASIEN");
		btnPasien.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Pasien pasien = new Pasien();
				frame.setVisible(false);
			}
		});
		btnPasien.setBounds(170, 113, 114, 25);
		panel.add(btnPasien);
		
		JButton btnKamar = new JButton("KAMAR");
		btnKamar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Kamar kamar = new Kamar();
				frame.setVisible(false);
			}
		});
		btnKamar.setBounds(288, 113, 114, 25);
		panel.add(btnKamar);
		
		JButton btnAdmin = new JButton("ADMINISTRASI");
		btnAdmin.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Administrasi Pembayaran = new Administrasi();
				frame.setVisible(false);
			}
		});
		btnAdmin.setBounds(405, 113, 128, 25);
		panel.add(btnAdmin);
		
		JLabel lblNewLabel = new JLabel("");
		lblNewLabel.setIcon(new ImageIcon("img\\background.jpg"));
		lblNewLabel.setBounds(0, -18, 671, 463);
		frame.getContentPane().add(lblNewLabel);
	}
}
