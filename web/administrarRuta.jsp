<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.Usuario;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ride Ciencias</title>
        
        <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css"/>
        <!-- Custom Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css" type="text/css"/>

        <!-- Plugin CSS -->
        <link rel="stylesheet" href="resources/css/animate.min.css" type="text/css"/>
        
        <!-- Custom CSS -->
        <link rel="stylesheet" href="resources/css/creative.css" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />
        <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="resources/css/paginaUsuarioStyle.css" type="text/css"/>
        <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css"/>
        <script src="http://maps.google.com/maps/api/js"></script>
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-ui.min.js"></script>
        
        <script>
            
            function ask() {
                var res = confirm('Estas seguro de eliminar este viaje??');
                return res;
            }
            
            $(function() {
                
                $('#dialog-form').dialog({
                    autoOpen: false,
                    maxWidth:540,
                    maxHeight: 500,
                    width: 500,
                    height: 540,
                    modal: true,
                    buttons: {
                        "Actualizar": function() {
                            //$(this).dialog("close");
                            $('#submit').click();
                        },
                        Cancel: function() {
                            $(this).dialog("close");
                        }
                    }
                });
                
                $('#publica').click( function () {
                    $('#dialog-form').dialog("open");
                });
                
                $('#viaje-aceptar').dialog( {
                    autoOpen: false,
                    maxWidth:200,
                    maxHeight: 200,
                    width: 600,
                    height: 500,
                    modal: true,
                    buttons: {
                        "Tomar Viaje": function() {
                            //$(this).dialog("close");
                            $('#submit').click();
                        },
                        Cancel: function() {
                            $(this).dialog("close");
                        }
                    }
                });
                
               
                
                $('#salir').click( function() {
                    $('#submit-salir').click();
                });
                
                $('#editar').click( function (e) {
                    e.preventDefault();
                    $('#dialog-form').dialog('open');
                });
            });
        </script>
        <style>
            .ui-dialog .ui-dialog-buttonpane { 
                text-align: center;
            }
            .ui-dialog .ui-dialog-buttonpane .ui-dialog-buttonset { 
                float: none;
            }
            
            .container:hover {
                cursor: auto;
            }
        </style>
    </head>
    <body>
        <% 
            Usuario user = (Usuario) session.getAttribute("usuario");
            if (user == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("location='entrar.jsp';");
                out.println("</script>");
            }
        %>
        <nav id="mainNav" >
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand page-scroll" href="paginaUsuario.jsp">RideCiencias</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a class="page-scroll" href="#about" id="publica"> Publica Viaje</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="editarPerfil.jsp"> Editar Perfil </a>
                        </li>
                        <li>
                            <a class="page-scroll" href="administrarRuta.xhtml"> Administrar Rutas </a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#" id="salir"> Salir </a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <header>
            <h2>Proximos Viajes</h2>
            <form onsubmit="return ask();" action="eliminaViaje_proceso.jsp">
                <div class="container">
                    <div class="col3">
                        <img src="resources/img/map.jpg" alt="" style="height: 160px; width: 220px;">
                    </div>
                    <div class="col2">
                        <h3>13:00 quedan 2 hrs.</h3>
                        <h4>Metro C.U - Neza</h4>
                        <h4>2 asientos disponibles</h4>
                        <input type="submit" value="Eliminar Viaje" class="eliminar">
                        <button id="editar" >Editar Viaje</button>
                    </div>

                    <div class="col4">
                        <h3>2 asientos disponibles</h3>
                    </div>
                    <input type="hidden" class="viajeId" name="containerId" value="1">
                </div>
            </form>
            
            <div id="dialog-form" title="Publica Viaje">
                <p class="validateTips">Todos los campos son requeridos</p>

                <form method="POST" action="editarViaje_proceso.jsp">
                  <fieldset>
                    <label for="destino">Destino</label>
                    <input type="text" name="destino" id="destino" >
                    <label for="salida">Salida</label>
                    <input type="text" name="salida" id="salida" ><br><br>
                    <img src="resources/img/map.jpg" alt="" style="height: 200px; width: 400px;"> <br><br>
                    <label for="horas minutos">Hora</label>
                    <input type="text" name="horas" id="horas" style="width: 50px">:
                    <input type="text" name="minutos" id="minutos"  style="width: 50px"><br>
                    <label for="fecha">Fecha</label>
                    <input type="text" name="fecha" id="fecha"><br>
                    <label for="cupo">Cupo</label>
                    <input type="text" name="cupo" id="cupo"  style="width: 50px"> <br>
                    <label for="precio">Precio por asiento ($)</label>
                    <input type="text" name="precio" id="precio"  style="width: 50px">
                    <input id="idViaje" name="idViaje" type="text"  value="1" style="display:none;">
                    <!-- Allow form submission with keyboard without duplicating the dialog button -->
                    <input  type="submit" id="submit" value="Test" >
                  </fieldset>
                    
                </form>
              </div>
            
            <div id="viaje-aceptar" title="Tomar este viaje">
                <p class="validateTips">¿Quieres tomar este viaje?</p> <br>
                <img src="resources/img/map.jpg" alt="" style="height: 300px;">
                
                <form method="POST" action="aceptaViaje_proceso.jsp">
                  <fieldset>
                    <input id="showId" type="hidden"  name="viajeId">
                    <!-- Allow form submission with keyboard without duplicating the dialog button -->
                    <input id="submit-viaje" type="submit" tabindex="-1" value="LOL" style="display:none;">
                  </fieldset>
                    
                </form>
              </div>
              
            <div style="display:none;">  
                
                <form method="POST" action="salir_proceso.jsp">
                  <fieldset>
                    <input id="submit-salir" type="submit" tabindex="-1" style="display:none;">
                  </fieldset>
                    
                </form>
              </div>
            
        </header>
    </body>
</html>
