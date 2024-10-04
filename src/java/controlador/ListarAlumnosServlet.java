package controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Alumno;
import modelo.AlumnoDAO;

@WebServlet(name = "ListarAlumnosServlet", urlPatterns = {"/ListarAlumnosServlet"})
public class ListarAlumnosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener idUsuario (aquí puedes modificar según cómo obtengas el id del usuario)
        HttpSession session = request.getSession();
        Integer idUsuario = (Integer) session.getAttribute("idUsuario");
        if (idUsuario == null) {
            response.sendRedirect("iniciarSesion.jsp");
            return;
        }
        // Obtener alumnos del DAO
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        List<Alumno> alumnos = alumnoDAO.obtenerAlumnosPorUsuario(idUsuario);

        // Establecer los alumnos como atributo de la solicitud
        request.setAttribute("alumnos", alumnos);

        // Reenviar a la vista
        RequestDispatcher dispatcher = request.getRequestDispatcher("matricularAlumno.jsp");
        dispatcher.forward(request, response);
    }
}
