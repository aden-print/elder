package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    // Método para validar el usuario
    public Usuario validarUsuario(String correo, String contrasena) {
        Connection con = DBConnection.getConnection();
        if (con == null) {
            return null; 
        }
        try {
            String query = "SELECT * FROM usuario WHERE correo = ? AND contrasena = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setIdRol(rs.getInt("idRol"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setDni(rs.getString("dni"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setNombres(rs.getString("nombres"));
                usuario.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setTelefono(rs.getString("telefono"));
                return usuario;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método para registrar un nuevo usuario
    public boolean registrarUsuario(Usuario usuario) {
        Connection con = DBConnection.getConnection();
        if (con == null) {
            return false; // conexion denegada
        }
        try {
            String query = "INSERT INTO `usuario` (`idRol`, `dni`, `nombres`, `apellidos`, `fechaNacimiento`, `correo`, `contrasena`, `direccion`, `telefono`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, usuario.getIdRol());
            ps.setString(2, usuario.getDni());
            ps.setString(3, usuario.getNombres());
            ps.setString(4, usuario.getApellidos());
            ps.setDate(5, new java.sql.Date(usuario.getFechaNacimiento().getTime()));
            ps.setString(6, usuario.getCorreo());
            ps.setString(7, usuario.getContrasena());
            ps.setString(8, usuario.getDireccion());
            ps.setString(9, usuario.getTelefono());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

