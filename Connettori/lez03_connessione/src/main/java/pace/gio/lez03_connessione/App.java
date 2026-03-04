package pace.gio.lez03_connessione;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.cj.jdbc.MysqlDataSource;

import pace.gio.lez03_connessione.models.Utente;

/*
 * Creare un sistema di inserimento e stampa Studenti (nome, cognome, email, matricola) che permetta, tramite uno SCANNER di scegliere tra:
 * I - Inserimento Studente
 * S - Stampa Studenti (elenco)
 */

public class App 
{
    public static void main( String[] args )
    {
    	// Esempio 1
    	
//    	int a = 5;
//    	int b;
//    	b = 4;
//    	
//    	int somma = a + b;
//    	
//    	System.out.println(somma);
    	
    	// Esempio 2
    	
//    	ArrayList<String> elenco = new ArrayList<String>();
//    	elenco.add("Lamborghini");
//    	elenco.add("Ferrari");
//    	elenco.add("Bentley");
//    	
//    	for(int i=0; i<elenco.size(); i++) {
//    		System.out.println(elenco.get(i));
//    	}
    	
    	
    	
    	
    	
    	
    	
    	
    	try {
    		MysqlDataSource ds = new MysqlDataSource();
        	ds.setServerName("127.0.0.1");
        	ds.setPort(3306);
        	ds.setUser("root");
        	ds.setPassword("toor");
        	ds.setDatabaseName("lez3_rubrica");
        	ds.setUseSSL(false);
        	ds.getAllowPublicKeyRetrieval();
        	
        	Connection con = ds.getConnection();
        	
        	Utente gio = new Utente("Valeria", "Verdi", "val@ver.com");
        	
        	//INserimento
        	String query = "INSERT INTO Utente(nome, cognome, email) VALUES (?, ?, ?)";
        	PreparedStatement ps = con.prepareStatement(query);
        	ps.setString(1, gio.getNome() );
        	ps.setString(2, gio.getCognome() );
        	ps.setString(3, gio.getEmail() );
        	
        	int affRows = ps.executeUpdate();
        	
        	if(affRows > 0)
        		System.out.println("STAPPOOOOOOO");
        	else
        		System.out.println("ERRORE DI INSERIMENTO");
        	
        	
        	
        	
        	//Lettura
//        	String query = "SELECT utenteID, nome, cognome, email FROM Utente";
//        	PreparedStatement ps = con.prepareStatement(query);
//        	
//        	ResultSet rs = ps.executeQuery();
//        	while(rs.next()) {
//        		Utente u = new Utente();
//        		u.setId( rs.getInt("utenteID") );
//        		u.setNome( rs.getString("nome") );
//        		u.setCognome( rs.getString("cognome") );
//        		u.setEmail( rs.getString("email") );
//        		
//        		System.out.println(u.toString());
//        	}
        	
        	con.close();
        	
        	
    	} catch (Exception e) {
			System.out.println(e.getMessage());
		}

    	System.out.println("Programma terminato");
    }
}
