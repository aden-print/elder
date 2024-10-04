<%-- 
    Document   : IndexUsuarios
    Created on : 7 jul. 2024, 21:03:33
    Author     : leo
--%>
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
    
    if ("eliminar".equals(accion)) {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String queryEliminar = "DELETE FROM usuario WHERE idUsuario = ?";
        try (PreparedStatement psEliminar = conn.prepareStatement(queryEliminar)) {
            psEliminar.setInt(1, idUsuario);
            psEliminar.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //actualizar usuarios dentro del modal 
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        int idRol = Integer.parseInt(request.getParameter("idRol"));
        String correo = request.getParameter("correo");
        String dni = request.getParameter("dni");
        String apellidos = request.getParameter("apellidos");
        String nombres = request.getParameter("nombres");
        Date fechaNacimiento = Date.valueOf(request.getParameter("fechaNacimiento"));
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        if (conn != null) {
            String updateQuery = "UPDATE usuario SET idRol=?, correo=?, dni=?, apellidos=?, nombres=?, fechaNacimiento=?, direccion=?, telefono=? WHERE idUsuario=?";
            PreparedStatement psUpdate = conn.prepareStatement(updateQuery);
            psUpdate.setInt(1, idRol);
            psUpdate.setString(2, correo);
            psUpdate.setString(3, dni);
            psUpdate.setString(4, apellidos);
            psUpdate.setString(5, nombres);
            psUpdate.setDate(6, fechaNacimiento);
            psUpdate.setString(7, direccion);
            psUpdate.setString(8, telefono);
            psUpdate.setInt(9, idUsuario);
            psUpdate.executeUpdate();
        }
    }
    ArrayList<Usuario> lista = new ArrayList<>();

    if (conn != null) {
        String query = "SELECT * FROM usuario";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Usuario infoUser = new Usuario();
            infoUser.setIdUsuario(rs.getInt("idUsuario"));
            infoUser.setIdRol(rs.getInt("idRol"));
            infoUser.setDni(rs.getString("dni"));
            infoUser.setNombres(rs.getString("nombres"));
            infoUser.setApellidos(rs.getString("apellidos"));
            infoUser.setFechaNacimiento(rs.getDate("fechaNacimiento"));
            infoUser.setCorreo(rs.getString("correo"));
            infoUser.setContrasena(rs.getString("contrasena"));
            infoUser.setDireccion(rs.getString("direccion"));
            infoUser.setTelefono(rs.getString("telefono"));
            lista.add(infoUser);
        }
    } else {
        response.sendRedirect("index.jsp");
        // Manejo de error si no se puede establecer la conexión
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

    <!-- Modal para editar usuario -->
    <div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="editUserModalLabel">Editar Usuario</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm" method="post" action="indexUsuarios.jsp">
                        <input type="hidden" id="editIdUsuario" name="idUsuario">
                        <div class="form-group">
                            <label for="editIdRol">Rol</label>
                            <input type="text" class="form-control" id="editIdRol" name="idRol" required>
                        </div>
                        <div class="form-group">
                            <label for="editCorreo">Correo</label>
                            <input type="email" class="form-control" id="editCorreo" name="correo" required>
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
                            <label for="editDireccion">Dirección</label>
                            <input type="text" class="form-control" id="editDireccion" name="direccion" required>
                        </div>
                        <div class="form-group">
                            <label for="editTelefono">Teléfono</label>
                            <input type="text" class="form-control" id="editTelefono" name="telefono" required>
                        </div>
                       <button type="submit" class="btn btn-primary">Guardar cambios</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal para Agregar usuario -->
    <div class="modal fade" id="agregarUserModal" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="editUserModalLabel">Agregar Usuario</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm" method="post" action="indexUsuarios.jsp">
                        <input type="hidden" id="editIdUsuario" name="idUsuario">
                        <div class="form-group">
                            <label for="editIdRol">Rol</label>
                            <input type="text" class="form-control" id="editIdRol" name="idRol" required>
                        </div>
                        <div class="form-group">
                            <label for="editCorreo">Correo</label>
                            <input type="email" class="form-control" id="editCorreo" name="correo" required>
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
                            <label for="editDireccion">Dirección</label>
                            <input type="text" class="form-control" id="editDireccion" name="direccion" required>
                        </div>
                        <div class="form-group">
                            <label for="editTelefono">Teléfono</label>
                            <input type="text" class="form-control" id="editTelefono" name="telefono" required>
                        </div>
                       <button type="submit" class="btn btn-primary">Agregar nuevo </button>
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
                <div class="row">
                    <!-- Dashboard -->
                    <div class="sidebar">
                        <h2 class="text-white">Admin Dashboard</h2>
                        <a href="indexUsuarios.jsp" id="showUsers">Usuarios</a>
                        <a href="indexAlumnos.jsp" id="showStudents">Alumnos</a>
                    </div>
                        <div class="text-center">
                            <h2>Gestión de Usuarios</h2>
                            <button class="btn btn-primary" data-toggle="modal" data-target="#agregarUserModal">Agregar usuario</button>
                        </div>
                        <br>
                        <table class="table table-bordered mt-3">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Rol</th>
                                    <th>Correo</th>
                                    <th>DNI</th>
                                    <th>Apellidos</th>
                                    <th>Nombres</th>
                                    <th>Fecha Nacimiento</th>
                                    <th>Dirección</th>
                                    <th>Teléfono</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Usuario u : lista) {%>
                                <tr>
                                    <td><%= u.getIdUsuario()%></td>
                                    <td><%= u.getIdRol()%></td>
                                    <td><%= u.getCorreo()%></td>
                                    <td><%= u.getDni()%></td>
                                    <td><%= u.getApellidos()%></td>
                                    <td><%= u.getNombres()%></td>
                                    <td><%= new SimpleDateFormat("dd-MM-yyyy").format(u.getFechaNacimiento())%></td>
                                    <td><%= u.getDireccion()%></td>
                                    <td><%= u.getTelefono()%></td>
                                    <td>
                                        <button class="btn btn-warning" data-toggle="modal" data-target="#editUserModal" onclick="fillEditForm(<%= u.getIdUsuario()%>, <%= u.getIdRol()%>, '<%= u.getCorreo()%>', '<%= u.getDni()%>', '<%= u.getApellidos()%>', '<%= u.getNombres()%>', '<%= new SimpleDateFormat("yyyy-MM-dd").format(u.getFechaNacimiento())%>', '<%= u.getDireccion()%>', '<%= u.getTelefono()%>')">Editar</button>
                                        <br>
                                        <a href="indexUsuarios.jsp?accion=eliminar&idUsuario=<%= u.getIdUsuario()%>" class="btn btn-danger">Eliminar</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    
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
                    <!-- /row of panels -->
                </div>
            </div>
        </footer>

        <!-- JavaScript libs are placed at the end of the document so the pages load faster -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="assets/js/custom.js"></script>

        <!-- Google Maps -->
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        <script src="assets/js/google-map.js"></script>

        <script>
                                            function fillEditForm(idUsuario, idRol, correo, dni, apellidos, nombres, fechaNacimiento, direccion, telefono) {
                                                document.getElementById('editIdUsuario').value = idUsuario;
                                                document.getElementById('editIdRol').value = idRol;
                                                document.getElementById('editCorreo').value = correo;
                                                document.getElementById('editDni').value = dni;
                                                document.getElementById('editApellidos').value = apellidos;
                                                document.getElementById('editNombres').value = nombres;
                                                document.getElementById('editFechaNacimiento').value = fechaNacimiento;
                                                document.getElementById('editDireccion').value = direccion;
                                                document.getElementById('editTelefono').value = telefono;
                                            }
        </script>
    </body>
</html>







