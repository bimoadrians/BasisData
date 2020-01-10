package Hospital;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.awt.event.ActionEvent;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import java.awt.Color;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.ImageIcon;

public class Administrasi {

	private JFrame frame;
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTable table;
	private JTextField textField_4;
	private JTextField textField_5;
	private JTextField textField_6;

	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Administrasi window = new Administrasi();
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
	public Administrasi() {
		initialize();
		loadTabel();
	}
	
	public void loadTabel(){
	DefaultTableModel model = new DefaultTableModel();
    model.addColumn("ID Adminitrasi");
    model.addColumn("Tanggal Adminstrasi");
    model.addColumn("ID Dokter");
    model.addColumn("ID Kamar");
    model.addColumn("ID Resep");
    model.addColumn("ID Pemeriksaan");
    model.addColumn("ID Pasien");

    
    //menampilkan data database kedalam tabel
    try {
        String sql = "select * from administrasi";
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/rumah_sakit","root","");
        java.sql.Statement stm=con.createStatement();
        java.sql.ResultSet res=stm.executeQuery(sql);
        while(res.next()){
            model.addRow(new Object[]{res.getString(1),res.getString(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),res.getString(7)});
        }
      table.setModel(model);
    } catch (Exception e) {
    }
	}
	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setResizable(false);
		frame.setVisible(true);
		frame.setBounds(100, 100, 800, 500);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		frame.setTitle("Hospital Management System");
		
		JLabel lblNewLabel = new JLabel("Administrasi");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 20));
		lblNewLabel.setBounds(12, 13, 110, 25);
		frame.getContentPane().add(lblNewLabel);
		
		JLabel lblId = new JLabel("ID Administrasi :");
		lblId.setBounds(32, 51, 104, 16);
		frame.getContentPane().add(lblId);
		
		JLabel lblNama = new JLabel("Tanggal Administrasi :");
		lblNama.setBounds(32, 170, 141, 16);
		frame.getContentPane().add(lblNama);
		
		JLabel lblAlamat = new JLabel("ID Dokter  :");
		lblAlamat.setBounds(294, 51, 90, 16);
		frame.getContentPane().add(lblAlamat);
		
		JLabel lblTelfon = new JLabel("ID Kamar :");
		lblTelfon.setBounds(294, 112, 97, 16);
		frame.getContentPane().add(lblTelfon);
		
		JLabel lblJenisKelamin = new JLabel("ID Pemeriksaan :");
		lblJenisKelamin.setBounds(294, 80, 110, 16);
		frame.getContentPane().add(lblJenisKelamin);
		
		JLabel lblIdIcu = new JLabel("ID Pasien:");
		lblIdIcu.setBounds(32, 80, 74, 16);
		frame.getContentPane().add(lblIdIcu);
		
		JLabel lblId_1 = new JLabel("ID Resep  :");
		lblId_1.setBounds(32, 109, 90, 16);
		frame.getContentPane().add(lblId_1);
		
		textField = new JTextField();
		textField.setBounds(162, 48, 116, 22);
		frame.getContentPane().add(textField);
		textField.setColumns(10);
		
		textField_1 = new JTextField();
		textField_1.setBounds(162, 167, 388, 22);
		frame.getContentPane().add(textField_1);
		textField_1.setColumns(10);
		
		textField_2 = new JTextField();
		textField_2.setBounds(434, 48, 116, 22);
		frame.getContentPane().add(textField_2);
		textField_2.setColumns(10);
		
		textField_3 = new JTextField();
		textField_3.setBounds(434, 109, 116, 22);
		frame.getContentPane().add(textField_3);
		textField_3.setColumns(10);
		
		textField_4 = new JTextField();
		textField_4.setBounds(162, 109,116, 22);
		frame.getContentPane().add(textField_4);
		textField_4.setColumns(10);
		
		textField_5 = new JTextField();
		textField_5.setBounds(434, 77, 116, 22);
		frame.getContentPane().add(textField_5);
		textField_5.setColumns(10);
		
		textField_6 = new JTextField();
		textField_6.setBounds(162, 77,116, 22);
		frame.getContentPane().add(textField_6);
		textField_6.setColumns(10);
		
		JButton btnSimpan = new JButton("SIMPAN");
		btnSimpan.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent act){
				// TODO Auto-generated method stub
				Object obj = act.getSource();
				if(obj == btnSimpan){
					try{
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost/rumah_sakit","root","");
						String sql = "insert into administrasi values(?,?,?,?,?,?,?)";
						PreparedStatement prepare = con.prepareStatement(sql);
						
						prepare.setString(1, textField.getText());
						prepare.setString(2, textField_1.getText());
						prepare.setString(3, textField_2.getText());
						prepare.setString(4, textField_3.getText());
						prepare.setString(5, textField_4.getText());
						prepare.setString(6, textField_5.getText());
						prepare.setString(7, textField_6.getText());
						
						prepare.executeUpdate();
						JOptionPane.showMessageDialog(null,"Data berhasil ditambahkan ke dalam database","Pesan",JOptionPane.INFORMATION_MESSAGE);
						loadTabel();
						prepare.close();
					}catch(Exception ex){
						ex.printStackTrace();
						JOptionPane.showMessageDialog(null,"Data gagal ditambahkan ke dalam database","Pesan",JOptionPane.ERROR_MESSAGE);
					}
					
				}
			}
				
			});
		

		btnSimpan.setBounds(32, 415, 202, 25);
		frame.getContentPane().add(btnSimpan);
		
		JButton btnhapus = new JButton("HAPUS");
		btnhapus.addActionListener(new ActionListener() {
					@Override
					public void actionPerformed(ActionEvent act){
						// TODO Auto-generated method stub
						Object obj = act.getSource();
						if(obj == btnhapus){
							try{
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con=DriverManager.getConnection(  
										"jdbc:mysql://localhost:3306/rumah_sakit","root","");
								String sql = "delete from administrasi where id_administrasi = ?";
								PreparedStatement prepare = con.prepareStatement(sql);
								
								prepare.setString(1, textField.getText());
								prepare.executeUpdate();
								JOptionPane.showMessageDialog(null,"Data berhasil dihapus dari database","Pesan",JOptionPane.INFORMATION_MESSAGE);
								loadTabel();
								prepare.close();
							}catch(Exception ex){
								JOptionPane.showMessageDialog(null,"Data gagal dihapus dari database","Pesan",JOptionPane.ERROR_MESSAGE);
							}
							
						}
					}
						
					});
				btnhapus.setBounds(246, 415, 202, 25);
		frame.getContentPane().add(btnhapus);
		
		JButton btnUpdate = new JButton("UPDATE");
		btnUpdate.addActionListener(new ActionListener(){
			@Override
			public void actionPerformed(ActionEvent act){
				// TODO Auto-generated method stub
				Object obj = act.getSource();
				if(obj == btnUpdate){
					try{
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rumah_sakit","root","");
						String sql = "UPDATE administrasi SET tanggal_adminstrasi = '"+textField_1.getText()+"', id_dokter = '"+textField_2.getText()+"', id_kamar = '"+textField_3.getText()+
								"', id_resep = '"+textField_4.getText()+"', id_pemeriksaan = '"+textField_5.getText()+"', id_pasien = '"+textField_6.getText()+
								"' WHERE  id_administrasi = '"+textField.getText()+"'";
						PreparedStatement prepare = con.prepareStatement(sql);
						prepare.executeUpdate();
						JOptionPane.showMessageDialog(null,"Data berhasil diupdate","Pesan",JOptionPane.INFORMATION_MESSAGE);
						loadTabel();
						prepare.close();
					}catch(Exception ex){
						JOptionPane.showMessageDialog(null,"Data gagal diupdate","Pesan",JOptionPane.ERROR_MESSAGE);
					}
					
				}
				
			}
		});
		btnUpdate.setBounds(459, 415, 202, 25);
		frame.getContentPane().add(btnUpdate);
		
		JButton btnKembali = new JButton("KEMBALI");
		btnKembali.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Login login = new Login();
				frame.setVisible(false);
			}
		});
		btnKembali.setBounds(673, 415, 97, 25);
		frame.getContentPane().add(btnKembali);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(12, 213, 758, 189);
		frame.getContentPane().add(scrollPane);
		
		table = new JTable();
		table.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent evt) {
				int baris = table.rowAtPoint(evt.getPoint());
				String ID =table.getValueAt(baris, 0).toString();
		        textField.setText(ID);
		        String TA =table.getValueAt(baris, 1).toString();
		        textField_1.setText(TA);
		        String IDD = table.getValueAt(baris,2).toString();
		        textField_2.setText(IDD);
		        String IDK = table.getValueAt(baris, 3).toString();
		        textField_3.setText(IDK);
		        String IDR = table.getValueAt(baris, 4).toString();
		        textField_4.setText(IDR);
		        String IDP = table.getValueAt(baris, 5).toString();
		        textField_5.setText(IDP);
		        String IdPa = table.getValueAt(baris, 6).toString();
		        textField_6.setText(IdPa);
			}
		});
		scrollPane.setViewportView(table);
		
		JLabel lblNewLabel_1 = new JLabel("");
		lblNewLabel_1.setIcon(new ImageIcon("img\\Background2.jpg"));
		lblNewLabel_1.setBounds(0, -11, 804, 478);
		frame.getContentPane().add(lblNewLabel_1);
		

	
	}
}

