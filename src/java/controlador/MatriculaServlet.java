package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Matricula;
import modelo.MatriculaDAO;

@WebServlet(name = "MatriculaServlet", urlPatterns = {"/MatriculaServlet"})
public class MatriculaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private MatriculaDAO matriculaDAO;

    public void init() {
        matriculaDAO = new MatriculaDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idAlumno = Integer.parseInt(request.getParameter("idAlumno"));
        int idProgEduc = Integer.parseInt(request.getParameter("idProgEduc"));
        String grado = request.getParameter("grado");
        String turno = request.getParameter("turno");

        // Crear un objeto Matricula y llenarlo con los datos
        Matricula matricula = new Matricula();
        matricula.setIdAlumno(idAlumno);
        matricula.setIdProgEduc(idProgEduc);
        matricula.setGrado(grado);
        matricula.setTurno(turno);

        // Registrar la matrícula en la base de datos
        int idMatricula = matriculaDAO.registrarMatricula(matricula);

        if (idMatricula > 0) {
            // Redirigir a pagoMatricula.jsp con el idMatricula
            request.setAttribute("idMatricula", idMatricula);
            RequestDispatcher dispatcher = request.getRequestDispatcher("pagoMatricula.jsp");
            dispatcher.forward(request, response);
        } else {
            // Manejar el error de matrícula
            request.setAttribute("matriculaError", "Error al registrar la matrícula");
            RequestDispatcher dispatcher = request.getRequestDispatcher("frmMatricula.jsp");
            dispatcher.forward(request, response);
        }
    }
}
