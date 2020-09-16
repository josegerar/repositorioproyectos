<%-- 
    Document   : GenerarDatos
    Created on : 08-feb-2020, 17:04:06
    Author     : cris_
FORMULARIO PARA GENERAR DATOS SINTETICOS POR MEDIO DE UN SERVLET 
--%>

<%@page import="org.DAO.ConexionMySQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generar Datos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link href="css/util.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilos_rep.css" rel="stylesheet" type="text/css" />
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <script src="js/dinamico.js" type="text/javascript"></script>
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="js/popup.js" type="text/javascript"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/estylless.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    </head>
    <%-- VALIDA INGRESO DEL USUARIO--%>
    <body<% ConexionMySQL con = new ConexionMySQL();
            HttpSession sesion = request.getSession(false);
            String usuario = String.valueOf(sesion.getAttribute("usuario"));
              String rol = String.valueOf(sesion.getAttribute("rol"));
            if(sesion.getAttribute("usuario") != null){
              
            }else{
                  response.sendRedirect("Repo.jsp");
            }
    %>>
       
    <nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark " style="background:#225499; margin-top: 0px; position: fixed; top: 0; width: 100%; z-index: 10000000000;">
                <a class="navbar-brand" href="#">REPOSITORIO</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-targ
                        et="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Repo.jsp">
                                <i class="fa fa-home"></i>
                                Inicio

                            </a>
                        </li>



                        <% if (sesion.getAttribute("usuario") != null) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="RegistroUsuario.jsp">
                                <i class="fa fa-user-o" id="userli"></i>
                                Mi Perfil

                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AcuerdoDonacion.jsp">
                                <i class="fa fa-gift">
                                </i>
                                Donar
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MisDanaciones.jsp">
                                <i class="fa fa-database">

                                </i>
                                Mis Donaciones
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="GenerarDatos.jsp">
                                <i class="fa fa-table">

                                </i>
                                Generar Datos
                            </a>
                        </li>
                        <%}%>

                        <% if (rol.equals("1")) { %>
                        <li class="nav-item">
                            <a class="nav-link " href="Aprobacion.jsp"><i class="fa fa-envelope-o"></i>Solicitudes</a>
                        </li>
                        <%}%>

                    </ul>
                    <div style="position: fixed; top: 8px; right:  10px;"  class=" justify-content-end " >
                        <ul class="navbar-nav  justify-content-end " >
                            <li class="nav-item">
                                <% if (sesion.getAttribute("usuario") != null) {%>
                                <a class="nav-link"  id="user" > <i class="fa fa-user"></i><%=sesion.getAttribute("usuario")%></a>
                                    <%} else {%>
                                <a class="nav-link" href="RegistroUsuario.jsp"> <i class="fa fa-user"></i>Registrarse</a>
                                <%}%>
                            </li>
                            <li class="nav-item">
                                <% if (sesion.getAttribute("usuario") != null) { %>
                                <a class="nav-link" id="btncerrarsesion" > <i class="fa fa-sign-in"> </i>Cerrar Sesión</a>
                                <%} else {%>                        
                                <a class="nav-link"  id="btn-abrir-popup"  > <i class="fa fa-sign-in"> </i>Iniciar Sesión</a>
                                <%}%>   
                            </li>
                        </ul>
                    </div>


                </div>
            </nav>

        <%-- ENVIO DE RUTA , APROXIMACION Y LAS VARIABLES CATEGORICAS PARA EL SERVLET --%>
        <div style="width: 60%; margin-top: 140px;">
            <form action="SubirArchGener" enctype="multipart/form-data"  method="post"  >

                <div  style="position: fixed;top: 0; margin-top: 82px; width: 60%;margin-left: 20%; z-index: 10000000; background: #fff; ">
                    <nav aria-label="breadcrumb" style="margin-top: 40px; width: 90%; margin-left: 5%;">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">Inicio</li>
                        </ol>
                    </nav>
                    <div style="margin: auto; text-align: center; margin-top: 100px; margin-bottom: 50px;   ">
                        <img src="img/csv-file-icon-52.png" style="margin: auto; text-align: center;"  height="200" width="200">
                        <h3 style="text-align: center; margin-top: 40px; margin-bottom: 20px;">Cargar Archivo .CSV</h3>
                    </div>
                    <div class="custom-file"  style="width: 80%; margin-left: 10%;">
                        <input type="file" class="custom-file-input" onpaste="return false" required="true" id="inputGroupFile01" name="file1" accept=".csv">
                        <label class="custom-file-label" for="inputGroupFile01">Archivo de datos</label>

                    </div>
                    <div class="input-group mb-3"  style="width: 80%; margin-left: 10%; margin-top: 30px;">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 250px; ">Variable(s) de clase(s)</span>
                        </div>
                        <input type="text"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" id="txtVariables"   name="txtVariables" onkeypress="return SoloLetras(event)" onpaste="return false" />
                    </div>
                    <div class="input-group mb-3"  style="width: 80%; margin-left: 10%; margin-top: 30px;">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 250px; ">Candidad de registros estimados</span>
                        </div>
                        <input type="text"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" id="txtestimar"   name="txtestimar" onkeypress="return SoloLetras(event)" onpaste="return false" required="true" />
                    </div>
                    <div style="display: flex; justify-content: space-between; width: 80%; margin-left: 10%; margin-bottom: 100px; margin-top: 40px;">
                        <button type="submit" class="btn btn-primary btn-lg" style="width: 48%" name="btnGuardar">Guardar</button>
                        <button type="button" class="btn btn-secondary btn-lg" style="width: 48%">Cancelar</button>
                    </div>

                </div>
            </form>
        </div>
        <!-- Footer -->
        <footer class="page-footer font-small blue" style="background: #5B5F61;position: fixed; left: 0; bottom: 0; width: 100%; color: white; text-align: center; z-index: 10000000">

            <!-- Copyright -->
            <div class="footer-copyright text-center py-3" style="margin: auto; color:#fff;" >© 2020 Copyright:
                <a href="https://mdbootstrap.com/education/bootstrap/" style="margin: auto; color:#fff; " >Universidad Técnica Estatal de Quevedo</a>
            </div>
            <!-- Copyright -->

        </footer>
        <!-- Footer -->
    </body>
    <!--Modal Login  -->
    <div class="overlay" id="overlay" style="z-index: 100000000000">
        <div class="popup" id="popup">
            <a id="btn-cerrar-popup" class="btn-cerrar-popup">X</a>
            <h3>INICIO DE SESIÓN</h3>
            <form id="form1">
                <div class="contenedor-inputs">
                    <input id="usuario" name="usuario" type="text" placeholder="Nombre de Usuario"  required minlength="3" maxlength="20" />
                    <input id="clave" name="clave" type="password" placeholder="Contraseña"  required minlength="3" maxlength="25" />
                </div>
                <input  type="button" id="envia" class="btn-submit" value="Ingresar">
            </form>
            <br/>
            <div id="result1" style="color: red" ></div>
            <br/>
            <a href="RegistroUsuario.jsp" class="txt3">Registrate Ahora</a>
        </div>
    </div>
    <!--fin-->
    <!-- ajax VALIDAR USUARIO -->
    <script>
        $(document).ready(function () {
            $('#envia').click(function (event) {
                var usuarioVar = $('#usuario').val();
                var claveVar = $('#clave').val();
                // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
                $.ajax({
                    type: "POST",
                    url: "LogUsuario",
                    data: {
                        usuario: usuarioVar,
                        clave: claveVar
                    },
                    success: function (result) {
                        var resultado = result;
                        if (resultado == 1) {
                            overlay.classList.remove('active');
                            popup.classList.remove('active');
                            location.reload(true);

                        }
                        ;
                        $("#result1").html(result);
                    }
                });
                document.getElementById("clave").value = "";
            });

        });
    </script>
    <!--Cerrar Sesion-->
    <script>
        $(document).ready(function () {
            $('#btncerrarsesion').click(function (event) {
                var usuarioVar = $('#usuario').val();
                $.ajax({
                    type: "POST",
                    url: "CerrarSesion",
                    data: {
                        usuario: usuarioVar
                    },
                    success: function (result) {
                        location.reload(true);
                    }
                });
            });

        });
    </script>
    <script>
        var btnAbrirPopup = document.getElementById("btn-abrir-popup"),
                overlay = document.getElementById('overlay'),
                popup = document.getElementById('popup'),
                btnCerrarPopup = document.getElementById('btn-cerrar-popup');

        btnAbrirPopup.addEventListener('click', function () {
            overlay.classList.add('active');
            popup.classList.add('active');
        });

        btnCerrarPopup.addEventListener('click', function () {
            overlay.classList.remove('active');
            popup.classList.remove('active');
            location.reload(true);
        });

    </script>

</html>
