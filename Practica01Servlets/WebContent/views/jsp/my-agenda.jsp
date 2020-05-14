
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Mi cuenta</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/e564244708.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
        <c:set var = "user" value = "${requestScope['user']}" />
        
        <header class="top-header">
	        <nav class="navbar header-nav navbar-expand-lg">
	            <div class="container-fluid">
	            <li><a class="nav-link" href="/Practica01Servlets">Mi Agenda Telefonica</a></li>
	                <form action="busqueda">
                            <div class="ui left icon action input">
                                <i ></i>
                                <input type="text" placeholder="Buscar..." name="usuario">
                                <input type="submit" class="ui blue submit button" value="Buscar">
                            </div>
                        </form>
	                <span></span>
	                    <span></span>
	                    <span></span>
	                </button>
	                <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
	                    <ul class="navbar-nav">
	                      
	                        <a href="my-agenda?logout=true" class="ui button">Cerrar Sesion</a> 
	                    </ul>
	                    <button type="button" class="ui primary labeled icon button" data-toggle="modal" data-target="#modalInfo">
                            <i class="user icon"></i> Editar mis datos
                        </button>
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
		                    	<div class="ui mt-5"> 
					
					                <c:choose>
					                    <c:when test="${user.telefonos.size() > 0}">
					                        <h1>Telefonos Agregados</h1>
					
					                        <table class="ui compact celled definition table">
					                            <thead class="full-width">
					                                <tr>
					                                    <th>Id</th>
					                                    <th>Numero</th>
					                                    <th>Tipo</th>
					                                    <th>Operadora</th>
					                                    <th>Opciones</th>
					                                </tr>
					                            </thead>
					                            <tbody>
					
					                                <c:set var="i" value = "${0}"/>
					                                <c:forEach var="telefono" items="${user.telefonos}">
					                                    <c:set var="i" value = "${i+1}"/>
					                                    <tr>
					                                        <td>${i}</td> 
					                                        <td>${telefono.numero}</td>
					                                        <td>${telefono.tipo}</td>
					                                        <td>${telefono.operadora}</td>
					                                        <td>
					
					                                            <div class="modal fade" id="confirm-delete${i}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					                                                <div class="modal-dialog">
					                                                    <div class="modal-content">
					                                                        <div class="modal-header">
					                                                            <h5>Eliminar numero.</h5>
					                                                        </div>
					                                                        <div class="modal-body">
					                                                            <p>El número ${telefono.numero} se eliminara de tu agenda.</p>
					                                                        </div>
					                                                        <div class="modal-footer">
					                                                            <button type="button"  data-dismiss="modal">Cancelar</button>
					                                                            <a href="editar-telefono?delete=true&idTelefono=${telefono.id}" >Eliminar</a>
					                                                        </div>
					                                                    </div>
					                                                </div>
					
					                                            </div>
					
					                                            <div  data-toggle="modal" data-target="#confirm-delete${i}" >
					                                                <i ></i> Eliminar
					                                            </div>
					                                            <div  data-toggle="modal" data-target="#exampleModalCenter${i}">
					                                                <i ></i> Editar
					                                            </div>
					                                        </td>
					                                    </tr>
					                                    <!-- Modal -->
					                                <div class="modal fade" id="exampleModalCenter${i}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					                                    <div class="modal-dialog modal-dialog-centered" role="document">
					                                        <div class="modal-content">
					                                            <div class="modal-header">
					                                                <h5 class="modal-title" id="exampleModalCenterTitle">Numero: ${telefono.numero}</h5>
					                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                                                    <span aria-hidden="true">&times;</span>
					                                                </button>
					                                            </div>
					                                            <form action="editar-telefono" method="POST">
					                                                <input type="hidden" name="idtel" value="${telefono.id}" >
					                                                <div class="modal-body">
					                                                    <div class="form-group">
					                                                        <label for="numero">Numero</label>
					                                                        <input type="text" class="form-control" id="numero" name="numero" value="${telefono.numero}" required="" pattern="[0-9]+">
					                                                    </div>
					                                                    <div class="form-row">
					                                                        <div class="form-group col-md-6">
					                                                            <label for="tipo">Tipo</label>
					                                                            <input type="text" class="form-control" id="tipo" name="tipo" required="" placeholder="Movil" value="${telefono.tipo}">
					                                                        </div>
					                                                        <div class="form-group col-md-6">
					                                                            <label for="operadora">Operadora</label>
					                                                            <input type="text" class="form-control" id="operadora" name="operadora" required="" placeholder="Movistar" value="${telefono.operadora}">
					                                                        </div>
					                                                    </div>
					                                                </div>
					                                                <div class="modal-footer">
					                                                    <button type="button"  data-dismiss="modal">Cerrar</button>
					                                                    <button type="submit" >Guardar</button>
					                                                </div>
					                                            </form>
					                                        </div>
					                                    </div>
					                                </div>
					                            </c:forEach>
					
					                            </tbody>
					                            <tfoot class="full-width">
					                                <tr>
					                                    <th></th>
					                                    <th colspan="4">
					
					                                        <button type="button" data-toggle="modal" data-target="#exampleModalCenter">
					                                            <i ></i> Agregar telefono
					                                        </button>
					                                    </th>
					                                </tr>
					                            </tfoot>
					                        </table>
					
					                    </c:when>    
					                    <c:otherwise>
					                        <h2>No hay contactos aún agrega tu primer número.</h2>
					                        <button type="button"  data-toggle="modal" data-target="#exampleModalCenter">
					                            <i class="phone icon"></i> Agregar telefono
					                        </button>
					                    </c:otherwise>
					                </c:choose>
					            </div>
		                    
		                    </div>
		                </div>
		
		            </div>
		        </div>
		    </div>
		    <!-- end section -->

        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Agregar un telefono</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="agregar-telefono" method="POST">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="numero">Numero</label>
                                <input type="text" class="form-control" id="numero" name="numero" required="" placeholder="0987654321" pattern="[0-9]+">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="tipo">Tipo</label>
                                    <input type="text" class="form-control" id="tipo" name="tipo" required="" placeholder="Casa">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="operadora">Operadora</label>
                                    <input type="text" class="form-control" id="operadora" name="operadora" required="" placeholder="Sin Nombre">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button"  data-dismiss="modal">Cerrar</button>
                            <button type="submit" >Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="modalInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">${user.nombre} ${user.apellido}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="agregar-telefono" method="POST">
                        <div class="modal-body">

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" value="${user.nombre}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="apellido">Apellido</label>
                                    <input type="text" class="form-control" id="apellido" value="${user.apellido}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cedula">Cedula</label>
                                <input type="text" class="form-control" id="cedula" value="${user.cedula}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="correo">Correo</label>
                                <input type="email" class="form-control" id="correo" value="${user.correo}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="pass">Contraseña</label>
                                <input type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button"  data-dismiss="modal">Cerrar</button>
                            <button type="submit" >Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
                                <li><a href="https://www.facebook.com/henry.guaman.338" target="_BLANK""><i class="fa fa-facebook-f"></i></a></li>
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
        <script src="public/js/script.js"></script>
    </body>
</html>