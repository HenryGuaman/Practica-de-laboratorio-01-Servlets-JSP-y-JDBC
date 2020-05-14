

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/e564244708.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="public/css/styles.css">
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
        <c:set var = "users" value = "${requestScope['users']}" />
        <c:set var = "userId" value = "${sessionScope['userID']}" />
        
        <header class="top-header">
	        <nav class="navbar header-nav navbar-expand-lg">
	            <div class="container-fluid">
	            <li><a class="nav-link" href="/Practica01Servlets">Mi Agenda Telefonica</a></li>
	                <form action="busqueda">
                            <div class="ui left icon action input">
                                <i class="users icon"></i>
                                <input type="text" placeholder="Buscar..." name="usuario">
                                <input type="submit"  value="Buscar">
                            </div>
                     </form>
	                <span></span>
	                    <span></span>
	                    <span></span>
	                </button>
	                <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
	                   
	                    <c:choose>
                        <c:when test="${userId == null}">
                            <div class="item">
                                <a href="registro" class="ui primary button">Registro</a>
                            </div>
                            <div class="item">
                                <a href="login" class="ui button">Iniciar Sesion</a> 
                            </div>
                        </c:when>    
                        <c:otherwise>
                            <div class="item">
                                <a href="my-agenda" class="ui primary button">Mi Cuenta</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
	                </div>
	                
	            </div>
	        </nav>
	    </header>
        
       <!-- section -->
			    <div class="section layout_padding">
			        <div class="container">
			            <div class="row">
			
			
			                <div class="col-lg-10 offset-lg-1 margin-top_30">
			                    <div class="full text_align_center">
			                    	<c:choose>
						                <c:when test="${users.size() > 0}">
						                    <table class="table table-hover">
						                        <thead>
						                            <tr>
						                                <th scope="col">Usuario</th>
						                                <th scope="col">Correo</th>
						                                <th scope="col">Numero de telefono</th>
						                                <th scope="col">Cedula</th>
						                            </tr>
						                        </thead>
						                        <tbody>
						                            <c:set var="i" value = "${0}"/>
						                            <c:forEach var="user" items="${users}">
						                                <c:set var="i" value = "${i+1}"/>
						                                <tr data-toggle="modal" data-target="#exampleModal${i}" data-whatever="@mdo">
						                                    <td>
						                                        <div class="ui middle aligned selection list">
						                                            <div class="item">
						                                                <img class="ui avatar image" src="plantillas/images/fondoper.jpg">
						                                                <div class="content">
						                                                    <div class="header">${user.nombre} ${user.apellido}</div>
						                                                </div>
						                                            </div>
						
						                                    </td>
						                                    <td>${user.correo}</td>
						                                    <td>${user.telefonos[0].numero}</td>
						                                    <td>${user.cedula}</td>
						                                </tr>
						
						                            <div class="modal fade" id="exampleModal${i}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						                                <div class="modal-dialog" role="document">
						                                    <div class="modal-content " style="width: 293px;">
						                                        <div class="ui card aling-self-center">
						                                            <div class="image">
						                                                <img class="ui avatar image" src="plantillas/images/fondoper.jpg">
						                                            </div>
						                                            <div class="content">
						                                                <div class="meta">
						                                                   <i ></i> <a href="mailto:${user.correo}"> ${user.correo}</a>
						                                                </div>
						                                                <div class="description">
						                                                    <c:choose>
						                                                        <c:when test="${user.telefonos.size() > 0}">
						                                                            <c:forEach var="telefono" items="${user.telefonos}">
						                                                                <p><i ></i> <a href="tel:${telefono.numero}">${telefono.numero}</a>  &#9679; ${telefono.tipo} &#9679; ${telefono.operadora}</p>
						                                                            </c:forEach>
						                                                        </c:when>    
						                                                        <c:otherwise>
						                                                            <p>Aun no hay numeros agregados.</p>
						                                                        </c:otherwise>
						                                                    </c:choose>
						                                                </div>
						                                            </div>
						                                            <div class="extra content">
						                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						                                            </div>
						                                        </div>
						                                    </div>
						                                </div>
						                            </div>
						
						                        </c:forEach>
						                        </tbody>
						                    </table>
						                </c:when>    
						                <c:otherwise>
						                    <h1>No hay contactos para esta busqueda</h1>
						                </c:otherwise>
						            </c:choose>
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
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    </body>
</html>
