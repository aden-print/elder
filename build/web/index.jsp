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
        <title>Colegio Privado "ALFA" - Tumbes</title>
        <link rel="favicon" href="assets/images/icon.png">
        <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen"> 
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel='stylesheet' id='camera-css'  href='assets/css/camera.css' type='text/css' media='all'> 
    </head>
    <body>
        <!-- navbar -->
        <div class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <!-- Botones de navegacion -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="index.jsp">
                        <img src="assets/images/logoalfa.jpg"></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav pull-right mainNav">
                        <li class="active"><a href="index.jsp">Inicio</a></li>
                        <li><a href="acercade.jsp">Acerca De</a></li>
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
                <!--/.nav- -->
            </div>
        </div>
        <!-- /.navbar -->
        <!-- Header -->
        <header id="head">
            <div class="container">
                <div class="heading-text">							
                    <h1 class="animated flipInY delay1">¡Líder en excelencia académica!</h1>
                    <p>Invierte en la mejor educación para tus hijos: Academias & Colegios "ALFA" en Tumbes.</p>
                </div>
                <div class="fluid_container">                       
                    <div class="camera_wrap camera_emboss pattern_1" id="camera_wrap_4">
                        <div data-thumb="assets/images/slides/thumbs/img1.jpg" data-src="assets/images/slides/foto1.jpg">
                        </div> 
                        <div data-thumb="assets/images/slides/thumbs/img2.jpg" data-src="assets/images/slides/foto2.jpg">
                        </div>
                        <div data-thumb="assets/images/slides/thumbs/img3.jpg" data-src="assets/images/slides/foto3.jpg">
                        </div> 
                    </div><!-- #camera_wrap_3 -->
                </div><!-- .fluid_container -->
            </div>
        </header>
        <!-- /Header -->

        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="grey-box-icon">
                        <div class="icon-box-top grey-box-icon-pos">
                            <img src="assets/images/cursos.png" alt="" />
                        </div><!--icon box top -->
                        <h4>Los Mejores Cursos</h4>
                        <p>En el Colegio Alfa, contamos con una amplia gama de cursos diseñados para brindar a nuestros
                            estudiantes una educación de calidad que los preparará para el futuro.</p>
                        <p><a href="niveles.jsp"><em>Leer más</em></a></p>
                    </div><!--grey box -->
                </div><!--/span3-->
                <div class="col-md-3">
                    <div class="grey-box-icon">
                        <div class="icon-box-top grey-box-icon-pos">
                            <img src="assets/images/profesores.png" alt="" />
                        </div><!--icon box top -->
                        <h4>Nuestro Equipo</h4>
                        <p>Conoce a nuestro equipo de profesionales dedicados que están comprometidos a brindar
                            la mejor educación a nuestros estudiantes. Todos estamos aquí para ayudarte a alcanzar tus metas académicas.</p>
                        <p><a href="acercade.jsp#nosotros"><em>Leer más </em></a></p>
                    </div><!--grey box -->
                </div><!--/span3-->
                <div class="col-md-3">
                    <div class="grey-box-icon">
                        <div class="icon-box-top grey-box-icon-pos">
                            <img src="assets/images/oportunidades.png" alt="" />
                        </div><!--icon box top -->
                        <h4>Oportunidades de Progreso</h4>
                        <p>Descubre las diversas oportunidades de progreso que ofrecemos en el Colegio Alfa. Desde academia pre-universitaria hasta asesoramiento universitario. Click en "leer más" para ver nuestros mejores alumnos.</p>
                        <p><a href="album.jsp"><em>Leer más</em></a></p>
                    </div><!--grey box -->
                </div><!--/span3-->
                <div class="col-md-3">
                    <div class="grey-box-icon">
                        <div class="icon-box-top grey-box-icon-pos">
                            <img src="assets/images/noticias.png" alt="" />
                        </div><!--icon box top -->
                        <h4>Últimas Noticias</h4>
                        <p>Mantente al día con las últimas noticias y eventos en el Colegio Alfa. 
                            Desde actividades extracurriculares hasta logros académicos, aquí encontrarás 
                            todo lo que necesitas saber para estar informado sobre nuestra comunidad escolar.</p>
                        <p><a href="acercade.jsp#noticias"><em>Leer más</em></a></p>
                    </div><!--grey box -->
                </div><!--/span3-->
            </div>
        </div>
        <section class="news-box top-margin">
            <div class="container">
                <h2><span>Reseñas</span></h2>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="newsBox">
                            <div class="thumbnail">
                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fcarlosantonio.ruizzapata.3%2Fposts%2Fpfbid0WtRDgxZ4hnFg2yRdi8unCwF96CWjeTP5ubWXfRYSmTCchJKjuAwUEekFdYdWSdmCl&show_text=true&width=500&is_preview=true" width="500" height="170" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="newsBox">
                            <div class="thumbnail">
                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Flaura.egusquizaflores%2Fposts%2Fpfbid02LQfPUev14Cb91e9Z26M86u9ee2BD1jEDoccJuf7eZKfQJvcFnxhpz8uxy4qHjLAml&show_text=true&width=500&is_preview=true" width="500" height="170" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="newsBox">
                            <div class="thumbnail">
                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fsonia.valdivia.332%2Fposts%2Fpfbid0htCqqJZnYGuhxTm9w1T33K422TC4a3jGtVRf2thPWhKg5NEbBqT4vpwxh28gG3Q6l&show_text=true&width=500&is_preview=true" width="500" height="194" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="newsBox">
                            <div class="thumbnail">
                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fflordemaria.liviagarcia%2Fposts%2Fpfbid0WcN4yvy6Pp2dgTpw8aSm89GPAJJJpvj4AgwyPivHedDUvztvdrxroCNePvn5RA9vl&show_text=true&width=500&is_preview=true" width="500" height="166" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                        </div>
                        </div>
                    </div>
                </div>
        </section>
        <section class="container">
            <div class="row">
                <div class="col-md-6"><div class="title-box clearfix "><h2 class="title-box_primary">Sobre nosotros</h2></div> 
                    <p><span>La instutucion educativa alfa cree en el potencial de cada estudiante y nos esforzamos por proporcionar un ambiente educativo
                            estimulante donde puedan crecer intelectualmente, socialmente y emocionalmente. Nuestro equipo de educadores
                            altamente calificados y apasionados está dedicado a guiar y apoyar a nuestros estudiantes en su viaje 
                            de aprendizaje.</span></p>

                    <p>Con programas educativos innovadores y un equipo dedicado de profesionales, ofrecemos una experiencia 
                        educativa de calidad que prepara a nuestros alumnos para el futuro. ¡Únete a nosotros en nuestro viaje
                        hacia el conocimiento y el éxito!.</p>
                    <a href="acercade.jsp" title="read more" class="btn-inline " target="_self">Leer más</a> </div>

                <div class="col-md-4"><div class="title-box clearfix"><h2 class="title-box_primary">Principales Asignaturas</h2></div> 
                    <div class="list styled custom-list">
                        <ul>
                            <li><a title="Explora el fascinante mundo de las matemáticas y la informática." href="#">Comunicación</a></li>
                            <li><a title="Sumérgete en el mundo de la filosofía y descubre nuevas perspectivas." href="#">Matemática</a></li>
                            <li><a title="Aprende idiomas modernos y profundiza en la filosofía." href="#">Ingles</a></li>
                            <li><a title="Descubre los acontecimientos históricos de ayer y de hoy." href="#">Historia</a></li>
                            <li><a title="Explora la arqueología clásica y la historia antigua." href="#">Geografía</a></li>
                            <li><a title="Combina el mundo de la física con la filosofía." href="#">Química y Física</a></li>
                        </ul>
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
        <script src="assets/js/modernizr-latest.js"></script> 
        <script type='text/javascript' src='assets/js/jquery.min.js'></script>
        <script type='text/javascript' src='assets/js/fancybox/jquery.fancybox.pack.js'></script>
        <script type='text/javascript' src='assets/js/jquery.mobile.customized.min.js'></script>
        <script type='text/javascript' src='assets/js/jquery.easing.1.3.js'></script> 
        <script type='text/javascript' src='assets/js/camera.min.js'></script> 
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/custom.js"></script>
        <script>
            jQuery(function () {
                jQuery('#camera_wrap_4').camera({
                    transPeriod: 500,
                    time: 3000,
                    height: '600',
                    loader: 'false',
                    pagination: true,
                    thumbnails: false,
                    hover: false,
                    playPause: false,
                    navigation: false,
                    opacityOnGrid: false,
                    imagePath: 'assets/images/'
                });
            });
        </script>
    </body>
</html>

