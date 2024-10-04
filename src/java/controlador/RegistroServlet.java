package controlador;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import modelo.UsuarioDAO;
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String dni = request.getParameter("dni");
        String apellidos = request.getParameter("apellidos");
        String nombres = request.getParameter("nombres");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String contrasena = request.getParameter("contrasena");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        int idRol = Integer.parseInt(request.getParameter("idRol"));

        Usuario usuario = new Usuario();
        usuario.setCorreo(correo);
        usuario.setDni(dni);
        usuario.setApellidos(apellidos);
        usuario.setNombres(nombres);
        usuario.setFechaNacimiento(java.sql.Date.valueOf(fechaNacimiento));
        usuario.setContrasena(contrasena);
        usuario.setDireccion(direccion);
        usuario.setTelefono(telefono);
        usuario.setIdRol(idRol);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean registrado = usuarioDAO.registrarUsuario(usuario);

        if (registrado) {
            response.sendRedirect("panelControl.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}

  

