<%-- 
    Document   : Repo
    Created on : 20-ene-2020, 22:00:40
    Author     : cris_
    Pagina Principal del sistema
--%>

<%@page import="org.DAO.ConexionMySQL"%>
<%@page import="model.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="width=device-width" />
        <title>Repositorio</title>
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


                        <!--Validaciones de cada una de las paginas--> 
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




                <!--Tabla carga sin filtro muestra todos los dataset aprobados--> 
                <form onload="sinFiltro()" >
                    <div class="IniContPrim">
                        <div class="IniContSecIz" style="background:  #fff;">
                            <p class="iniCabTitulo" style="text-transform: uppercase;">Filtrar por:</p>
                            <input type="button" class="page-link"  name="sinF" id="sFiltro" value="Mostrar todo" onclick="Aprobados()" style="width: 100%; text-align: left;">
                            <p class="iniCabTitulo2" style="font-size: 12px;margin-top: 5px; margin-bottom: 5px; font-weight: 600;">TAREA PREDETERMINADA</p>
                            <input type="button" class="page-link"  name="tarea" id="Clasification" value="Clasificación" onclick="buscarC()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tarea" id="Regresion" value="Regresión" onclick="buscarReg()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tarea" id="Agrupacion" value="Agrupación" onclick="buscarCla()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tarea" id="Otros" value="Otros" onclick="tareaOtros()" style="width: 100%; text-align: left;">




                            <p class="iniCabTitulo2" style="font-size: 12px; margin-top: 5px; margin-bottom: 5px; font-weight: 600;">TIPO DE ATRIBUTO</p>
                            <input type="button" class="page-link"  name="tipoAtributo" id="Categorico" value="Categórico" onclick="tAtrCat()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tipoAtributo" id="Numerico" value="Numérico" onclick="tAtrNum()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tipoAtributo" id="Mixto" value="Mixto" onclick="tAtrMix()" style="width: 100%; text-align: left;">


                            <p class="iniCabTitulo2" style="font-size: 12px;margin-top: 5px; margin-bottom: 5px; font-weight: 600;">TIPO DE DATO</p>
                            <input type="button" class="page-link"  name="tipoDato" id="Multivariante" value="Multivariante" onclick="tDatMulti()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tipoDato" id="Univariante" value="Univariante" onclick="tDatUni()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tipoDato" id="Secuencial" value="Secuencial" onclick="tDatSec()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tipoDato" id="Seriestemporales" value="Series temporales" onclick="tDatSer()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tipoDato" id="Texto" value="Texto" onclick="tDatTex()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tipoDato" id="Teoríadeldominio" value="Teoría del dominio" onclick="tDatTeo()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="tipoDato" id="Otros" value="Otros" onclick="tDatOtro()" style="width: 100%; text-align: left;">         

                            <p class="iniCabTitulo2" style="font-size: 12px;margin-top: 5px; margin-bottom: 5px; font-weight: 600;">ZONA</p>
                            <input type="button" class="page-link"  name="zona" id="Cienciasdelavida" value="Ciencias de la vida" onclick="zonaCvid()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="zona" id="Cienciasfísicas" value="Ciencias físicas" onclick="zonaCfis()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="zona" id="CSIngeniería" value="CS / Ingeniería" onclick="zonaIng()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="zona" id="Cienciassociales" value="Ciencias sociales" onclick="zonaCS()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="zona" id="Negocios" value="Negocios" onclick="zonaNeg()" style="width: 100%; text-align: left;">

                            <p class="iniCabTitulo2" style="font-size: 12px;margin-top: 5px; margin-bottom: 5px; font-weight: 600;">ATRIBUTOS</p>
                            <input type="button" class="page-link"  name="ATRIBUTOS" id="M10" value="Menos de 10" onclick="MMe10()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="ATRIBUTOS" id="10100" value="10 a 100" onclick="Men10100()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="ATRIBUTOS" id="M100" value="Más de 100" onclick="MMa100()" style="width: 100%; text-align: left;">


                            <p class="iniCabTitulo2" style="font-size: 12px;margin-top: 5px; margin-bottom: 5px; font-weight: 600;">INSTANCIAS</p>
                            <input type="button" class="page-link"  name="INSTANCIAS" id="IM10" value="Menos de 10" onclick="IMe10()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="INSTANCIAS" id="I10100" value="10 a 100" onclick="Ien10100()" style="width: 100%; text-align: left;">
                            <input type="button" class="page-link"  name="INSTANCIAS" id="IM100" value="Más de 100" onclick="IMa100()" style="width: 100%; text-align: left;">



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
                                                <th scope="col">Name</th>
                                                <th scope="col">Tipo de Dato</th>
                                                <th scope="col">Tarea Predeterminada</th>
                                                <th scope="col">Tipo Atributo</th>
                                                <th scope="col"># de Instan cias</th>
                                                <th scope="col"># de atributos</th>
                                                <th scope="col">Año</th>
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
        <!--Modal Login  action="LogUsuario" method="post"-->
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
        <!-- ajax -->
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
            var Gcond;
            var Gfiltro;
            var Gpag;
            var nPag;
            var contarFilas;
            function dec() {
                var condicion = "";
                if (Gcond == "SinF")
                {
                    condicion = "SinF";
                } else {
                    condicion = Gcond;
                }
                if (parseInt(document.getElementById("btnAV").value) > 1) {
                    document.getElementById("btnAV").value = parseInt(document.getElementById("btnAV").value) - 1;

                    var filtro = Gfiltro;
                    var pag = document.getElementById("btnAV").value;
                    $.ajax({
                        type: "POST",
                        url: "BuscarServlet",
                        data: {condicion: condicion, filtro: filtro, pagi: pag},
                        success: function (responseText) {
                            $("#resultado").html(responseText);
                        }
                    });
                }
            }
            function doSearch()
            {



            }
            function ad() {
                var yea = myTable.rows.length;
                var condicion = "";
                if (Gcond == "SinF")
                {
                    condicion = "SinF";
                } else {
                    condicion = Gcond;
                }
                if (yea > 17) {


                    document.getElementById("btnAV").value = parseInt(document.getElementById("btnAV").value) + 1;

                    var filtro = Gfiltro;
                    var pag = document.getElementById("btnAV").value;
                    $.ajax({
                        type: "POST",
                        url: "BuscarServlet",
                        data: {condicion: condicion, filtro: filtro, pagi: pag},
                        success: function (responseText) {
                            $("#resultado").html(responseText);
                        }
                    });
                }


            }
            function buscarReg() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tarea";
                var filtro = "Regresion";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function buscarCla() {
                document.getElementById("btnAV").value = 1;
                var condicion = $('#Agrupacion').attr('name');
                var filtro = document.getElementById("Agrupacion").value;
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function buscarC() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tarea";
                var filtro = "Clasificación";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function tAtrCat() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tipoAtributo";
                var filtro = "Categorico";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function tAtrNum() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tipoAtributo";
                var filtro = "Numerico";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function tAtrMix() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tipoAtributo";
                var filtro = "Mixto";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }


            function tDatMulti() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tipoDatos";
                var filtro = "Multivariante";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function tDatUni() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tipoDatos";
                var filtro = "Univariante";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function tDatSec() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tipoDatos";
                var filtro = "Secuencial";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function tDatSer() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tipoDatos";
                var filtro = "Serie Temporal";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function tDatTex() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tipoDatos";
                var filtro = "Texto";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function tDatTeo() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tipoDatos";
                var filtro = "Teoria del Dominio";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function tDatOtro() {
                document.getElementById("btnAV").value = 1;
                Gcond = "OtrosD";
                var condicion = "OtrosD";
                var filtro = "";
                var pag = document.getElementById("btnAV").value;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }


            function tDatTeo() {
                document.getElementById("btnAV").value = 1;
                var condicion = "tipoDatos";
                var filtro = "Teoria del Dominio";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }

            function zonaCvid() {
                document.getElementById("btnAV").value = 1;
                var condicion = "zona";
                var filtro = "Ciencias de la vida";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function zonaCfis() {
                document.getElementById("btnAV").value = 1;
                var condicion = "zona";
                var filtro = "Ciencias fisicas";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function zonaIng() {
                document.getElementById("btnAV").value = 1;
                var condicion = "zona";
                var filtro = "CS / Ingenieria";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function zonaCS() {
                document.getElementById("btnAV").value = 1;
                var condicion = "zona";
                var filtro = "Ciencias sociales";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function zonaNeg() {
                document.getElementById("btnAV").value = 1;
                var condicion = "zona";
                var filtro = "Negocios";
                var pag = document.getElementById("btnAV").value;
                Gcond = condicion;
                Gfiltro = filtro;
                Gpag = pag;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function tareaOtros() {
                document.getElementById("btnAV").value = 1;
                Gcond = "Otros";
                var condicion = "Otros";
                var filtro = "";
                var pag = document.getElementById("btnAV").value;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function IMe10() {
                document.getElementById("btnAV").value = 1;
                Gcond = "IMe10";
                var condicion = "IMe10";
                var filtro = "";
                var pag = document.getElementById("btnAV").value;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function IMa100() {
                document.getElementById("btnAV").value = 1;
                Gcond = "IMa100";
                var condicion = "IMa100";
                var filtro = "";
                var pag = document.getElementById("btnAV").value;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function Ien10100() {
                document.getElementById("btnAV").value = 1;
                Gcond = "Ien10100";
                var condicion = "Ien10100";
                var filtro = "";
                var pag = document.getElementById("btnAV").value;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }


            function MMe10() {
                document.getElementById("btnAV").value = 1;
                Gcond = "MMe10";
                var condicion = "MMe10";
                var filtro = "";
                var pag = document.getElementById("btnAV").value;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function MMa100() {
                document.getElementById("btnAV").value = 1;
                Gcond = "MMa100";
                var condicion = "MMa100";
                var filtro = "";
                var pag = document.getElementById("btnAV").value;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }

            function Men10100() {
                document.getElementById("btnAV").value = 1;
                Gcond = "Men10100";
                var condicion = "Men10100";
                var filtro = "";
                var pag = document.getElementById("btnAV").value;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function sinFiltro() {
                document.getElementById("btnAV").value = 1;
                Gcond = "SinF";
                var condicion = "SinF";
                var filtro = "";
                var pag = document.getElementById("btnAV").value;
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function buscar() {
                document.getElementById("btnAV").value = 1;
                Gcond = "Buscar";
                var condicion = "Buscar";
                var filtro = document.getElementById("txtBuscar").value;
                var pag = document.getElementById("btnAV").value;
                var ban = "nel";
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag, ban: ban},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
            function Aprobados() {
                document.getElementById("btnAV").value = 1;
                Gcond = "Aprovados";
                var condicion = "Aprovados";
                var filtro = "4";
                var pag = document.getElementById("btnAV").value;
                var ban = "ban";
                $.ajax({
                    type: "POST",
                    url: "BuscarServlet",
                    data: {condicion: condicion, filtro: filtro, pagi: pag, ban: ban},
                    success: function (responseText) {
                        $("#resultado").html(responseText);
                    }
                });
            }
        </script>
        <script>
            $(document).ready(function () {
                $('#grid').DataTable();
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
</html>
