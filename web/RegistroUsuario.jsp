<%-- 
    Document   : Registro de Usuario
    Created on : 07-feb-2020, 16:12:22
    Author     : cris_
    Permite registrar un nuevo usuario
--%>

<%@page import="org.Object.Institucion"%>
<%@page import="org.Object.Profesion"%>
<%@page import="java.util.LinkedList"%>
<%@page import="org.Object.Provincia"%>
<%@page import="org.DAO.ConexionMySQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuario</title>
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
    <!--extrae el usuario y rol en caso de que exista registro en la variable sesión--> 
    <body <% ConexionMySQL con = new ConexionMySQL();
            HttpSession sesion = request.getSession(false);
           String usuario = String.valueOf(sesion.getAttribute("usuario"));
                String rol = String.valueOf(sesion.getAttribute("rol"));
            //if(sesion.getAttribute("usuario") != null){
              
            //}else{
             //     response.sendRedirect("Repo.jsp");
            //}
    %>onload="Actualizar()">
       
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

        <%
            String ID="0";
            String NombreUsuario="";
            String Apellido="";
            String IDprofesion="";
            int IDinstitucion=0;
            String fecha="";
            String Correo="";
            String Direccion="";
            int NivelAcademico=0;
            int IDciudad=0;
            String NickName="";
            Integer IDprovincia=0;
          //  String idusuario=(String)se.getAttribute("idusuario");
           // out.println("<script>alert('"+idusuario+"')</script>");
           HttpSession sesionn = request.getSession(true);
             Object dato = sesionn.getAttribute("id");
            if(dato!=null)
            {
            ID = dato.toString();
            }
            if(ID!="0")
            {
            
            ConexionMySQL conex = new ConexionMySQL();
            NombreUsuario = conex.seleccion("select nombre as resultado from usuario where idUsuario ='" + ID + "'");
            Apellido = conex.seleccion("select apellido as resultado from usuario where idUsuario ='" + ID + "'");
            IDprofesion = conex.seleccion("select Profesion_idProfesion as resultado from usuario where idUsuario ='" + ID + "'");
            IDinstitucion = Integer.parseInt(conex.seleccion("select Institucion_idInstitucion as resultado from usuario where idUsuario ='" + ID + "'"));
            fecha = conex.seleccion("select fechaNacimiento as resultado from usuario where idUsuario ='" + ID + "'").substring(0,10);;
           Correo = conex.seleccion("select correo as resultado from usuario where idUsuario ='" + ID + "'");
            Direccion = conex.seleccion("select direccion as resultado from usuario where idUsuario ='" + ID + "'");
            NivelAcademico = Integer.parseInt(conex.seleccion("select nivelAcademico as resultado from usuario where idUsuario ='" + ID + "'"));
            IDciudad = Integer.parseInt(conex.seleccion("select Ciudad_idCiudad as resultado from usuario where idUsuario ='" + ID + "'"));
             NickName = conex.seleccion("select nickName as resultado from usuario where idUsuario ='" + ID + "'");
            IDprovincia = Integer.parseInt(ConexionMySQL.seleccion("select Provincia_idProvincia as resultado from ciudad where idCiudad='" + IDciudad + "'"));
            }
        %>

     <navbar>
        <img class="navImg" src="2.jpg" alt="">
        <ul class="nav justify-content-end navstyle" >
            <li class="nav-item">
                <a class="nav-link navenlaces" href="#"><img src="iconos/icons8_Home_48px.png" class="iconEnlace" alt="">Inicio</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle navenlaces" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> <img src="iconos/icons8_Settings_50px_1.png" class="iconEnlace" alt="">Configuración </a>
                <div class="dropdown-menu" style="margin-top: 11px;">
                    <a class="dropdown-item" href="#">Perfil</a>
                    <div class="dropdown-divider"></div>
                      <a id="btn-abrir-popup" class="nav-link navenlaces">Iniciar Sesión</a>
                    <!--<a class="dropdown-item" href="#">Cerrar Sesión</a>-->
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link navenlaces" href='http://localhost:8081//PII/RegistroUsuario.jsp'><img src="iconos/icons8_User_50px_2.png" class="iconEnlace" alt="">Registrarse</a>
            </li>
        </ul>
    </navbar>

    <div id="InicioSesion" class="modal fade text-center">

        <div class="modal-dialog">
            <div class="col-md-10">
                <div class="modal-content">
                    <button type="button" style="text-align: right" class="close" data-dismiss="modal"><img src="iconos/x.png" style="width: 40px; height: 43px;"/></button>

                    <div class="col-lg-12 col-sm-12 col-12 user-name">
                        <img src="iconos/login.PNG" style="width: 180px; height: 200px;" alt=""/>
                        <h1>Inicio Sesión</h1>                           
                    </div>
                    <div class="col-lg-12 col-sm-12 col-12 form-input">
                        <form action="ValidarLogin" method="post">
                            <div class="form-group">
                                <input type="text" name="txtusuario" class="form-control" placeholder="Usuario">
                            </div>
                            <div class="form-group">
                                <input type="password" name="txtclave" class="form-control" placeholder="Contraseña">
                            </div>
                            <button type="submit" class="btn btn-primary">Ingresar</button>

                        </form>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-12 link-part">
                        <a href="http://www.nicesnippets.com" target="_blank">¿Olvidó su contraseña?</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!--Llama al servlet para insertar un usuario nuevo--> 
    <div class="regisContenedor" style="max-width: 800px; margin: auto;">
        <p class="regisTitulo"> Registro </p>
        <form action="InsertUsuario" method="post">
            <div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default" style="width: 200px; ">Nombre</span>
                    </div>
                    <input type="text" onpaste="return false" onkeypress="return SoloLetras(event)" id="nombre" name="nombre" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required="true" value="<%=NombreUsuario%>">
               
                    <input type="text" id="ID"  name="ID" hidden="false" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required="true" value="<%=ID%>">

                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Apellidos</span>
                    </div>
                    <input type="text"onpaste="return false" onkeypress="return SoloLetras(event)" id="apellido" name="apellido" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" required="true" value="<%= Apellido%>">
                </div>            
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Fecha de nacimiento</span>
                    </div>
                    <input type="date" id="fechaNacimiento" min="1930-01-01" max="2010-12-31"name="fechaNacimiento" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" required="true">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Correo electrónico</span>
                    </div>
                    <input type="text" id="correo" name="correo" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" value="<%= Correo%>">
                </div>


                <div class="input-group mb-3">
                    <select name="provinciaid" id="provinciaid" class="custom-select" required="true">
                        <option value="" selected>Elija una provincia...</option>
                        <%
                            LinkedList<Provincia> listaP = ConexionMySQL.getProvincias();
                            int idProvincia = 0;
                            String nombre = "";
                            for (int i = 0; i < listaP.size(); i++) {
                                idProvincia = listaP.get(i).getIdProvincia();
                                nombre = listaP.get(i).getNombre();
                                out.println("<option value=" + idProvincia + ">" + nombre + "</option>");
                            }
                        %>  

                    </select>
                    <div class="input-group-append">
                        <label class="input-group-text" for="inputGroupSelect02">Provincia</label>
                    </div>
                </div>
                <div class="input-group mb-3">                   
                    <select id="ciudad_id" class="form-control" name="ciudad_id" required="true">
                    </select>

                    <div class="input-group-append">
                        <label class="input-group-text" for="inputGroupSelect02">Ciudad</label>
                    </div>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Dirección</span>
                    </div>
                    <input type="text" id="direccion" name="direccion" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" required="true" value="<%=Direccion%>">
                </div> 

                <div class="input-group mb-3">
                    <select id="nivelAcademico" name="nivelAcademico" class="custom-select" required="true">
                        <option value="" selected>Elija...</option>
                        <option value="1">Primaria</option>
                        <option value="2">Secundaria</option>
                        <option value="3">Superior</option>                      
                    </select>

                    <div class="input-group-append">
                        <label class="input-group-text" for="inputGroupSelect02">Nivel Académico</label>
                    </div>             
                </div>
                <div class="input-group mb-3">
                    <select id="idProfesion" name="idProfesion" class="custom-select" required="true">
                        <option value="" selected>Elija una profesión...</option>
                        <%
                            LinkedList<Profesion> listaPr = ConexionMySQL.getProfesion();
                            int idProfesion = 0;
                            String nombreP = "";
                            for (int i = 0; i < listaPr.size(); i++) {
                                idProfesion = listaPr.get(i).getProfesionID();
                                nombreP = listaPr.get(i).getNombre();
                                out.println("<option value=" + idProfesion + ">" + nombreP + "</option>");
                            }
                          //  out.println("<option value='otro'>Otro...</option>");
                        %>  
                    </select>

                    <div class="input-group-append">
                        <label class="input-group-text" for="inputGroupSelect02">Profesión</label>
                    </div>
                </div>

                <div class="input-group mb-3">
                    <select id="idInstitucion" name="idInstitucion" class="custom-select" id="inputGroupSelect02" required="true">
                        <option value="" selected>Elija una institución...</option>
                        <%  LinkedList<Institucion> listaI = ConexionMySQL.getInstitucion();
                            int idInstitucion = 0;
                            String nombreI = "";
                            for (int i = 0; i < listaI.size(); i++) {
                                idInstitucion = listaI.get(i).getInstitucionID();
                                nombreI = listaI.get(i).getNombre();
                                out.println("<option value=" + idInstitucion + ">" + nombreI + "</option>");

                            }
                         //   out.println("<option value='otro'>Otro...</option>");

                        %>  

                    </select>
                    <div class="input-group-append">
                        <label class="input-group-text" for="inputGroupSelect02">Institución</label>
                    </div>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Nombre de Usuario</span>
                    </div>
                    <input type="text" name="usuario" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" required="true" value="<%=NickName%>">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Contraseña</span>
                    </div>
                    <input type="password" name="clave" id="clave" placeholder="Ingrese una contraseña..."  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                    <div style="font-size: 25px"> <i class="fa fa-eye" id="show"></i></div>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Confirmar Contraseña</span>
                    </div>
                    <input type="password" name="clave2" id="clave2" placeholder="Confirme su contraseña..." class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                    <div style="font-size: 25px"> <i class="fa fa-eye" id="show2"></i></div>
                </div>
            </div>

            <div style="display: flex; justify-content: space-between;">
                <button id="guardar" type="submit" class="btn btn-primary btn-lg" style="width: 48%">Guardar</button>
                <button type="button" onclick="recargar()" class="btn btn-secondary btn-lg" style="width: 48%">Cancelar</button>
            </div>
        </form>
    </div>     
<script>
    function Actualizar() {
        document.getElementById("nivelAcademico").selectedIndex = "<%= NivelAcademico%>";
        document.getElementById("idInstitucion").selectedIndex = "<%= IDinstitucion%>";
        document.getElementById("fechaNacimiento").value = "<%= fecha%>";
        document.getElementById("idProfesion").selectedIndex = "<%= IDprofesion%>";
        document.getElementById("provinciaid").selectedIndex = "<%= IDprovincia%>";

        $('#provinciaid').trigger('change');
    }
    function recargar(){
        location.reload();
    }
   function SoloLetras(e) {
	key=e.keyCode || e.which;
 	teclado=String.fromCharCode(key).toLowerCase();
 	letras="qwertyuiopasdfghjklñzxcvbnm ";
 	especiales="8-37-38-46-164";
 	teclado_especial=false;
        
 	for(var i in especiales){
		if(key==especiales[i]){
			teclado_especial=true;
			break;
		}
	}
 	if(letras.indexOf(teclado)==-1 && !teclado_especial){
		return false;
	}
}

</script>



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
<!-- ajax para llamar al servlet LogUsuario -->
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
<script>
    $(document).ready(function () {
        $("#provinciaid").on("change", function () {
            var provincia_id = $("#provinciaid").val();
            var ciudad_id = <%= IDciudad%>;
            //location.href = "http://" + window.location.host + "/PII/RegistroUsuario.jsp?provincia="+provincia_id+"";
            $.ajax({
                url: "ciudad.jsp", //your jsp page name
                data: {provincia_id: provincia_id, ciudad_id: ciudad_id}, //sending request to state.jsp page.
                method: "POST", //HTTP method.
                success: function (data)
                {
                    $("#ciudad_id").html(data);//output or response will display in state select box.
                }
            });
            //   alert(ciudad_id);   
        });
    });
</script>
</html>
