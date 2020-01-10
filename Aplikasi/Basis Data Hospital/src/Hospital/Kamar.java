package Hospital;

import java.awt.EventQueue;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.ImageIcon;

public class Kamar {

	private JFrame frame;
	private JTextField textField;
	private JTextField textField_1;
	private JTable table;
	private JButton btnUpdate;
	private JButton btnKembali;
	private JLabel label;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Kamar window = new Kamar();
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
	public Kamar() {
		initialize();
		loadTabel();
	}

	public void loadTabel(){
	DefaultTableModel model = new DefaultTableModel();
    model.addColumn("No Kamar");
    model.addColumn("Nama Kelas");
  
    try {
        String sql = "select * from rawat_inap";
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/rumah_sakit","root","");
        java.sql.Statement stm=con.createStatement();
        java.sql.ResultSet res=stm.executeQuery(sql);
        while(res.next()){
            model.addRow(new Object[]{res.getString(1),res.getString(2)});
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
		frame.setVisible(true);
		frame.setBounds(100, 100, 670, 483);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		frame.setTitle("Hospital Management System");
		
		JLabel lblNoKamar = new JLabel("ID Kamar :");
		lblNoKamar.setBounds(28, 84, 80, 16);
		frame.getContentPane().add(lblNoKamar);
		
		JLabel lblKelas = new JLabel("Nama Kelas :");
		lblKelas.setBounds(259, 84, 94, 16);
		frame.getContentPane().add(lblKelas);
		
		textField = new JTextField();
		textField.setBounds(108, 81, 116, 22);
		frame.getContentPane().add(textField);
		textField.setColumns(10);
		
		textField_1 = new JTextField();
		textField_1.setBounds(365, 81, 116, 22);
		frame.getContentPane().add(textField_1);
		textField_1.setColumns(10);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(28, 156, 609, 234);
		frame.getContentPane().add(scrollPane);
		
		table = new JTable();
		table.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent evt) {
				int baris = table.rowAtPoint(evt.getPoint());
				String IDK  =table.getValueAt(baris, 0).toString();
		        textField.setText(IDK);
		        String Nama =table.getValueAt(baris, 1).toString();
		        textField_1.setText(Nama);

			}
		});
		scrollPane.setViewportView(table);
		JButton btnSimpan = new JButton("SIMPAN");
		btnSimpan.addActionListener(new ActionListener(){
			
			@Override
			public void actionPerformed(ActionEvent act){
				// TODO Auto-generated method stub
				Object obj = act.getSource();
				if(obj == btnSimpan){
					try{
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost/rumah_sakit","root","");
						String sql = "insert into rawat_inap values(?,?)";
						PreparedStatement prepare = con.prepareStatement(sql);
						
						prepare.setString(1, textField.getText());
						prepare.setString(2, textField_1.getText());
						
						prepare.executeUpdate();
						JOptionPane.showMessageDialog(null,"Data Telah Berhasil Ditambahkan Ke Dalam Database","Attention",JOptionPane.INFORMATION_MESSAGE);
						loadTabel();
						prepare.close();
					}catch(Exception ex){
						ex.printStackTrace();
						JOptionPane.showMessageDialog(null,"Data gagal ditambahkan ke dalam database","Pesan",JOptionPane.ERROR_MESSAGE);
					}
					
				}
			}
				
			});
		

		btnSimpan.setBounds(217, 403, 202, 25);
		frame.getContentPane().add(btnSimpan);
		btnUpdate = new JButton("Update");
				btnUpdate.addActionListener(new ActionListener() {
					
					@Override
					public void actionPerformed(ActionEvent act) {
						// TODO Auto-generated method stub
						Object obj = act.getSource();
						if(obj == btnUpdate){
							try{
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rumah_sakit","root","");
								String sql = "UPDATE rawat_inap SET nama_kelas = '"+textField_1.getText()+"'  WHERE id_kamar = '"+textField.getText()+"'";
								PreparedStatement prepare = con.prepareStatement(sql);
								prepare.executeUpdate();
								JOptionPane.showMessageDialog(null,"Data berhasil diupdate","Pesan",JOptionPane.INFORMATION_MESSAGE);
								loadTabel();
								prepare.close();
							}catch(SQLException | ClassNotFoundException es){
								JOptionPane.showMessageDialog(null,"Data gagal diupdate","Pesan",JOptionPane.ERROR_MESSAGE);
							}
							
						}
						
					}
				});
		btnUpdate.setBounds(425, 403, 116, 25);
		frame.getContentPane().add(btnUpdate);
		
		JButton btnhapus = new JButton("HAPUS");
		btnhapus.addActionListener(new ActionListener(){
			@Override
			public void actionPerformed(ActionEvent act){
				// TODO Auto-generated method stub
				Object obj = act.getSource();
				if(obj == btnhapus){
					try{
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rumah_sakit","root","");
						String sql = "delete from rawat_inap where id_kamar = ?";
						PreparedStatement prepare = con.prepareStatement(sql);
						
						prepare.setString(1, textField.getText());
						prepare.executeUpdate();
						JOptionPane.showMessageDialog(null,"Data Telah Berhasil Dihapus Dari Database","Attention",JOptionPane.INFORMATION_MESSAGE);
						loadTabel();
						prepare.close();
					}catch(Exception ex){
						JOptionPane.showMessageDialog(null,"Data Gagal Untuk Dihapus Dari Database","Attention",JOptionPane.ERROR_MESSAGE);
					}
					
				}
			}
				
			});
		btnhapus.setBounds(12, 403, 202, 25);
		frame.getContentPane().add(btnhapus);
		btnKembali = new JButton("Kembali");
		btnKembali.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Login login = new Login();
				frame.setVisible(false);
			}
		});
		btnKembali.setBounds(543, 403, 97, 25);
		frame.getContentPane().add(btnKembali);
		
		label = new JLabel("");
		label.setIcon(new ImageIcon("img\\Background2.jpg"));
		label.setBounds(0, 0, 663, 440);
		frame.getContentPane().add(label);
	}
}
