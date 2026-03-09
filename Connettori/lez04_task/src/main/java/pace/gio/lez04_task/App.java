package pace.gio.lez04_task;

import java.util.Scanner;

import pace.gio.lez04_task.dao.StudenteDAO;
import pace.gio.lez04_task.models.Studente;

/**
 * Creazione di un sistema di gestione oggetti, ogni oggetto è caratterizzato da
 * Nome, Codice, Prezzo, Quantità
 * 
 * Ecco le specifiche
 * - Inserimento
 * - Trova tutti gli oggetti
 * - Trova un oggetto per codice
 * - ELimina un oggetto per codice
 * - HARD: Conta il totale del valore degli oggetti presenti nel negozio (prezzo per quantità di ogni oggetto).
 */
public class App 
{
    public static void main( String[] args )
    {
    	Scanner scanner = new Scanner(System.in); 
    	boolean inEsecuzione = true;
    	
		StudenteDAO dao = new StudenteDAO();
    	
    	while(inEsecuzione) {
    		System.out.println("Effettua una scelta\n"
    				+ "I - Inserimento\n"
    				+ "S - Stampa\n"
    				+ "Q - Uscita");
    		String input = scanner.nextLine();
    		
    		switch (input) {
			case "I":
				System.out.println("Inserisci il nome");
				String nome = scanner.nextLine();
				System.out.println("Inserisci il cognome");
				String cognome = scanner.nextLine();
				System.out.println("Inserisci il email");
				String email = scanner.nextLine();
				System.out.println("Inserisci il matricola");
				String matricola = scanner.nextLine();
				
				Studente stu = new Studente(nome, cognome, email, matricola);

				if(dao.insert(stu)) {
					System.out.println("STAPPOOOOO");
				}
				else {
					System.out.println("Errore di inserimento");
				}
				
				break;
			case "S":
				System.out.println(dao.getAll()); 
				break;
			case "Q":
				inEsecuzione = false;
				break;
			default:
				System.out.println("Comando non riconosciuto");
				break;
			}
    	}
    	
    	
    }
}
