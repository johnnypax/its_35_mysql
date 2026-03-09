package pace.gio.lez04_task.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.MysqlDataSource;

import pace.gio.lez04_task.models.Studente;

public class StudenteDAO implements IDao<Studente> {

	
	@Override
	public ArrayList<Studente> getAll() {
		ArrayList<Studente> risultato = new ArrayList<Studente>();
		
		try {
			MysqlDataSource ds = new MysqlDataSource();
			ds.setServerName(DbConfig.SERVER);
			ds.setPort(DbConfig.PORTA);
			ds.setUser(DbConfig.USERNAME);
			ds.setPassword(DbConfig.PASSWORD);
			ds.setDatabaseName(DbConfig.DATABASE);
			ds.setUseSSL(false);
			ds.getAllowPublicKeyRetrieval();
			
			Connection con = ds.getConnection();
			
			String query = "SELECT studenteID, nome, cognome, email, matricola FROM Studente";
			PreparedStatement ps = con.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Studente stu = new Studente();
				stu.setId( rs.getInt("studenteID") );
				stu.setNome( rs.getString("nome") );
				stu.setCognome( rs.getString("cognome") );
				stu.setMatricola( rs.getString("matricola") );
				stu.setEmail( rs.getString("email") );
				
				risultato.add(stu);
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
				
		return risultato;
	}

	@Override
	public Studente getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(Studente t) {
		
		boolean risultato = false;
		
		try {
			MysqlDataSource ds = new MysqlDataSource();
			ds.setServerName(DbConfig.SERVER);
			ds.setPort(DbConfig.PORTA);
			ds.setUser(DbConfig.USERNAME);
			ds.setPassword(DbConfig.PASSWORD);
			ds.setDatabaseName(DbConfig.DATABASE);
			ds.setUseSSL(false);
			ds.getAllowPublicKeyRetrieval();
			
			Connection con = ds.getConnection();
			
			String query = "INSERT INTO Studente(nome, cognome, email, matricola) VALUES (?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, t.getNome());
			ps.setString(2, t.getCognome());
			ps.setString(3, t.getEmail());
			ps.setString(4, t.getMatricola());
			
			int affRows = ps.executeUpdate();
			if(affRows > 0)
				risultato = true;
			
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return risultato;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Studente t) {
		// TODO Auto-generated method stub
		return false;
	}


	
}
