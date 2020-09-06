<%-- 
    Document   : DetalleCD
    Created on : 14-ene-2020, 1:09:24
    Author     : cris_
--%>

<%@page import="org.DAO.ConexionMySQL"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    </head>
    <body <%
        HttpSession sesion = request.getSession(false);
        String usuario = String.valueOf(sesion.getAttribute("usuario"));
        String rol = String.valueOf(sesion.getAttribute("rol"));

        %>>
        <%-- Carga la informacion del dataset seleccionado para mostrarla en cada campo--%>
        <%            Connection con = ConexionMySQL.getConnectionE();

            PreparedStatement ps;
            ResultSet rs;
            int id = Integer.parseInt(request.getParameter("id"));
            int insta = 0, numAtr = 0, NumVis = 0, FechaD = 0, IdDon = 0;
            String nom = "", abstra = "", caract = "", zona = "", docRel = "", solicCita = "", carAtr = "", Tarea = "", Na = "", Fuente = "", InfAtr = "", InfCD = "", NombArc = "";
            ps = con.prepareStatement("Select * from Donaciones where idDonaciones=" + id);
            rs = ps.executeQuery();
            while (rs.next()) {
                IdDon = rs.getInt("IdDonaciones");
                nom = rs.getString("nombreConjuntoDatos");
                abstra = rs.getString("abstracto");
                insta = rs.getInt("numeroInstancia");
                numAtr = rs.getInt("numeroAtributos");
                NumVis = rs.getInt("numeroVisitas");
                caract = rs.getString("tipoDatos");
                zona = rs.getString("zona");
                carAtr = rs.getString("tipoAtributo");
                FechaD = rs.getInt("anio");
                Tarea = rs.getString("tarea");
                Na = rs.getString("valoresFaltantes");
                Fuente = rs.getString("fuente");
                InfAtr = rs.getString("infoRelevante");
                InfCD = rs.getString("infoAtributo");
                docRel = rs.getString("documentoRelevantes");
                solicCita = rs.getString("solicitudesCitacion");
                NombArc = rs.getString("archivoDatos");
            }

            ConexionMySQL Con2 = new ConexionMySQL();
            Boolean nvisitas = Con2.accion("update donaciones set numeroVisitas='" + String.valueOf(NumVis + 1) + "' where idDonaciones='" + IdDon + "';");

        %>

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


                    <%-- Si es usuario es administrador se muestra esto --%>
                    <% if (usuario.equals("suanny") || usuario.equals("SUANNY")) { %>
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
                        <a class="nav-link" href="GenerarDatos.jsp">
                            <i class="fa fa-database">

                            </i>
                            Mis Donaciones
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MisDanaciones.jsp">
                            <i class="fa fa-table">

                            </i>
                            Generar Datos
                        </a>
                    </li>
                    <%}%>

                    <% if (usuario.equals("suanny") || usuario.equals("SUANNY")) { %>
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

        <div class="contenedor bcrumbSt" style="margin-top: 100px;">

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page"><a href="Repo.jsp">Inicio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Detalle</li>
                </ol>
            </nav>


            <form action="" method="post" style=" margin-bottom: 100px;" >
                <div style="display: flex; flex-wrap: wrap; font-size: 30px; font-weight: 700; text-transform: uppercase;">
                    <p style="margin-right: 7px;">Descargar el conjunto de Datos</p>
                    <label name="txtNombres"><%= nom%></label>
                </div>
                <div >
                    <%
                    if (sesion.getAttribute("usuario") != null) {%>
                    <a class="page-link" style="margin-bottom: 5px;" href="<%=NombArc%>">Descargar</a>
                    <% } else {%>
                    <a class="page-link" style="margin-bottom: 5px;" href="">Descargar</a>

                    <% }
                    %>
                </div>
                <div>
                    <p class="iniCabTitulo" style="text-align: justify;">Resumen:</p>
                    <label name="txtNombres" style="text-align: justify; margin-bottom: 20px;" ><%= abstra%></label>
                </div>

                <div>


                    <table id="myTable" class="table" style="width: 100%;">

                        <tbody>

                            <tr>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Características del conjunto de datos:   </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"> <%= caract%> </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; "> Número de instancias:  </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; ">  <%= insta%></td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Zona: </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; "><%= zona%> </td>
                            </tr>

                            <tr>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF;font-weight: 600;  ">Características del atributo:  </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"> <%= carAtr%> </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; "> Número de atributos: </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; "> <%= numAtr%></td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF;font-weight: 600;  ">Año de recopilación </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; "> <%= FechaD%></td>
                            </tr>

                            <tr>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Tareas asociadas:  </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"> <%= Tarea%> </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; "> ¿Valores faltantes?</td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; "> <%= Na%> </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Número de visitas web: </td>
                                <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; "> <%= NumVis%></td>
                            </tr>

                        </tbody>


                    </table>
                </div>
                <div>
                    <p class="iniCabTitulo">Fuente:</p>
                    <label style="text-align: justify;margin-bottom: 20px;" ><%= Fuente%></label>
                </div>
                <div>
                    <p class="iniCabTitulo">Información del conjunto de datos:</p>
                    <label  style="text-align: justify; margin-bottom: 20px;"><%= InfAtr%></label>
                </div>
                <div>
                    <p class="iniCabTitulo">Información del atributo:</p>
                    <label style="text-align: justify; margin-bottom: 20px;" ><%= InfCD%></label>
                </div>
                <div>
                    <p class="iniCabTitulo">Documentos relevantes:</p>
                    <label  style="text-align: justify; margin-bottom: 20px;"><%= docRel%></label>
                </div>

            </form>   

        </div>
        <!-- Footer -->
        <footer class="page-footer font-small blue" style="background: #5B5F61;position: fixed; left: 0; bottom: 0; width: 100%; color: white; text-align: center; z-index: 10000000;">

            <!-- Copyright -->
            <div class="footer-copyright text-center py-3" style="margin: auto; color:#fff;" >© 2020 Copyright:
                <a href="https://mdbootstrap.com/education/bootstrap/" style="margin: auto; color:#fff; " >Universidad Técnica Estatal de Quevedo</a>
            </div>
            <!-- Copyright -->

        </footer>
        <!-- Footer -->
    </body>
    <!--Modal Login  method="post"-->
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
    <!-- ajax para llamar a los servlets -->
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
    <!--Cerrar Sesion usuario-->
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

