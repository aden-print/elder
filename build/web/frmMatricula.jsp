<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Alumno"%>
<%@page session="true" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%
    String id = request.getParameter("id");
    String dni = request.getParameter("dni");
    String apellidos = request.getParameter("apellidos");
    String nombres = request.getParameter("nombres");
%>

<html lang="es">
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
    <body>
        <!-- Fixed navbar -->
        <div class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <!-- Button for smallest screens -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="index.jsp">
                        <img src="assets/images/logoalfa.jpg"></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav pull-right mainNav">
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="acercade.jsp">Acerca De</a></li>
                        <li><a href="niveles.jsp">Niveles Académicos</a></li>
                        <li><a href="costos.jsp">Nuestros Costos</a></li>
                        <li><a href="album.jsp">Álbum</a></li>

                        <%
                            Usuario usuario = (Usuario) session.getAttribute("usuario");
                            if (usuario != null) {
                        %>
                        <li class="active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Bienvenido, <%= usuario.getNombres()%> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="LogoutServlet">Cerrar Sesión</a></li>
                                <li><a href="matriculate.jsp">Inscribir Alumno</a></li>
                                <li><a href="ListarAlumnosServlet">Mis Alumnos</a></li>
                                <% 
                             if (usuario.getIdRol() == 3) {
                       

                                     %>
                                     <li><a href="indexUsuarios.jsp">Panel de Administadores </a></li>
                                     <% } %>
                            </ul>
                        </li>
                        <%
                        } else {
                        %>
                        <li><a href="iniciarSesion.jsp">Iniciar Sesión</a></li>
                            <% } %>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
        <!-- /.navbar -->
        <header id="head" class="secondary">
            <div class="container">
                <h1>Proceso de matriculación</h1>
                <p>Se ha seleccionado un alumno a matricular, por favor termine de llenar los campos correspondientes.</p>
            </div>
        </header>
        <!-- container -->
        <div class="container">
            <div class="row">

                <%
                    if (usuario == null) {
                %>
                <br>
                <h4>Debe iniciar sesión primero para matricular a un alumno.</h4>

                <%
                } else {
                %>
                <div class="col-md-8">
                    <h3>Estás matriculando a:</h3>
                    <br>
                    <form class="form-light mt-20 ${not empty matriculaError ? 'c-error' : ''}" role="form" action="MatriculaServlet" method="post">
                        <div class="row">
                            <input type="hidden" id="idAlumno" name="idAlumno" value="<%= id%>">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>DNI del alumno:</label>
                                    <input type="text" class="form-control" name="dni" placeholder="DNI del alumno" value="<%= dni%>" readonly>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Apellidos del alumno:</label>
                                    <input type="text" class="form-control" name="apellidos" placeholder="Apellidos del alumno" value="<%= apellidos%>" readonly>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Nombres del alumno:</label>
                                    <input type="text" class="form-control" name="nombres" placeholder="Nombres del alumno" value="<%= nombres%>" readonly>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <h3>Termina de llenar los campos correspondientes:</h3>
                                <br>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Programa educativo:</label>
                                    <select id="idProgEduc" name="idProgEduc" class="form-control" required onchange="updateGradoOptions()">
                                        <option value="1">Inicial</option>
                                        <option value="2">Primaria</option>
                                        <option value="3">Secundaria</option>
                                        <option value="4">Preuniversitario</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Grado de estudios a ingresar:</label>
                                    <select id="grado" name="grado" class="form-control">
                                        <!-- Initial options for "Inicial" -->
                                        <option value="3 años">3 años</option>
                                        <option value="4 años">4 años</option>
                                        <option value="5 años">5 años</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Turno:</label>
                                    <select id="turno" name="turno" class="form-control" required>
                                        <option value="Mañana">Mañana</option>
                                        <option value="Tarde">Tarde</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <c:if test="${not empty matriculaError}">
                                    <div class="alert alert-danger error-message">${matriculaError}</div>
                                </c:if>
                            </div>   
                        </div>
                        <button type="submit" class="btn btn-two" name="enviar">Siguiente</button><p><br/></p>
                    </form>
                </div>
                <% }%>
            </div>
        </div>

        <!-- /container -->

        <footer id="footer">
            <div class="container">
                <div class="row">
                    <div class="footerbottom">
                        <div class="col-md-3 col-sm-6">
                            <div class="footerwidget">
                                <h4>
                                    Nuestros mejores alumnos
                                </h4>
                                <div class="menu-course">
                                    <ul class="menu">
                                        <li><a href="album.jsp">
                                                Postulantes UNT
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="footerwidget">
                                <h4>
                                    Costos de matrícula e inscripción
                                </h4>
                                <div class="menu-course">
                                    <ul class="menu">
                                        <li> <a href="costos.jsp">
                                                Plan indivual</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="footerwidget">
                                <h4>
                                    Nuestros niveles académicos
                                </h4>
                                <div class="menu-course">
                                    <ul class="menu">
                                        <li><a href="niveles.jsp">
                                                Inicial
                                            </a>
                                        </li>
                                        <li> <a href="niveles.jsp">
                                                Primaria
                                            </a>
                                        </li>
                                        <li><a href="niveles.jsp">
                                                Secundaria
                                            </a>
                                        </li>
                                        <li>
                                            <a href="niveles.jsp">
                                                Academia pre-univeritaria
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6"> 
                            <div class="footerwidget"> 
                                <h4>Contacto</h4> 
                                <p></p>
                                <div class="contact-info"> 
                                    <i class="fa fa-map-marker"></i> Panamericana Norte N°1485 - Salamanca - Tumbes 24000 Tumbes, Perú <br>
                                    <i class="fa fa-phone"></i> +51 937 733 255 <br>
                                </div> 
                            </div><!-- end widget --> 
                        </div>
                    </div>
                </div>
                <div class="social text-center">
                    <a href="https://www.facebook.com/ColegioAlfaTumbes?locale=es_LA"><i class="fa fa-facebook"></i></a>
                    <a href="https://www.youtube.com/@institucioneducativaprivad186"><i class="fa fa-youtube"></i></a>
                    <a href="https://api.whatsapp.com/send?phone=%2B51937733255&context=ARBRMjT7-kj743kp-Cx8lplZmY2X1iFxAoLXLtL5o_aZqxpR8gZSp57hqiSKzpJ0NHpQwQ9MIzD2b_PoL71doI0U5NRf-qLFA9_eNYkCcBi4BCMZkJ_vZf_OcBU5UifZqKR_b-xerXkSZgzIY6YpIHEF4A&source=FB_Page&app=facebook&entry_point=page_cta&fbclid=IwZXh0bgNhZW0CMTAAAR3ENwkUfHewN842gV8IvMTZAzq0GSC7QYnm_vJlucHvEbwSGDo66RmduE0_aem_ARffkXFrUHYzMNYnR27CrlxN1pFouJVsmAgTJq1rK7GTp2CgtMraWqY-Vycrath6U3RCdaVWg8geaB6NWwysMgIY"><i class="fa fa-comments"></i></a>
                </div>
                <div class="clear"></div>
                <!--CLEAR FLOATS-->
            </div>
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
        <script>
            function updateGradoOptions() {
                var progEduc = document.getElementById("idProgEduc").value;
                var gradoSelect = document.getElementById("grado");
                gradoSelect.innerHTML = ""; // Clear current options

                if (progEduc == "1") { // Inicial
                    gradoSelect.innerHTML += '<option value="3 años">3 años</option>';
                    gradoSelect.innerHTML += '<option value="4 años">4 años</option>';
                    gradoSelect.innerHTML += '<option value="5 años">5 años</option>';
                } else if (progEduc == "2") { // Primaria
                    gradoSelect.innerHTML += '<option value="1er grado">1er grado</option>';
                    gradoSelect.innerHTML += '<option value="2do grado">2do grado</option>';
                    gradoSelect.innerHTML += '<option value="3er grado">3er grado</option>';
                    gradoSelect.innerHTML += '<option value="4to grado">4to grado</option>';
                    gradoSelect.innerHTML += '<option value="5to grado">5to grado</option>';
                    gradoSelect.innerHTML += '<option value="6to grado">6to grado</option>';
                } else if (progEduc == "3") { // Secundaria
                    gradoSelect.innerHTML += '<option value="1er grado">1er grado</option>';
                    gradoSelect.innerHTML += '<option value="2do grado">2do grado</option>';
                    gradoSelect.innerHTML += '<option value="3er grado">3er grado</option>';
                    gradoSelect.innerHTML += '<option value="4to grado">4to grado</option>';
                    gradoSelect.innerHTML += '<option value="5to grado">5to grado</option>';
                } else if (progEduc == "4") { // Preuniversitario
                    gradoSelect.innerHTML += '<option value="">N/A</option>'; // Optional, or you can hide the entire select element
                }
            }
        </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="assets/js/custom.js"></script>

        <!-- Google Maps -->
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        <script src="assets/js/google-map.js"></script>


    </body>
</html>
