package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class PagoDAO {

    // Método para generar un código de pago único de 10 dígitos
    public String generarCodigoPago() {
        String codigoPago;
        Random random = new Random();
        do {
            StringBuilder sb = new StringBuilder(10);
            for (int i = 0; i < 10; i++) {
                sb.append(random.nextInt(10));
            }
            codigoPago = sb.toString();
        } while (codigoExiste(codigoPago)); // Asegurarse que el código sea único
        return codigoPago;
    }

    // Método para verificar si el código de pago ya existe
    private boolean codigoExiste(String codigoPago) {
        String query = "SELECT COUNT(*) FROM pago WHERE codigoPago = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, codigoPago);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para registrar el pago
    public boolean registrarPago(Pago pago) {
        String query = "INSERT INTO pago (idUsuario, idMatricula, codigoPago) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, pago.getIdUsuario());
            ps.setInt(2, pago.getIdMatricula());
            ps.setString(3, pago.getCodigoPago());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para obtener los detalles de costos de la tabla programa educativo
    public ProgramaEducativo obtenerDetallesPrograma(int idMatricula) {
    Connection con = DBConnection.getConnection();
    if (con == null) {
        return null; // conexión denegada
    }
    ProgramaEducativo programa = null;
    try {
        String query = "SELECT pe.* FROM programa_educativo pe " +
                       "JOIN Matricula m ON pe.idProgEduc = m.idProgEduc " +
                       "WHERE m.idMatricula = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, idMatricula);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            programa = new ProgramaEducativo();
            programa.setIdProgEduc(rs.getInt("idProgEduc"));
            programa.setTipo(rs.getString("tipo"));
            programa.setInscripcion(rs.getDouble("inscripcion"));
            programa.setMatricula(rs.getDouble("matricula"));
            programa.setGastosAdministrativos(rs.getDouble("gastosAdministrativos"));
            programa.setPension(rs.getDouble("pension"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (con != null) {
                con.close(); // Cerrar la conexión
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return programa;
}
}

