package pace.gio.lez01_introduzione.models;

public class Studente extends Persona {

		private String matricola;
		
		public Studente(String nome, String cognome, String matricola) {
			super(nome, cognome);
			this.matricola = matricola;
		}

		public String getMatricola() {
			return matricola;
		}

		public void setMatricola(String matricola) {
			this.matricola = matricola;
		}

		@Override
		public String toString() {
			return "Studente [matricola=" + matricola + ", nome=" + nome + ", cognome=" + cognome + "]";
		}
		
		public void stampaStud() {
			System.out.println("matricola=" + matricola);
		}
		
		
	
}
