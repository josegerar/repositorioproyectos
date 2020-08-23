<%-- 
    Document   : Proyectos
    Created on : 23-ago-2020, 10:40:41
    Author     : F
--%>
<%@page import="org.DAO.ConexionMySQL"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width" />
        <title>Proyectos</title>
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
    <!--Cuando el usuario no ha seleccionado ningun filtro se muestra todas los dataset--> 
    <body onload="sinFiltro()" >
        <div style="margin-bottom: 50px;">
            <!--Si esta logueado trae el nombre del usuario y el rol--> 
            <%

                ConexionMySQL con = new ConexionMySQL();
                HttpSession sesion = request.getSession(true);
                String usuario = String.valueOf(sesion.getAttribute("usuario"));
                String rol = String.valueOf(sesion.getAttribute("rol"));
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
                            <a class="nav-link" href="Repo.jsp">
                                <i class="fa fa-address-book" aria-hidden="true"></i>
                                Proyectos

                            </a>
                        </li>


                        <!--Validaciones de cada una de las paginas--> 
                        <% if (sesion.getAttribute("usuario") != null) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="Repo.jsp">
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

                        <% if (rol.equals("1")) { %>
                        <li class="nav-item">
                            <a class="nav-link " href="Aprobacion.jsp"><i class="fa fa-envelope-o"></i>Solicitudes</a>
                        </li>
                        <%}%>

                    </ul>
                </div>
            </nav>

            <div  style="position: fixed;top: 0; margin-top: 82px; width: 90%;margin-left: 5%; z-index: 10000000; background: #fff; ">
                <nav aria-label="breadcrumb" style="margin-top: 10px; width: 90%; margin-left: 5%;">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">Inicio</li>
                    </ol>
                </nav>


                <div class="iniContBusc"style="width: 90%; margin-left: 5%; box-shadow: 0 2px 2px -2px gray;">
                    <div class="iniContBuscIn">
                        <div style="width: 40px;">
                            <img src="iconos/icons8_Search_50px.png" class="iniContBuscInImg" alt="">
                        </div>
                        <div style="width: 95%;">
                            <input type="text" class="iniContBuscInText" id="txtBuscar" onkeyup="buscar()" placeholder="Escribe para buscar..">
                        </div>
                    </div>
                    <button type="button" class="btn  iniContBuscInBtn"  onclick="buscar()">
                        Buscar
                    </button>

                </div>
            </div>            
            <div class="contenedor bcrumbSt" style="margin-top: 220px; margin-bottom: 100px;">
                <form onload="sinFiltro()" >
                    <div class="IniContPrim">
                        <div class="IniContSecIz" style="background:  #fff;">
                            <p class="iniCabTitulo" style="text-transform: uppercase;">Filtrar por:</p>
                            <input type="button" class="page-link"  name="sinF" id="sFiltro" value="Mostrar todo" onclick="Aprobados()" style="width: 100%; text-align: left;">
                            <p class="iniCabTitulo2" style="font-size: 12px;margin-top: 5px; margin-bottom: 5px; font-weight: 600;">TAREA PREDETERMINADA</p>
                            <input type="button" class="page-link"  name="tarea" id="Clasification" value="Año" onclick="buscarC()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tarea" id="Regresion" value="Facultad" onclick="buscarReg()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tarea" id="Agrupacion" value="Carrera" onclick="buscarCla()" style="width: 100%; text-align: left;">

                        </div>
                        <div class="IniContSecDe">
                            <div class="iniContCab">
                                <p class="iniCabTitulo">REPOSITORIO</p>
                                <hr style="margin-top: -10px;">
                            </div>




                            <div class="IniContCardsBusq" id="contenedores">
                                <div class="container">



                                    <table id="myTable" class="table table-striped">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col">Titulo</th>
                                                <th scope="col">Modulo</th>
                                                <th scope="col">Fecha registro</th>
                                                <th scope="col">Objetivo</th>
                                                <th scope="col">Carrera</th>
                                                <th scope="col">Periodo lectivo</th>
                                            </tr>
                                        </thead>
                                        <tbody id="resultado">



                                        </tbody>
                                    </table>
                                    <div style="float: right;">    
                                        <!--Paginacion de la tabla--> 
                                        <input type="button"  value="<"name="btnatras" onclick="dec()" style="background: #2079C5; border: none; color: #fff; width: 40px; height: 35px; border-radius: 5px;" class="btn-default waves-effect waves-light">
                                        <input type="button" id="btnAV" name="paginaN" value="1" style="background: #F5F5F5; border: none; color: #666666; width: 40px; height: 35px; border-radius: 5px;" class=" waves-effect waves-light">
                                        <input type="button"  value=">" name="btnsig" onclick="ad()" style="background: #2079C5; border: none; color: #fff; width: 40px; height: 35px; border-radius: 5px;" class="btn-default waves-effect waves-light">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </form>            

            </div>



    </body>
</html>
