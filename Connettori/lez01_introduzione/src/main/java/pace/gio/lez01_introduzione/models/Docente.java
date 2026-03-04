package pace.gio.lez01_introduzione.models;

public class Docente extends Persona{

	private String materia;
	
	public Docente(String nome, String cognome, String materia) {
		super(nome, cognome);
		this.materia = materia;
	}

	public String getMateria() {
		return materia;
	}

	public void setMateria(String materia) {
		this.materia = materia;
	}

	@Override
	public String toString() {
		return "Docente [materia=" + materia + ", nome=" + nome + ", cognome=" + cognome + "]";
	}
	
	public void stampaDoc() {
		System.out.println("materia=" + materia);
	}
	
	
}
