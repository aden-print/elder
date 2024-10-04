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
        <link rel="stylesheet" type="text/css" href="assets/css/isotope.css" media="screen" />
        <link rel="stylesheet" href="assets/js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
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
                        <li class="active"><a href="album.jsp">Álbum</a></li>
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
                <h1>Contenido multimedia</h1>
                <p>Estas son algunas publicaciones de nuestros estudiantes más destacados en la institución entre otras más.</p>
            </div>
        </header>


        <!-- container -->
        <section class="container">
            <div class="row">
                <div class="col-md-12">
                    <section id="portfolio" class="page-section section appear clearfix">
                        <br />
                        <br />
                        <p>
                            Explora nuestras publicaciones destacadas que celebran a nuestros estudiantes más sobresalientes en la institución, así como diferentes tipos de eventos y publicidades.
                            <br />
                            <br />
                        </p>
                        <div class="row">
                            <nav id="filter" class="col-md-12 text-center">
                                <ul>
                                    <li><a href="#" class="current btn-theme btn-small" data-filter="*">Todos</a></li>
                                    <li><a href="#" class="btn-theme btn-small" data-filter=".postulantes">Postulantes a Universidades</a></li>
                                    <li><a href="#" class="btn-theme btn-small" data-filter=".publicidad">Publicidad</a></li>
                                    <li><a href="#" class="btn-theme btn-small" data-filter=".eventos">Eventos</a></li>
                                </ul>
                            </nav>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="portfolio-items isotopeWrapper clearfix" id="3">
                                        <article class="col-sm-4 isotopeItem publicidad">
                                            <div class="portfolio-item">
                                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid0bGDsKxZJESesS8TtFMT3Vf8tCnMkt9vQ5qCiYuXNUUm7BEHVJyaqF3MN1L8iSvLDl&width=360&show_text=false&height=360&appId" width="360" height="360" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
                                                <div class="portfolio-desc align-center">
                                                    <div class="folio-info">
                                                        <a href="https://www.facebook.com/photo/?fbid=940569921410914&set=a.452188586915719" class="fancybox">
                                                            <h5>Más información</h5>
                                                            <i class="fa fa-link fa-2x"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>

                                        <article class="col-sm-4 isotopeItem publicidad">
                                            <div class="portfolio-item">
                                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid02McSyxdUBxmrxYZJCWxRCQeFuPEJ3frdnRwdLrY7yWnkDLrndPH9cuSjfopyAL53Zl&width=360&show_text=false&height=360&appId" width="360" height="360" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                                                <div class="portfolio-desc align-center">
                                                    <div class="folio-info">
                                                        <a href="https://www.facebook.com/photo/?fbid=940097454791494&set=a.452188586915719" class="fancybox">
                                                            <h5>Más información</h5>
                                                            <i class="fa fa-link fa-2x"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>


                                        <article class="col-sm-4 isotopeItem eventos">
                                            <div class="portfolio-item">
                                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid02i3pDV9iteXA9W81Xeof3x51i6frzueb1Uq7LVe6gHbKFBs1YbHTsJtQqd88ViSTVl&width=360&show_text=false&height=378&appId" width="360" height="378" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                                                <div class="portfolio-desc align-center">
                                                    <div class="folio-info">
                                                        <a href="https://www.facebook.com/photo/?fbid=932694628865110&set=a.452188586915719" class="fancybox">
                                                            <h5>Más información</h5>
                                                            <i class="fa fa-link fa-2x"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>

                                        <article class="col-sm-4 isotopeItem postulantes">
                                            <div class="portfolio-item">
                                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid0CVmCQGRBUZwYMcHKKsXcAVvrWuQXxa3pRgdLcgd3Dorso1gvVbXZ8YefsLKj39nnl&width=360&show_text=false&height=289&appId" width="360" height="289" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                                                <div class="portfolio-desc align-center">
                                                    <div class="folio-info">
                                                        <a href="https://www.facebook.com/photo/?fbid=928025662665340&set=a.452188586915719" class="fancybox">
                                                            <h5>Más información</h5>
                                                            <i class="fa fa-link fa-2x"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>

                                        <article class="col-sm-4 isotopeItem postulantes">
                                            <div class="portfolio-item">
                                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid036Q2fzcfwTqDjfuTkxqUqP3LEq2bdyL2tGkXcDJyKyiVAzTRz7ErwLDuMS4DZW7vgl&width=360&show_text=false&height=366&appId" width="360" height="366" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                                                <div class="portfolio-desc align-center">
                                                    <div class="folio-info">
                                                        <a href="https://www.facebook.com/photo/?fbid=918693256931914&set=a.452188586915719" class="fancybox">
                                                            <h5>Más información</h5>
                                                            <i class="fa fa-link fa-2x"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>

                                        <article class="col-sm-4 isotopeItem eventos">
                                            <div class="portfolio-item">
                                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid02dPdSRkWTrnjiGwZ5iaKLrVH4g44sWXk3LouLXrMZLAG1MkcPi15xRUUX2FRJJvTYl&width=360&show_text=false&height=359&appId" width="360" height="359" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe><div class="portfolio-desc align-center">
                                                    <div class="folio-info">
                                                        <a href="https://www.facebook.com/photo/?fbid=917885843679322&set=a.452188586915719" class="fancybox">
                                                            <h5>Más información</h5>
                                                            <i class="fa fa-link fa-2x"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>

                                        <article class="col-sm-4 isotopeItem postulantes">
                                            <div class="portfolio-item">
                                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid038Hts6VwDQPvX1s7CCiHcMGjR7DxhKBaaFRisue6QT9NUtNS5hSSmZXeRXWkY9N4Kl&width=360&show_text=false&height=360&appId" width="360" height="360" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                                                <div class="portfolio-desc align-center">
                                                    <div class="folio-info">
                                                        <a href="https://www.facebook.com/photo/?fbid=903614408439799&set=a.452188586915719" class="fancybox">
                                                            <h5>Más información</h5>
                                                            <i class="fa fa-link fa-2x"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>

                                        <article class="col-sm-4 isotopeItem postulantes">
                                            <div class="portfolio-item">
                                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid029NUTnKaSUGrbcsrGBhmnm6rMVBTuwqcDZdonQfzaWdPZyDQAJAcp9sDZV9xNbmXml&width=360&show_text=false&height=360&appId" width="360" height="360" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                                                <div class="portfolio-desc align-center">
                                                    <div class="folio-info">
                                                        <a href="https://www.facebook.com/photo/?fbid=880283154106258&set=a.452188586915719" class="fancybox">
                                                            <h5>Más información</h5>
                                                            <i class="fa fa-link fa-2x"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>



                                        <article class="col-sm-4 isotopeItem postulantes">
                                            <div class="portfolio-item">
                                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid0SMzDgRCqWSEY8z2jLc4YMfvPSL3fa9BJWNsR47DSikhXH1zxYw8xX3AA8B5Fceipl&width=360&show_text=false&height=360&appId" width="360" height="360" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                                                <div class="portfolio-desc align-center">
                                                    <div class="folio-info">
                                                        <a href="https://www.facebook.com/photo/?fbid=824072639727310&set=a.452188586915719" class="fancybox">
                                                            <h5>Más información</h5>
                                                            <i class="fa fa-link fa-2x"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>

                                        <article class="col-sm-4 isotopeItem postulantes">
                                            <div class="portfolio-item">
                                                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FColegioAlfaTumbes%2Fposts%2Fpfbid0pXwGCqD54U8rNKADu3c6L3KqXvUpSTv9nrX2CKY3NaENRSY24RtAGjDmDTX4xhVhl&width=360&show_text=false&height=360&appId" width="360" height="360" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>                                                <div class="portfolio-desc align-center">
                                                    <div class="folio-info">
                                                        <a href="https://www.facebook.com/photo/?fbid=880273710773869&set=a.452188586915719" class="fancybox">
                                                            <h5>Más información</h5>
                                                            <i class="fa fa-link fa-2x"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
        </section>
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
        <script src="assets/js/jquery.cslider.js"></script>
        <script src="assets/js/jquery.isotope.min.js"></script>
        <script src="assets/js/fancybox/jquery.fancybox.pack.js" type="text/javascript"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>
