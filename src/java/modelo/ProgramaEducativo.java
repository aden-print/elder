package modelo;
public class ProgramaEducativo {
    private int idProgEduc;
    private String tipo;
    private double inscripcion;
    private double matricula;
    private double gastosAdministrativos;
    private double pension;

    public int getIdProgEduc() {
        return idProgEduc;
    }

    public void setIdProgEduc(int idProgEduc) {
        this.idProgEduc = idProgEduc;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getInscripcion() {
        return inscripcion;
    }

    public void setInscripcion(double inscripcion) {
        this.inscripcion = inscripcion;
    }

    public double getMatricula() {
        return matricula;
    }

    public void setMatricula(double matricula) {
        this.matricula = matricula;
    }

    public double getGastosAdministrativos() {
        return gastosAdministrativos;
    }

    public void setGastosAdministrativos(double gastosAdministrativos) {
        this.gastosAdministrativos = gastosAdministrativos;
    }

    public double getPension() {
        return pension;
    }

    public void setPension(double pension) {
        this.pension = pension;
    }
    
    
}
