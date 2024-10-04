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
                        <li class="active"><a href="acercade.jsp">Acerca De</a></li>
                        <li><a href="niveles.jsp">Niveles Académicos</a></li>
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
                <h1>Acerca de nosotros</h1>
                <p>Una pequeña historia sobre nuestra institución educativa.</p>
            </div>
        </header>


        <!-- container -->
        <section class="container">
            <div class="row">
                <!-- main content -->
                <section class="col-sm-8 maincontent">
                    <h3>Sobre nosotros</h3>
                    <p>
                        <img src="assets/images/sobrenosotros.jpg" alt="" class="img-rounded pull-right" width="300" height="210">
                        La institución comenzó como un grupo educativo llamado "ALFA KIDS", dedicado a la educación preescolar de niños, ofreciendo horarios flexibles y servicio de alimentación para atender las necesidades de los padres de familia. Con el tiempo y gracias a inversiones estratégicas, la institución experimentó un crecimiento significativo y se transformó en un colegio privado de nivel inicial, primario y secundario. Actualmente, el colegio "ALFA" se destaca por su compromiso con la excelencia educativa, la formación integral de sus estudiantes y la promoción de valores fundamentales para su desarrollo personal y social. Además, se enfoca en preparar a jóvenes de cuarto y quinto de secundaria con su propia academia preuniversitaria para el ingreso a universidades nacionales por todo el Perú.
                    </p>
                    <h3>Misión</h3>
                    <p>Somos una institución la cual ofrece una educación de calidad que se basa en la práctica pedagógica centrada en el logro de aprendizajes significativos. Nuestro equipo de docentes altamente capacitados y actualizados en metodologías interactivas trabaja para fomentar el desarrollo de competencias, habilidades y valores en nuestros estudiantes. Además, promovemos activamente la participación de los padres de familia en el desarrollo integral de sus hijos.</p>
                    <h3>Visión</h3>
                    <p>Nos visualizamos como una institución educativa líder que se consolida y afianza su posición cada año. Buscamos obtener acreditaciones y certificaciones de calidad a nivel local, regional, nacional e internacional, en línea con los estándares educativos más exigentes. Nuestra prioridad es la formación integral de nuestros estudiantes, enfocándonos en aspectos espirituales, actitudinales, éticos y morales. Nuestro equipo docente está plenamente comprometido en brindar un servicio educativo de excelencia que impulse el éxito y el bienestar de nuestros estudiantes.</p>

                </section>
                <!-- /main -->
                <!-- Sidebar -->
                <aside class="col-sm-4 sidebar sidebar-right" id="noticias">

                    <div class="panel">
                        <h4>Ultimas noticias</h4>
                        <ul class="list-unstyled list-spaces">
                            <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fweb.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid0bGDsKxZJESesS8TtFMT3Vf8tCnMkt9vQ5qCiYuXNUUm7BEHVJyaqF3MN1L8iSvLDl&width=350&show_text=false&height=350&appId" width="350" height="350" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
                            <br>
                            <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fweb.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid0eCNWJUo4nucHrBLhxFLXBbTyfCGXuCZBL5Cy1zjVphWrhvnp4pGLKQqW5QuyHy6cl&width=350&show_text=false&height=368&appId" width="350" height="368" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
                        </ul>
                    </div>

                </aside>
                <!-- /Sidebar -->
            </div>
        </section>
        <!-- /container -->
        <section class="team-content" id="nosotros">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h3>Nuestro equipo</h3>
                        <p>Un grupo dedicado de profesionales comprometidos con la excelencia educativa y el desarrollo integral de nuestros estudiantes.</p>
                        <br />
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <!-- Team Member -->
                        <div class="team-member">
                            <!-- Image Hover Block -->
                            <div class="member-img">
                                <!-- Image  -->
                                <img class="img-responsive" src="assets/images/enrique.jpg" alt="">
                            </div>
                            <!-- Member Details -->
                            <h4>Cesar Enrique Chapoñan Diaz</h4>
                            <!-- Designation -->
                            <span class="pos">CEO</span>
                            <div class="team-socials">
                                <a href="https://web.facebook.com/cesarenrique.chaponandiaz"><i class="fa fa-facebook"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <!-- Team Member -->
                        <div class="team-member pDark">
                            <!-- Image Hover Block -->
                            <div class="member-img">
                                <!-- Image  -->
                                <img class="img-responsive" src="assets/images/henry.jpg" alt="">
                            </div>
                            <!-- Member Details -->
                            <h4>Henry William Chapoñan Diaz</h4>
                            <!-- Designation -->
                            <span class="pos">CEO</span>
                            <div class="team-socials">
                                <a href="https://web.facebook.com/henry.chaponandiaz"><i class="fa fa-facebook"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <!-- Team Member -->
                        <div class="team-member pDark">
                            <!-- Image Hover Block -->
                            <div class="member-img">
                                <!-- Image  -->
                                <img class="img-responsive" src="assets/images/orlando.jpg" alt="">
                            </div>
                            <!-- Member Details -->
                            <h4>Orlando Garrido</h4>
                            <!-- Designation -->
                            <span class="pos">Director</span>
                            <div class="team-socials">
                                <a href="https://www.facebook.com/olando.garrido"><i class="fa fa-facebook"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <!-- Team Member -->
                        <div class="team-member pDark">
                            <!-- Image Hover Block -->
                            <div class="member-img">
                                <!-- Image  -->
                                <img class="img-responsive" src="assets/images/yessenia.jpg" alt="">
                            </div>
                            <!-- Member Details -->
                            <h4>Yessenia Sosa Livia</h4>
                            <!-- Designation -->
                            <span class="pos">Secretaria</span>
                            <div class="team-socials">
                                <a href="https://www.facebook.com/yessenia.sosalivia"><i class="fa fa-facebook"></i></a>
                                <a href="https://www.linkedin.com/in/yessenia-sosa-livia-20a784231/"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
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
</html>
