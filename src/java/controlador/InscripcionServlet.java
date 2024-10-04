package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Alumno;
import modelo.AlumnoDAO;

@WebServlet(name = "InscripcionServlet", urlPatterns = {"/InscripcionServlet"})
public class InscripcionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener la sesión y el idUsuario
        HttpSession session = request.getSession();
        Integer idUsuario = (Integer) session.getAttribute("idUsuario");

        if (idUsuario == null) {
            // Maneja el caso donde no hay usuario en sesión, redirige o muestra un mensaje de error
            response.sendRedirect("iniciarSesion.jsp");
            return;
        }
        String dni = request.getParameter("dni");
        String apellidos = request.getParameter("apellidos");
        String nombres = request.getParameter("nombres");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String institucionProcedencia = request.getParameter("institucionProcedencia");
        String nombreContactoEmergencia = request.getParameter("nombreContactoEmergencia");
        String telefonoEmergencia = request.getParameter("telefonoEmergencia");
        String condicionMedica = request.getParameter("condicionMedica");
        byte estado = Byte.parseByte(request.getParameter("estado"));
        
        // Crear instancia de Alumno y setear los valores
        Alumno alumno = new Alumno();
        alumno.setDni(dni);
        alumno.setApellidos(apellidos);
        alumno.setNombres(nombres);
        alumno.setFechaNacimiento(java.sql.Date.valueOf(fechaNacimiento));
        alumno.setInstitucionProcedencia(institucionProcedencia);
        alumno.setNombreContactoEmergencia(nombreContactoEmergencia);
        alumno.setTelefonoEmergencia(telefonoEmergencia);
        alumno.setCondicionMedica(condicionMedica);
        alumno.setEstado(estado);
        alumno.setIdUsuario(idUsuario);

        // Llamar al método que registra al alumno en la base de datos
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        boolean registrado = alumnoDAO.registrarAlumno(alumno);

        if (registrado) {
            response.sendRedirect("panelControl.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }

    }
}
