<%-- 
    Document   : AcuerdoDonacion
    Created on : 07-feb-2020, 16:12:22
    Author     : cris_
--%>

<%@page import="org.DAO.ConexionMySQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acuerdo de donación</title>
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
    <body <% ConexionMySQL con = new ConexionMySQL();
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


        <div style="width: 80%; margin-left: 10%; margin-top: 100px; margin-bottom: 100px;">
              <nav aria-label="breadcrumb" style="margin-top: 10px; width: 100%; margin-left: 5%; margin: auto;">
                    <ol class="breadcrumb">
                        <a class="breadcrumb-item " aria-current="page" href="Repo.jsp">Inicio</a><li class="breadcrumb-item active" aria-current="page">Acuerdo de donación</li>
                    </ol>
                </nav>
            <td>

               <td>

                   <p class="almostbig" style="text-align: justify;"><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Política de donación:</font></font></b></p>

<p class="normal"  style="text-align: justify;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">La construcción de este repositorio es un proceso continuo. </font><font style="vertical-align: inherit;">La mayoría de las entradas en el repositorio fueron aportadas por investigadores de aprendizaje automático fuera de UTEQ. </font><font style="vertical-align: inherit;">Si tiene o conoce una entrada que deberíamos incluir aquí, infórmenos. </font><font style="vertical-align: inherit;">Siempre estamos interesados ​​en donaciones.
</font></font></p>

<p class="normal"  style="text-align: justify;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">La mejor manera de donar conjuntos de datos es completar nuestro formulario web que le permitirá cargar su archivo de datos en nuestro repositorio. </font><font style="vertical-align: inherit;">Los metadatos que solicitamos son útiles para la búsqueda facetada eficiente de conjuntos de datos:</font></font></p>


<p class="normal"  style="text-align: justify;"> <u><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Importante:</font></font></b></u><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> asegúrese de tener los permisos adecuados para que estos datos estén disponibles públicamente. </font><font style="vertical-align: inherit;">Por ejemplo, si no es el recopilador original de los datos que está donando, asegúrese de que el recopilador de datos original sepa que está donando el conjunto de datos y le da permiso para hacerlo.
</font></font></p>

<p></p>
<p class="normal"  style="text-align: justify;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">¡Gracias por tus donaciones! </font><font style="vertical-align: inherit;">Estás ayudando a que el aprendizaje automático sea un área de investigación sólida y vital.
</font></font></p>

<p class="normal"  style="text-align: justify;"><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Documentación / Formato</font></font></b></p>
<p class="normal"  style="text-align: justify;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Si bien aceptamos entradas con una documentación mínima, preferimos que el donante haga todo lo posible para documentar los archivos con el fin de proporcionar el máximo beneficio a la comunidad de aprendizaje automático. </font>

</font></font></p><p class="normal"  style="text-align: justify;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">También preferimos que los datos tengan un formato estándar. </font><font style="vertical-align: inherit;">Para las bases de datos de instancias, el formato estándar es una instancia por línea, sin espacios, valores de atributos separados por comas y valores faltantes indicados con "?". </font><font style="vertical-align: inherit;">Para otros tipos de datos, utilice su mejor criterio.</font></font></p>

<p class="normal"  style="text-align: justify;"><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Actualización de un conjunto de datos existente</font></font></b></p>
<p class="normal"  style="text-align: justify;"><font style="vertical-align: inherit;">Si está proporcionando datos actualizados, envíelos como un nuevo conjunto de datos e incluya "(ACTUALIZACIÓN)" en el título. </font><font style="vertical-align: inherit;">El curador del sitio extraerá los datos de este nuevo envío y hará los cambios apropiados para usted.
</p>
<hr>  
<p class="almostbig"  style="text-align: center; margin: auto; font-size: 30px;"><a href="Donar.jsp?id=0&us=na"><b><font style="vertical-align: inherit;"><font>¡Done un conjunto de datos!</font></font></b></a></p>
        </div>                 




    </body>
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
