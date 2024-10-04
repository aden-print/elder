package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MatriculaDAO {
    public int registrarMatricula(Matricula matricula) {
        Connection con = DBConnection.getConnection();
        if (con == null) {
            return -1; // conexión denegada
        }
        int idMatricula = -1;
        try {
            con.setAutoCommit(false); // Iniciar una transacción

            // Query para insertar la matrícula
            String queryMatricula = "INSERT INTO Matricula (idProgEduc, idAlumno, grado, turno) VALUES (?, ?, ?, ?)";
            PreparedStatement psMatricula = con.prepareStatement(queryMatricula, Statement.RETURN_GENERATED_KEYS);
            psMatricula.setInt(1, matricula.getIdProgEduc());
            psMatricula.setInt(2, matricula.getIdAlumno());
            psMatricula.setString(3, matricula.getGrado());
            psMatricula.setString(4, matricula.getTurno());

            int resultMatricula = psMatricula.executeUpdate();

            if (resultMatricula > 0) {
                ResultSet generatedKeys = psMatricula.getGeneratedKeys();
                if (generatedKeys.next()) {
                    idMatricula = generatedKeys.getInt(1);
                }

                // Query para actualizar el estado del alumno
                String queryAlumno = "UPDATE Alumno SET estado = 1 WHERE idAlumno = ?";
                PreparedStatement psAlumno = con.prepareStatement(queryAlumno);
                psAlumno.setInt(1, matricula.getIdAlumno());

                int resultAlumno = psAlumno.executeUpdate();

                if (resultAlumno > 0) {
                    con.commit(); // Confirmar la transacción
                    return idMatricula;
                } else {
                    con.rollback(); // Revertir la transacción en caso de error
                    return -1;
                }
            } else {
                con.rollback(); // Revertir la transacción en caso de error
                return -1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                con.rollback(); // Revertir la transacción en caso de excepción
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return -1;
        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true); // Restaurar el auto-commit
                    con.close(); // Cerrar la conexión
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

