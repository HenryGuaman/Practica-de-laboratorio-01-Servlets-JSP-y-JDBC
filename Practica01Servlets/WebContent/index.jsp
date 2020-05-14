
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Index</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/e564244708.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
 		<link rel="stylesheet" href="estilos/css/styles.css">
         <!-- Site Icons -->
	    <link rel="shortcut icon" href="#" type="image/x-icon" />
	    <link rel="apple-touch-icon" href="#" />
	
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="plantillas/css/bootstrap.min.css">
	    <!-- Pogo Slider CSS -->
	    <link rel="stylesheet" href="plantillas/css/pogo-slider.min.css">
	    <!-- Site CSS -->
	    <link rel="stylesheet" href="plantillas/css/style.css">
	    <!-- Responsive CSS -->
	    <link rel="stylesheet" href="plantillas/css/responsive.css">
	    <!-- Custom CSS -->
	    <link rel="stylesheet" href="plantillas/css/custom.css">
	
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->

        
    </head>
    <body id="home" data-spy="scroll" data-target="#navbar-wd" data-offset="98">
        <c:set var = "userId" value = "${sessionScope['userID']}" />
		 <!-- Start header -->
    <header class="top-header">
        <nav class="navbar header-nav navbar-expand-lg">
            <div class="container-fluid">
            <li><a class="nav-link" href="/Practica01Servlets">Mi Agenda Telefonica</a></li>
                <input type="text" placeholder="Buscar..." name="usuario">
                 <input type="submit"  value="Buscar">
                <span></span>
                    <span></span>
                    <span></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
                    <ul class="navbar-nav">
                      
                        <li><a class="nav-link" href="registro">Registro</a></li>
                        <li><a class="nav-link active" style="background:#fff;color:#000;" href="login">Iniciar Sesion</a></li>
                    </ul>
                </div>
                
            </div>
        </nav>
    </header>
    <!-- End header -->
       <!-- section -->
    <div class="section layout_padding">
        <div class="container">
            <div class="row">
                

                <div class="col-lg-4 col-md-4 col-sm-12">
                    <div class="full">
                        <div class="center">
                            <img src="plantillas/images/descarga.jpg" alt="#" />
                        </div>
                        <div class="center">
                            <h4>Tus contactos de forma segura</h4>
                        </div>
                    </div>
                </div>

                <div class="col-lg-10 offset-lg-1 margin-top_30">
                    <div class="full text_align_center">
                    	<h1>Guarda tus Contactos Aqui</span></h1>
						<p>Somos tu compañero de recuerdos.</p>
                    	<p>Guarda tus contactos de forma segura e ilimitada!</p>
                    
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- end section -->
      
        <!-- Start Footer -->
    <footer class="footer-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="logo">
                        
                    </div>
                </div>
                <div class="col-lg-12 white_fonts">
                    <h4 class="text-align">Contactanos</h4>
                </div>
                
            
            </div>
            <div class="row white_fonts margin-top_30">
                <div class="col-lg-12">
                    <div class="full">
                        <div class="center">
                            <ul class="social_icon">
                                <li><a href="href="https://www.facebook.com/henry.guaman.338" target="_BLANK""><i class="fa fa-facebook-f"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <p>&COPY; 2020 Todos los derechos reservados | Realizado por Henry Guaman</p>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer -->
        
        
    </body>
</html>


