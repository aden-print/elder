<%-- 
    Document   : indexAlumnos
    Created on : 11 jul. 2024, 07:57:25
    Author     : leo
--%>

<%@page import="modelo.Alumno"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="modelo.DBConnection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Connection conn = DBConnection.getConnection();
    String accion = request.getParameter("accion");

    //Eliminar alumno por id
    if ("eliminar".equals(accion)) {
        int idAlumno = Integer.parseInt(request.getParameter("idAlumno"));
        String queryEliminar = "DELETE FROM alumno WHERE idAlumno = ?";
        try (PreparedStatement psEliminar = conn.prepareStatement(queryEliminar)) {
            psEliminar.setInt(1, idAlumno);
            psEliminar.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //editar alumno por parametros de modal
    if ("editar".equals(accion)) {
        int idAlumno = Integer.parseInt(request.getParameter("idAlumno"));
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String dni = request.getParameter("dni");
        String apellidos = request.getParameter("apellidos");
        String nombres = request.getParameter("nombres");
        Date fechaNacimiento = Date.valueOf(request.getParameter("fechaNacimiento"));
        String institucionProcedencia = request.getParameter("institucionProcedencia");
        String nombreContactoEmergencia = request.getParameter("nombreContactoEmergencia");
        String telefonoEmergencia = request.getParameter("telefonoEmergencia");
        String condicionMedica = request.getParameter("condicionMedica");

        String queryEditar = "UPDATE alumno SET idUsuario = ?, dni = ?, apellidos = ?, nombres = ?, fechaNacimiento = ?, institucionProcedencia = ?, nombreContactoEmergencia = ?, telefonoEmergencia = ?, condicionMedica = ? WHERE idAlumno = ?";
        try (PreparedStatement psEditar = conn.prepareStatement(queryEditar)) {
            psEditar.setInt(1, idUsuario);
            psEditar.setString(2, dni);
            psEditar.setString(3, apellidos);
            psEditar.setString(4, nombres);
            psEditar.setDate(5, fechaNacimiento);
            psEditar.setString(6, institucionProcedencia);
            psEditar.setString(7, nombreContactoEmergencia);
            psEditar.setString(8, telefonoEmergencia);
            psEditar.setString(9, condicionMedica);
            psEditar.setInt(10, idAlumno);
            psEditar.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //cargar el Arraylist usando en select * from
    ArrayList<Alumno> listaAlumnos = new ArrayList<>();

    if (conn != null) {
        String query = "SELECT * FROM alumno";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Alumno infoAlumno = new Alumno();
            infoAlumno.setIdAlumno(rs.getInt("idAlumno"));
            infoAlumno.setIdUsuario(rs.getInt("idUsuario"));
            infoAlumno.setDni(rs.getString("dni"));
            infoAlumno.setApellidos(rs.getString("apellidos"));
            infoAlumno.setNombres(rs.getString("nombres"));
            infoAlumno.setFechaNacimiento(rs.getDate("fechaNacimiento"));
            infoAlumno.setInstitucionProcedencia(rs.getString("institucionProcedencia"));
            infoAlumno.setNombreContactoEmergencia(rs.getString("nombreContactoEmergencia"));
            infoAlumno.setTelefonoEmergencia(rs.getString("telefonoEmergencia"));
            infoAlumno.setCondicionMedica(rs.getString("condicionMedica"));
            listaAlumnos.add(infoAlumno);
        }
    } else {
        response.sendRedirect("index.jsp");
        out.println("Error al conectar a la base de datos");
    }
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="free-educational-responsive-web-template-webEdu">
        <meta name="author" content="webThemez.com">
        <title>Colegio Privado "ALFA" - Tumbes</title>
        <link rel="favicon" href="assets/images/favicon.png">
        <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <!--Modal para editar Alumnos-->
    <div class="modal fade" id="editAlumnoModal" tabindex="-1" role="dialog" aria-labelledby="editAlumnoModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="editAlumnoModalLabel">Editar Alumno</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editAlumnoForm" method="post" action="indexAlumnos.jsp?accion=editar">
                        <input type="hidden" id="editIdAlumno" name="idAlumno">
                        <div class="form-group">
                            <label for="editIdUsuario">ID Usuario</label>
                            <input type="text" class="form-control" id="editIdUsuario" name="idUsuario" required>
                        </div>
                        <div class="form-group">
                            <label for="editDni">DNI</label>
                            <input type="text" class="form-control" id="editDni" name="dni" required>
                        </div>
                        <div class="form-group">
                            <label for="editApellidos">Apellidos</label>
                            <input type="text" class="form-control" id="editApellidos" name="apellidos" required>
                        </div>
                        <div class="form-group">
                            <label for="editNombres">Nombres</label>
                            <input type="text" class="form-control" id="editNombres" name="nombres" required>
                        </div>
                        <div class="form-group">
                            <label for="editFechaNacimiento">Fecha Nacimiento</label>
                            <input type="date" class="form-control" id="editFechaNacimiento" name="fechaNacimiento" required>
                        </div>
                        <div class="form-group">
                            <label for="editInstitucionProcedencia">Institución Procedencia</label>
                            <input type="text" class="form-control" id="editInstitucionProcedencia" name="institucionProcedencia" required>
                        </div>
                        <div class="form-group">
                            <label for="editNombreContactoEmergencia">Nombre Contacto Emergencia</label>
                            <input type="text" class="form-control" id="editNombreContactoEmergencia" name="nombreContactoEmergencia" required>
                        </div>
                        <div class="form-group">
                            <label for="editTelefonoEmergencia">Teléfono Emergencia</label>
                            <input type="text" class="form-control" id="editTelefonoEmergencia" name="telefonoEmergencia" required>
                        </div>
                        <div class="form-group">
                            <label for="editCondicionMedica">Condición Médica</label>
                            <input type="text" class="form-control" id="editCondicionMedica" name="condicionMedica" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Guardar cambios</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <body>
        <%
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if (usuario != null && usuario.getIdRol() == 3) {
        %>
        <header id="head" class="secondary">
            <a class="navbar-brand" href="index.jsp">
                <img src="assets/images/logoalfa.jpg"></a>
            <div class="container">
                <h1>Panel de administradores</h1>
                <p>Bienvenido Admin, <%= usuario.getNombres().toUpperCase()%>. Aquí podrás gestionar las operaciones básicas de la institución.</p>
            </div>
        </header>
        <div class="container">
            <div class="container-fluid">
                <div class="row">
                    <!-- Dashboard -->
                    <div class="sidebar">
                        <h2 class="text-white">Admin Dashboard</h2>
                        <a href="indexUsuarios.jsp" id="showUsers">Usuarios</a>
                        <a href="indexAlumnos.jsp" id="showStudents">Alumnos</a>
                    </div>

                    <div class="col-md-9">
                        <div class="text-center">
                            <h2>Gestión de Alumnos</h2>
                            <a href="nuevoUsuario.jsp" class="btn btn-primary">Agregar Alumno</a>
                        </div>
                        <br>
                         <table class="table table-bordered table-striped table-dark" >
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>IdUser</th>
                                    <th>DNI</th>
                                    <th>Apellidos</th>
                                    <th>Nombres</th>
                                    <th>Fecha Nacimiento</th>
                                    <th>Institución de procedencia</th>
                                    <th>Contacto de Emergencia</th>
                                    <th>Telefono de Emergencia</th>
                                    <th>Condicion medica</th>
                                    <th>Acciones </th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Alumno a : listaAlumnos) {%>
                                <tr>
                                    <td><%= a.getIdAlumno()%></td>
                                    <td><%= a.getIdUsuario()%></td>
                                    <td><%= a.getDni()%></td>
                                    <td><%= a.getApellidos()%></td>
                                    <td><%= a.getNombres()%></td>
                                    <td><%= new SimpleDateFormat("dd-MM-yyyy").format(a.getFechaNacimiento())%></td>
                                    <td><%= a.getInstitucionProcedencia()%></td>
                                    <td><%= a.getNombreContactoEmergencia()%></td>
                                    <td><%= a.getTelefonoEmergencia()%></td>
                                    <td><%= a.getCondicionMedica()%></td>
                                    <td>
                                        <button class="btn btn-warning" data-toggle="modal" data-target="#editAlumnoModal" onclick="fillEditForm(<%= a.getIdAlumno()%>, <%= a.getIdUsuario()%>, '<%= a.getDni()%>', '<%= a.getApellidos()%>', '<%= a.getNombres()%>', '<%= new SimpleDateFormat("yyyy-MM-dd").format(a.getFechaNacimiento())%>', '<%= a.getInstitucionProcedencia()%>', '<%= a.getNombreContactoEmergencia()%>', '<%= a.getTelefonoEmergencia()%>', '<%= a.getCondicionMedica()%>')">Editar</button>
                                        <a href="indexAlumnos.jsp?accion=eliminar&idAlumno=<%= a.getIdAlumno()%>" class="btn btn-danger">Eliminar</a>

                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%
        } else {
        %>
        <header id="head" class="secondary">
            <a class="navbar-brand" href="index.jsp">
                <img src="assets/images/logoalfa.jpg"></a>
            <div class="container">
                <h1>Acceso Denegado!</h1>
                <p>No puedes entrar a este lugar</p>
            </div>
        </header>
        <%
            }
        %>     

        <div class="social text-center">
            <a href="https://www.facebook.com/ColegioAlfaTumbes?locale=es_LA"><i class="fa fa-facebook"></i></a>
            <a href="https://www.youtube.com/@institucioneducativaprivad186"><i class="fa fa-youtube"></i></a>
            <a href="https://api.whatsapp.com/send?phone=%2B51937733255&context=ARBRMjT7-kj743kp-Cx8lplZmY2X1iFxAoLXLtL5o_aZqxpR8gZSp57hqiSKzpJ0NHpQwQ9MIzD2b_PoL71doI0U5NRf-qLFA9_eNYkCcBi4BCMZkJ_vZf_OcBU5UifZqKR_b-xerXkSZgzIY6YpIHEF4A&source=FB_Page&app=facebook&entry_point=page_cta&fbclid=IwZXh0bgNhZW0CMTAAAR3ENwkUfHewN842gV8IvMTZAzq0GSC7QYnm_vJlucHvEbwSGDo66RmduE0_aem_ARffkXFrUHYzMNYnR27CrlxN1pFouJVsmAgTJq1rK7GTp2CgtMraWqY-Vycrath6U3RCdaVWg8geaB6NWwysMgIY"><i class="fa fa-comments"></i></a>
        </div>

        <div class="clear"></div>
        <!--CLEAR FLOATS-->

        <footer>
            <div class="footer2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 panel">
                            <div class="panel-body">
                                <p class="simplenav">
                                    <a href="index.jsp">Inicio</a>
                                    <a href="acercade.jsp">Acerca de</a>
                                    <a href="niveles.jsp">Niveles académicos</a>
                                    <a href="costos.jsp">Nuestros costos</a>
                                    <a href="album.jsp">Álbum</a>
                                    <a href="matriculate.jsp">Matricúlate ahora ></a>
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6 panel">
                            <div class="panel-body">
                                <p class="text-right">
                                    Copyright &copy; 2024
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- JavaScript libs are placed at the end of the document so the pages load faster -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="assets/js/custom.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        <script src="assets/js/google-map.js"></script>
        <script>

                                            function fillEditForm(idAlumno, idUsuario, dni, apellidos, nombres, fechaNacimiento, institucionProcedencia, nombreContactoEmergencia, telefonoEmergencia, condicionMedica) {
                                                document.getElementById('editIdAlumno').value = idAlumno;
                                                document.getElementById('editIdUsuario').value = idUsuario;
                                                document.getElementById('editDni').value = dni;
                                                document.getElementById('editApellidos').value = apellidos;
                                                document.getElementById('editNombres').value = nombres;
                                                document.getElementById('editFechaNacimiento').value = fechaNacimiento;
                                                document.getElementById('editInstitucionProcedencia').value = institucionProcedencia;
                                                document.getElementById('editNombreContactoEmergencia').value = nombreContactoEmergencia;
                                                document.getElementById('editTelefonoEmergencia').value = telefonoEmergencia;
                                                document.getElementById('editCondicionMedica').value = condicionMedica;
                                            }

        </script>
    </script>
</body>
</html>

