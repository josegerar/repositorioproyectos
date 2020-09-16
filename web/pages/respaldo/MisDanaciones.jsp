<%-- 
    Document   : MisDonaciones
    Created on : 20-ene-2020, 22:00:40
    Author     : cris_
    Donaciones que se ha realizado
--%>

<%@page import="org.DAO.ConexionMySQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="org.DAO.ConexionMySQL"%>
<!DOCTYPE html>
<html>
    <head>
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
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <!--datatables-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.18/datatables.min.css" />
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.18/datatables.min.js"></script>
        <script type="text/javascript" src="js/datatable.js"></script>
        <!--datatables--> 

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


    </head>
    <!--Valida usuario--> 
    <body <% ConexionMySQL con = new ConexionMySQL();
        HttpSession sesion = request.getSession(false);
        String usuario = String.valueOf(sesion.getAttribute("usuario"));
          String rol = String.valueOf(sesion.getAttribute("rol"));
        String id = String.valueOf(sesion.getAttribute("id"));
        if (sesion.getAttribute("usuario") != null) {

        } else {
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


        <div class="contenedor" style="margin-top: 100px;" >
            <div class="contenedor bcrumbSt" style="width: 80%;">
                <nav aria-label="breadcrumb" style="width: 100%;">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">Aprobación de Dataset</li>
                    </ol>
                </nav>

            </div>
            <p class="regisTitulo"> Mis Donaciones</p>


            <div class="IniContPrim">
                <div class="IniContSecDe">
                    <div class="iniContCab">
                    </div>
                    <hr class="hrInic">
                    <form action="InsertDonac" method="post">

                        <div class="IniContCardsBusq" id="contenedores"style="margin-bottom: 100px;">
                            <table id="example"  data-order='[[ 5, "asc" ]]' data-page-length='10' class="table table-sm table-striped table-hover table-bordered">
                                <thead class="thead-dark">
                                    <tr>
                                        <th style="visibility: hidden" scope="col">ID</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Resumen</th>
                                        <th scope="col">Tarea</th>
                                        <th scope="col">Tipo de Datos</th>
                                        <th scope="col">Estado</th>

                                        <th scope="col">Observación</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!--Muestra en una tabla todas mis donaciones--> 
                                    <%
                                        String query = "select idDonaciones,nombreConjuntoDatos,abstracto,tarea,tipoDatos,validacion,archivoDatos,observacion from donaciones where   Usuario_idUsuario ='" + id + "';";
                                        ResultSet leer = con.select(query);
                                        while (leer.next()) {
                                    %>
                                    <tr>
                                        <td style="visibility: hidden" ><%= leer.getString("idDonaciones")%></td>
                                            <th scope="row"> <a class="nav-link" href="Donar.jsp?id=<%= leer.getString("idDonaciones")%>&us=<%=sesion.getAttribute("usuario")%>"><%= leer.getString("nombreConjuntoDatos")%></a></th>
                                        <td><%= leer.getString("abstracto")%></td>
                                        <td><%= leer.getString("tarea")%></td>
                                        <td><%= leer.getString("tipoDatos")%></td>
                                        <td><%= leer.getString("validacion")%></td>
                                        <td><%= leer.getString("observacion")%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>

                        </div>
                    </form>
                </div>
            </div>
            <!-- Footer -->
            <footer class="page-footer font-small blue" style="background: #5B5F61;position: fixed; left: 0; bottom: 0; width: 100%; color: white; text-align: center; z-index: 10000000">

                <!-- Copyright -->
                <div class="footer-copyright text-center py-3" style="margin: auto; color:#fff;" >© 2020 Copyright:
                    <a href="https://mdbootstrap.com/education/bootstrap/" style="margin: auto; color:#fff; " >Universidad Técnica Estatal de Quevedo</a>
                </div>
                <!-- Copyright -->

            </footer>
            <!-- Ventana modal para el inicio de sesión -->
            <div class="overlay" id="overlay">
                <div class="popup" id="popup">
                    <a id="btn-cerrar-popup" class="btn-cerrar-popup">X</a>
                    <h3>INICIO DE SESIÓN</h3>
                    <form id="form1">
                        <div class="contenedor-inputs">
                            <input id="usuario" name="usuario" type="text" placeholder="Nombre de Usuario" required minlength="2" maxlength="20" >
                            <input id="clave" name="clave" type="password" placeholder="Contraseña" required minlength="3" maxlength="25" >
                        </div>
                        <input  type="button" id="submit" class="btn-submit" value="Ingresar">
                    </form>
                    <br/>
                    <div id="result1" style="color: red" ></div>
                    <br/>
                    <a href="#" class="txt3">Registrate Ahora</a>
                </div>
            </div>   
        </div>
        <script>
            function PasarD() {
                document.getElementById("btnAV").value = 1;
                Gcond = "Aprovados";
                var condicion = "Aprovados";
                var filtro = "4";
                var pag = document.getElementById("btnAV").value;
                var ban = "ban";
                $.ajax({
                    type: "POST",
                    url: "Donar.jsp",
                    data: {condicion: condicion, filtro: filtro, pagi: pag, ban: ban},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
        </script>
        <script>
            document.getElementById("ta").addEventListener("keypress", verificar);
            function verificar(e) {

                // comprovamos con una expresion regular que el caracter pulsado sea
                // una letra, numero o un espacio
                if (e.key.match(/[a-z0-9ñçáéíóú\s]/i) === null) {
                    // Si la tecla pulsada no es la correcta, eliminado la pulsación
                    e.preventDefault();
                }
            }
        </script>    
        <!-- ajax -->
        <script>

            function alerta()
            {
                var opcion = confirm("Esta seguro que desea publicar el conjunto de datos seleccionado.");
                if (opcion == true) {
                    return true;
                } else {
                    return false;
                }
            }

            function alertaR()
            {
                var opcion = confirm("Esta seguro que desea eliminar este conjunto de datos.");
                if (opcion == true) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
        <script>
            $(document).ready(function () {
                $('#submit').click(function (event) {
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
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
