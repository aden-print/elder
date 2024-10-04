package modelo;
public class Matricula {
    private int idMatricula;
    private int idProgEduc;
    private int idAlumno;
    private String grado;
    private String turno;

    //Getters and setters
    
    public int getIdMatricula() {
        return idMatricula;
    }

    public void setIdMatricula(int idMatricula) {
        this.idMatricula = idMatricula;
    }

    public int getIdProgEduc() {
        return idProgEduc;
    }

    public void setIdProgEduc(int idProgEduc) {
        this.idProgEduc = idProgEduc;
    }

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }   
}
