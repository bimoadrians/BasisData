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
import javax.swing.JPanel;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.Color;
import javax.swing.ImageIcon;

public class Dokter {

	private JFrame frame;
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTextField textField_4;
	private JTextField textField_5;
	private JTable table;

	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Dokter window = new Dokter();
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
	public Dokter() {
		initialize();
		tampilTabel();
		
	}
	
	
	public void tampilTabel(){
	DefaultTableModel model = new DefaultTableModel();
    model.addColumn("ID");
    model.addColumn("Nama");
    model.addColumn("Spesialisasi");
    model.addColumn("Jenis Kelamin");
    model.addColumn("Alamat");
    model.addColumn("No.Telefon");
    try {
        String sql = "select * from dokter";
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/rumah_sakit","root","");
        java.sql.Statement stm=con.createStatement();
        java.sql.ResultSet res=stm.executeQuery(sql);
        while(res.next()){
            model.addRow(new Object[]{res.getString(1),res.getString(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6)});
        }
        table.setModel(model);
    	} catch (Exception e) {
    		e.printStackTrace();
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
		
		JLabel lblNewLabel = new JLabel("Dokter");
		lblNewLabel.setFont(new Font("Franklin Gothic Medium Cond", Font.BOLD | Font.ITALIC, 20));
		lblNewLabel.setBounds(358, 13, 68, 25);
		frame.getContentPane().add(lblNewLabel);
		
		JLabel lblId = new JLabel("ID Dokter :");
		lblId.setBounds(22, 51, 84, 16);
		frame.getContentPane().add(lblId);
		
		JLabel lblNama = new JLabel("NAMA :");
		lblNama.setBounds(290, 54, 56, 16);
		frame.getContentPane().add(lblNama);
		
		JLabel lblAlamat = new JLabel("SPESIALISASI :");
		lblAlamat.setBounds(22, 83, 100, 16);
		frame.getContentPane().add(lblAlamat);
		
		JLabel lblJenisKelamin = new JLabel("JENIS KELAMIN :");
		lblJenisKelamin.setBounds(290, 83, 100, 16);
		frame.getContentPane().add(lblJenisKelamin);
		
		JLabel lblGaji = new JLabel("AlAMAT :");
		lblGaji.setBounds(22, 115, 56, 16);
		frame.getContentPane().add(lblGaji);
		
		JLabel lblTelfon = new JLabel("TELFON :");
		lblTelfon.setBounds(22, 146, 56, 16);
		frame.getContentPane().add(lblTelfon);
		
		textField = new JTextField();
		textField.setBounds(162, 48, 116, 22);
		frame.getContentPane().add(textField);
		textField.setColumns(10);
		
		textField_1 = new JTextField();
		textField_1.setBounds(430, 51, 116, 22);
		frame.getContentPane().add(textField_1);
		textField_1.setColumns(10);
		
		textField_2 = new JTextField();
		textField_2.setBounds(162, 80, 116, 22);
		frame.getContentPane().add(textField_2);
		textField_2.setColumns(10);
		
		textField_3 = new JTextField();
		textField_3.setBounds(430, 80, 116, 22);
		frame.getContentPane().add(textField_3);
		textField_3.setColumns(10);
		
		textField_4 = new JTextField();
		textField_4.setBounds(162, 112, 116, 22);
		frame.getContentPane().add(textField_4);
		textField_4.setColumns(10);
		
		textField_5 = new JTextField();
		textField_5.setBounds(162, 143, 116, 22);
		frame.getContentPane().add(textField_5);
		textField_5.setColumns(10);
		
		JButton btnSimpan = new JButton("SIMPAN");
		btnSimpan.addActionListener(new ActionListener() 
		{
			
			@Override
			public void actionPerformed(ActionEvent act){
				// TODO Auto-generated method stub
				Object obj = act.getSource();
				if(obj == btnSimpan){
					try{
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rumah_sakit","root","");
						String sql = "insert into dokter values(?,?,?,?,?,?)";
						PreparedStatement prepare = con.prepareStatement(sql);
						
						prepare.setString(1, textField.getText());
						prepare.setString(2, textField_1.getText());
						prepare.setString(3, textField_2.getText());
						prepare.setString(4, textField_3.getText());
						prepare.setString(5, textField_4.getText());
						prepare.setString(6, textField_5.getText());
						prepare.executeUpdate();
						JOptionPane.showMessageDialog(null,"Data berhasil ditambahkan ke dalam database","Pesan",JOptionPane.INFORMATION_MESSAGE);
						tampilTabel();
						prepare.close();
					}catch(Exception ex){ 
						ex.printStackTrace();
						JOptionPane.showMessageDialog(null,"Data gagal ditambhakan ke dalam database","Pesan",JOptionPane.ERROR_MESSAGE);
					}
					
				}
			}
				
			});
		btnSimpan.setBounds(32, 415, 202, 25);
		frame.getContentPane().add(btnSimpan);
		
		JButton btnhapus = new JButton("HAPUS");
		btnhapus.addActionListener(new ActionListener(){
			
			@Override
			public void actionPerformed(ActionEvent act){
				// TODO Auto-generated method stub
				Object obj = act.getSource();
				if(obj == btnhapus){
					try{
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con=DriverManager.getConnection(  
								"jdbc:mysql://localhost:3306/rumah_sakit","root","");
						String sql = "delete from dokter where id_dokter = ?";
						PreparedStatement prepare = con.prepareStatement(sql);
						
						prepare.setString(1, textField.getText());
						prepare.executeUpdate();
						JOptionPane.showMessageDialog(null,"Data berhasil dihapus dari database","Pesan",JOptionPane.INFORMATION_MESSAGE);
						tampilTabel();
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
				btnUpdate.addActionListener(new ActionListener() {
					@Override
					public void actionPerformed(ActionEvent act){
						// TODO Auto-generated method stub
						Object obj = act.getSource();
						if(obj == btnUpdate){
							try{
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rumah_sakit","root","");
								String sql = "UPDATE dokter SET nama_dokter = '"+textField_1.getText()+"', nama_spesialisasi = '"+textField_2.getText()+"', gender = '"+textField_3.getText()+"', alamat = '"+textField_4.getText()+"', no_telp_dokter = '"+textField_5.getText()+"' WHERE  id_dokter = '"+textField.getText()+"'";
								PreparedStatement prepare = con.prepareStatement(sql);
								prepare.executeUpdate();
								JOptionPane.showMessageDialog(null,"Data berhasil diupdate","Pesan",JOptionPane.INFORMATION_MESSAGE);
								tampilTabel();
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
			public void actionPerformed(ActionEvent arg0) {
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
			public void mouseClicked(java.awt.event.MouseEvent evt) {
				int baris = table.rowAtPoint(evt.getPoint());
				String ID =table.getValueAt(baris, 0).toString();
		        textField.setText(ID);
		        String Nama =table.getValueAt(baris, 1).toString();
		        textField_1.setText(Nama);
		        String Spesialisasi = table.getValueAt(baris,2).toString();
		        textField_2.setText(Spesialisasi);
		        String Jk = table.getValueAt(baris,3).toString();
		        textField_3.setText(Jk);
		        String Alamat = table.getValueAt(baris,4).toString();
		        textField_4.setText(Alamat);
		        String telp = table.getValueAt(baris, 5).toString();
		        textField_5.setText(telp);
			}
		});
		scrollPane.setViewportView(table);
		
		JLabel lblNewLabel_1 = new JLabel("");
		lblNewLabel_1.setIcon(new ImageIcon("img\\Background2.jpg"));
		lblNewLabel_1.setBounds(0, 0, 782, 453);
		frame.getContentPane().add(lblNewLabel_1);
		
		
		
		
		
		
		
		
	}
}
