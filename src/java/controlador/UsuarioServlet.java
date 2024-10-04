/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import modelo.Usuario;
import modelo.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author leo
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }
        try {
            switch (action) {
                case "list":
                    listUsuarios(request, response);
                    break;
                case "delete":
                    deleteUsuario(request, response);
                    break;
                case "edit":
                    editUsuario(request, response);
                    break;
                case "update":
                    updateUsuario(request, response);
                    break;
                case "insert":
                    insertUsuario(request, response);
                    break;
                default:
                    listUsuarios(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listUsuarios(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ArrayList<Usuario> lista = new ArrayList<>();
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            String query = "SELECT * FROM usuario";
            try (PreparedStatement ps = conn.prepareStatement(query); ResultSet resultSet = ps.executeQuery()) {
                while (resultSet.next()) {
                    Usuario user = new Usuario();
                    user.setIdUsuario(resultSet.getInt("idUsuario"));
                    user.setIdRol(resultSet.getInt("idRol"));
                    user.setDni(resultSet.getString("dni"));
                    user.setNombres(resultSet.getString("nombres"));
                    user.setApellidos(resultSet.getString("apellidos"));
                    user.setFechaNacimiento(resultSet.getDate("fechaNacimiento"));
                    user.setCorreo(resultSet.getString("correo"));
                    user.setContrasena(resultSet.getString("contrasena"));
                    user.setDireccion(resultSet.getString("direccion"));
                    user.setTelefono(resultSet.getString("telefono"));
                    lista.add(user);
                }
            } catch (SQLException e) {
                throw new ServletException("Error en la consulta SQL", e);
            }

            // Establecer la lista como atributo del request
            // Dentro del método listUsuarios del servlet
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("indexUsuarios.jsp").forward(request, response);

        } else {
            System.err.println("Error de conexión a la base de datos");
            // Puedes manejar el error de conexión de alguna manera adecuada
        }
    }

    private void deleteUsuario(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        Connection conn = DBConnection.getConnection();
        String sql = "DELETE FROM usuario WHERE idUsuario=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, idUsuario);
        statement.executeUpdate();
        response.sendRedirect("UsuarioServlet?action=list");
    }

    private void editUsuario(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM usuario WHERE idUsuario=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, idUsuario);
        ResultSet resultSet = statement.executeQuery();
        Usuario usuario = new Usuario();
        if (resultSet.next()) {
            usuario.setIdUsuario(resultSet.getInt("idUsuario"));
            usuario.setIdRol(resultSet.getInt("idRol"));
            usuario.setCorreo(resultSet.getString("correo"));
            usuario.setDni(resultSet.getString("dni"));
            usuario.setApellidos(resultSet.getString("apellidos"));
            usuario.setNombres(resultSet.getString("nombres"));
            usuario.setFechaNacimiento(resultSet.getDate("fechaNacimiento"));
            usuario.setContrasena(resultSet.getString("contrasena"));
            usuario.setDireccion(resultSet.getString("direccion"));
            usuario.setTelefono(resultSet.getString("telefono"));
        }
        request.setAttribute("usuario", usuario);
        request.getRequestDispatcher("editusuario.jsp").forward(request, response);
    }

    private void updateUsuario(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        int idRol = Integer.parseInt(request.getParameter("idRol"));
        String correo = request.getParameter("correo");
        String dni = request.getParameter("dni");
        String apellidos = request.getParameter("apellidos");
        String nombres = request.getParameter("nombres");
        Date fechaNacimiento = Date.valueOf(request.getParameter("fechaNacimiento"));
        String contrasena = request.getParameter("contrasena");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        Connection conn = DBConnection.getConnection();
        String sql = "UPDATE usuario SET idRol=?, correo=?, dni=?, apellidos=?, nombres=?, fechaNacimiento=?, contrasena=?, direccion=?, telefono=? WHERE idUsuario=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, idRol);
        statement.setString(2, correo);
        statement.setString(3, dni);
        statement.setString(4, apellidos);
        statement.setString(5, nombres);
        statement.setDate(6, fechaNacimiento);
        statement.setString(7, contrasena);
        statement.setString(8, direccion);
        statement.setString(9, telefono);
        statement.setInt(10, idUsuario);
        statement.executeUpdate();
        response.sendRedirect("UsuarioServlet?action=list");
    }

    private void insertUsuario(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int idRol = Integer.parseInt(request.getParameter("idRol"));
        String correo = request.getParameter("correo");
        String dni = request.getParameter("dni");
        String apellidos = request.getParameter("apellidos");
        String nombres = request.getParameter("nombres");
        Date fechaNacimiento = Date.valueOf(request.getParameter("fechaNacimiento"));
        String contrasena = request.getParameter("contrasena");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        Connection conn = DBConnection.getConnection();
        String sql = "INSERT INTO usuarios (idRol, correo, dni, apellidos, nombres, fechaNacimiento, contrasena, direccion, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, idRol);
        statement.setString(2, correo);
        statement.setString(3, dni);
        statement.setString(4, apellidos);
        statement.setString(5, nombres);
        statement.setDate(6, fechaNacimiento);
        statement.setString(7, contrasena);
        statement.setString(8, direccion);
        statement.setString(9, telefono);
        statement.executeUpdate();
        response.sendRedirect("UsuarioServlet?action=list");

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
