package pace.gio.lez04_task.dao;

import java.util.ArrayList;

import com.mysql.cj.jdbc.MysqlDataSource;

import pace.gio.lez04_task.models.Studente;

public class StudenteDAO implements IDao<Studente> {

	@Override
	public ArrayList<Studente> getAll() {
		ArrayList<Studente> risultato = new ArrayList<Studente>();
		
		
		MysqlDataSource ds = new MysqlDataSource();
		ds.setServerName(DbConfig.server);
		ds.setPort(DbConfig.porta);
		ds.setUser(DbConfig.username);
		ds.setPassword(DbConfig.password);
		ds.setDatabaseName(DbConfig.database);
				
		return risultato;
	}

	@Override
	public Studente getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(Studente t) {
		// TODO Auto-generated method stub
		return false;
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
