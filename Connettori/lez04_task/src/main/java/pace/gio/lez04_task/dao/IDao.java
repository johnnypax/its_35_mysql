package pace.gio.lez04_task.dao;

import java.util.ArrayList;

import pace.gio.lez04_task.models.Studente;

public interface IDao<T> {
	
	ArrayList<T> getAll();
	
	T getById(int id);
	
	boolean insert(T t);
	
	boolean delete(int id);
	
	boolean update(T t);
	

}
