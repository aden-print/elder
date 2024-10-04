<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="modelo.Usuario"%>
<%@page session="true" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html; charset=UTF-8" %>
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
        <!-- Custom styles for our template -->
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
                        <li class="active"><a href="niveles.jsp">Niveles Académicos</a></li>
                        <li><a href="costos.jsp">Nuestros Costos</a></li>
                        <li><a href="album.jsp">Álbum</a></li>
                            <%
                                Usuario usuario = (Usuario) session.getAttribute("usuario");
                                if (usuario != null) {
                            %>
                        <li class="dropdown">
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
                            <% }%>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
        <!-- /.navbar -->

        <header id="head" class="secondary">
            <div class="container">
                <h1>Nuestros niveles académicos</h1>
                <p>Ofrecemos una educación integral a través de cuatro niveles; cada etapa está diseñada para fomentar el desarrollo académico y personal, preparando a nuestros estudiantes para los desafíos futuros con una base sólida y competencias necesarias para el éxito.</p>
            </div>
        </header>


        <div class="container">
            <h3>Niveles Académicos</h3>
            <p>
                Ofrecemos una educación integral a través de cuatro niveles: Inicial, Primaria, Secundaria y Pre-universitario.
            </p>
            <br/>
            <ul class="list-unstyled video-list-thumbs row">
                <li class="col-lg-3 col-sm-4 col-xs-6">
                    <a href="https://fb.watch/sh6ghc_hqz/" title="Nivel Inicial">
                        <img src="assets/images/inicial.jpg" alt="Nivel Inicial" class="img-responsive" style="width: 100%; height: 150px; object-fit: cover;" />
                        <h2>Nivel Inicial</h2>
                        <p>Desarrollamos habilidades básicas a través de juegos y actividades creativas en un entorno seguro y estimulante.</p>
                        <span class="play-button"></span>
                        <span class="duration">Video de presentación</span>
                    </a>
                </li>
                <li class="col-lg-3 col-sm-4 col-xs-6">
                    <a href="https://fb.watch/sh6hrCUJBl/" title="Nivel Primaria">
                        <img src="assets/images/primaria.jpg" alt="Nivel Primaria" class="img-responsive" style="width: 100%; height: 150px; object-fit: cover;" />
                        <h2>Nivel Primaria</h2>
                        <p>Fomentamos el aprendizaje integral y la curiosidad académica con un enfoque en la formación de valores y habilidades sociales.</p>
                        <span class="play-button"></span>
                        <span class="duration">Video de presentación</span>
                    </a>
                </li>
                <li class="col-lg-3 col-sm-4 col-xs-6">
                    <a href="https://fb.watch/sh6iYGEeY3/" title="Nivel Secundaria">
                        <img src="assets/images/secundaria.jpg" alt="Nivel Secundaria" class="img-responsive" style="width: 100%; height: 150px; object-fit: cover;" />
                        <h2>Nivel Secundaria</h2>
                        <p>Preparamos a los estudiantes para los desafíos académicos futuros, promoviendo el pensamiento crítico y la autonomía.</p>
                        <span class="play-button"></span>
                        <span class="duration">Video de presentación</span>
                    </a>
                </li>
                <li class="col-lg-3 col-sm-4 col-xs-6">
                    <a href="https://fb.watch/sh6mr9IhSP/" title="Nivel Pre-universitario">
                        <img src="assets/images/preuniversitario.jpg" alt="Nivel Pre-universitario" class="img-responsive" style="width: 100%; height: 150px; object-fit: cover;" />
                        <h2>Nivel Pre-universitario</h2>
                        <p>Ofrecemos una formación académica intensiva que prepara a los estudiantes para ingresar a las mejores universidades del país.</p>
                        <span class="play-button"></span>
                        <span class="duration">Video de presentación</span>
                    </a>
                </li>
            </ul>
        </div>
        <!-- container -->
        <div class="container">
            <div class="row">
                <!-- Article content -->
                <section class="col-sm-12 maincontent">
                    <h3>Curso de Inglés</h3>
                    <p>
                        Nuestro curso de Inglés está diseñado para desarrollar competencias lingüísticas en los estudiantes, preparándolos para comunicarse eficazmente en un mundo globalizado. A través de un enfoque interactivo y dinámico, fomentamos la práctica de la comprensión auditiva, la expresión oral, la lectura y la escritura. Utilizamos recursos modernos y actividades prácticas para asegurar un aprendizaje integral del idioma.                    
                    </p>
                    <h3>Curso de Física</h3>
                    <p>
                        El curso de Física en el Colegio Alfa ofrece una sólida base en los principios fundamentales de la física, desde la mecánica hasta la electromagnetismo. A través de experimentos prácticos, proyectos y resolución de problemas, los estudiantes aprenden a aplicar conceptos teóricos a situaciones del mundo real. Nuestro objetivo es cultivar el pensamiento crítico y analítico, preparando a los alumnos para futuros estudios en ciencias e ingeniería.
                    </p>
                    <h3>Curso de Química</h3>
                    <p>
                        En el curso de Química, los estudiantes exploran la composición, estructura y propiedades de la materia. Nuestro enfoque educativo combina teoría con experimentación en el laboratorio, permitiendo a los estudiantes observar y comprender las reacciones químicas de primera mano. Fomentamos la curiosidad científica y el método investigativo, preparando a los alumnos para enfrentar los desafíos académicos y profesionales en el campo de las ciencias químicas.
                    </p>
                </section>
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
                                                Postulantes a Universidades
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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html
