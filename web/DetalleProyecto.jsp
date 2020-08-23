<%-- 
    Document   : DetalleProyecto
    Created on : 23-ago-2020, 12:40:44
    Author     : DANIELA
--%>

<%@page import="org.DAO.ConexionMySQL"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Proyecto</title>
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
    <body>
        <% 
            HttpSession sesion = request.getSession(false);
            String usuario = String.valueOf(sesion.getAttribute("usuario"));
            String rol = String.valueOf(sesion.getAttribute("rol"));
            
        %>
        
        <%-- Carga la informacion del proyecto seleccionado para mostrar mas detalle--%>
        <%
            //Connection con = ConexionMySQL.getConnectionE();
            PreparedStatement ps;
            ResultSet rs;
            //int id = Integer.parseInt(request.getParameter("id"));
            int insta = 0, numAtr = 0, NumVis = 0, FechaD = 0,IdDon=0;
            String nom = "", abstra = "", caract = "", zona = "", docRel = "", solicCita = "", carAtr = "", Tarea = "", Na = "", Fuente = "", InfAtr = "", InfCD = "", NombArc = "";
            //ps = con.prepareStatement("Select * from proyecto_integrador where id_proyecto=" + id);
            // rs = ps.executeQuery();
            
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
                        
                        <li class="nav-item">
                            <a class="nav-link" href="Proyectos.jsp">
                                <i class="fa fa-address-book"></i>
                                Proyectos
                            </a>
                        </li>
                       
                        <%-- Si ha iniciado sesion --%>
                        <% if (sesion.getAttribute("usuario") != null) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="AnadirProyectos.jsp">
                                <i class="fa fa-newspaper-o" aria-hidden="true"></i>
                                Añadir proyecto
                            </a>
                        </li>
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
                        
                        <%-- Si es usuario administrador --%>
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
        
        <div class="contenedor bcrumbSt" style="margin-top: 100px;">
        
            <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page"><a href="Repo.jsp">Inicio</a></li>
                <li class="breadcrumb-item active" aria-current="page"><a href="Proyectos.jsp">Proyectos</a></li>
                <li class="breadcrumb-item active" aria-current="page">Detalle</li>
            </ol>
        </nav>
            
            <form action="" method="post" style=" margin-bottom: 100px;" >
                <div style="display: flex; flex-wrap: wrap; font-size: 30px; font-weight: 700; text-transform: uppercase;">
                    <p style="margin-right: 7px;">Descargar proyecto</p>
                </div>
                <div >
                <%
                    if(sesion.getAttribute("usuario") != null){%>
                    <a class="page-link" style="margin-bottom: 5px;" href="#">Descargar</a>
                    <% }else{%>
                 <a class="page-link" style="margin-bottom: 5px;" href="">Descargar</a>
                    <% }
                %>
            </div>
            <div>
                <p class="iniCabTitulo" style="text-align: justify;">Título:</p>
                <label name="txtNombres" style="text-align: justify; margin-bottom: 20px;" ></label>
            </div>
            <%-- Tabla de Autores --%>
            <div>
                <p class="iniCabTitulo" style="text-align: justify;">Autores:</p>
                <table id="myTable" class="table" style="width: 100%;">
                    <tbody>
                        <tr>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Nombres</td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"></td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Apellidos</td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"></td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Email</td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div>
                <p class="iniCabTitulo">Coordinador:</p>
                <label style="text-align: justify;margin-bottom: 20px;" ></label>
            </div>
            <%-- Tabla de Modulo - Periodo --%>
            <div>
                <table id="myTable" class="table" style="width: 100%;">
                    <tbody>
                        <tr>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Módulo:</td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"></td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Periodo Lectivo:</td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"> </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div>
                <p class="iniCabTitulo" style="text-align: justify;">Resumen:</p>
                <label name="txtNombres" style="text-align: justify; margin-bottom: 20px;" ></label>
            </div>
            <div>
                <p class="iniCabTitulo" style="text-align: justify;">Objetivo:</p>
                <label name="txtNombres" style="text-align: justify; margin-bottom: 20px;" ></label>
            </div>
            <%-- Tabla de Variables --%>
            <div>
                <p class="iniCabTitulo" style="text-align: justify;">Variables:</p>
                <table id="myTable" class="table" style="width: 100%;">
                    <tbody>
                        <tr>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Variable:</td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"></td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Tipo:</td>
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"> </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </form>
            
        </div>
    </body>
</html>
