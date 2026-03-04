package pace.gio.lez01_introduzione;

import java.util.ArrayList;

import pace.gio.lez01_introduzione.models.Docente;
import pace.gio.lez01_introduzione.models.Persona;
import pace.gio.lez01_introduzione.models.Studente;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
//    	Persona gio = new Persona("Gio", "Pace");
//    	System.out.println(gio);
    	
//    	Persona stu = new Studente("Val", "Ver", "AB12345");
//    	System.out.println(stu);
//    	
//    	Persona doc = new Docente("Mar", "Mariko", "Basi di dati");
//    	System.out.println(doc);
    	
    	Persona per = new Persona("Cio", "Pac");
    	Persona stu = new Studente("Val", "Ver", "AB12345");
    	Persona doc = new Docente("Mar", "Mariko", "Basi di dati");
    	
    	ArrayList<Persona> elenco = new ArrayList<Persona>();
    	
    	elenco.add(per);
    	elenco.add(stu);
    	elenco.add(doc);
    	
    	for(int i=0; i<elenco.size(); i++) {
    		
    		Persona p = elenco.get(i);
    		
    		if(p instanceof Studente) {
    			Studente s = (Studente) p;
    			s.stampaStud();
    		}
    		
    		if(p instanceof Docente) {
    			Docente d = (Docente) p;
    			d.stampaDoc();
    		}
    		
    	}
    }
}
