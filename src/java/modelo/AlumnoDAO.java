package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AlumnoDAO {

    public boolean registrarAlumno(Alumno alumno) {
        Connection con = DBConnection.getConnection();
        if (con == null) {
            return false; // conexion denegada
        }
        try {
            String query = "INSERT INTO Alumno (`idUsuario`, `dni`, `apellidos`, `nombres`, `fechaNacimiento`, `institucionProcedencia`, `nombreContactoEmergencia`, `telefonoEmergencia`, `condicionMedica`, `estado`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, alumno.getIdUsuario());
            ps.setString(2, alumno.getDni());
            ps.setString(3, alumno.getApellidos());
            ps.setString(4, alumno.getNombres());
            ps.setDate(5, new java.sql.Date(alumno.getFechaNacimiento().getTime()));
            ps.setString(6, alumno.getInstitucionProcedencia());
            ps.setString(7, alumno.getNombreContactoEmergencia());
            ps.setString(8, alumno.getTelefonoEmergencia());
            ps.setString(9, alumno.getCondicionMedica());
            ps.setByte(10, alumno.getEstado());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para obtener la lista de alumnos por idUsuario
    public List<Alumno> obtenerAlumnosPorUsuario(int idUsuario) {
        List<Alumno> alumnos = new ArrayList<>();
        String query = "SELECT * FROM Alumno WHERE idUsuario = ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Alumno alumno = new Alumno();
                    // Mapear los campos de ResultSet al objeto Alumno
                    alumno.setIdAlumno(rs.getInt("idAlumno"));
                    alumno.setDni(rs.getString("dni"));
                    alumno.setApellidos(rs.getString("apellidos"));
                    alumno.setNombres(rs.getString("nombres"));
                    alumno.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                    alumno.setInstitucionProcedencia(rs.getString("institucionProcedencia"));
                    alumno.setNombreContactoEmergencia(rs.getString("nombreContactoEmergencia"));
                    alumno.setTelefonoEmergencia(rs.getString("telefonoEmergencia"));
                    alumno.setCondicionMedica(rs.getString("condicionMedica"));
                    alumno.setEstado(rs.getByte("estado"));
                    alumnos.add(alumno);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return alumnos;
    }
}
