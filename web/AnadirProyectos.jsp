<%-- 
    Document   : AnadirProyectos
    Created on : 23 ago. 2020, 11:01:38
    Author     : crist
--%>

<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.DAO.ConexionMySQL"%>
<%@page import="model.Conexion"%>
<%@page import="org.Object.Usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyectos Integradores</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link href="css/CssAnadirPI.css" rel="stylesheet" type="text/css"/>
        <link href="css/util.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilos_rep.css" rel="stylesheet" type="text/css" />
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <script src="js/dinamico.js" type="text/javascript"></script>
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/estylless.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        
    </head>
    <body>
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
               <!--<li class="nav-item">
                   <a class="nav-link" href="Repo.jsp">
                       <i class="fa fa-newspaper-o" aria-hidden="true"></i>
                       Añadir proyecto

                   </a>
               </li>-->


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
                       
        <div class="regisContenedor" style="max-width: 800px; margin: auto;">
            <p class="regisTitulo"> Registro de Proyectos </p>
            <p class="regisTitulo"> Registro de Proyectos </p>
            <form>
                <div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Coordinador</span>
                        </div>
                        <!--<input type="text" name="coordinadorid" id="coordinadorid" class="custom-select" required="true" style="height: 40px; width: 500px;" />-->
                        <input type="text" placeholder="Escriba el coordinador..." onpaste="return false" onkeypress="return SoloLetras(event)" id="coordinador" name="coordinador" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">    
                        <button id="btn-abrir-popup" class="btn btn-primary btn-lg" style="margin-bottom: 0px; margin-top: 0px; margin-right: 0px; width: 70px; height: 40px; padding: 0; font-size: 15px;">Añadir</button>
                    </div>
                    
                   <table id="general" style="width: 15px; height: 15px; margin-bottom: 10px;">
                        <tbody>

                            <tr>
                                <td class="input-group-text" style="height: 40px; width: 200px;" >Autores</td>
                                <td> <div style="overflow-y: scroll; max-height: 100px;">
                                        <table style="position: relative; left:0;" id="autorTb" >           
                                            <tbody id="cuerpoAutores">

                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                                <td><button id="btn-abrir-popup2" class="btn btn-primary btn-lg" style="margin-bottom: 0px; margin-top: 0px; width: 70px; height: 40px; padding: 0; font-size: 15px;">Añadir</button></td>
                        <script>
                            //Script para generar Autores
                            var cont1 = 0;
                            $(function () {
                                agregarAutor();
                            });
                            // Aqui se crean los actores
                            function agregarAutor() {
                                var tb = $('#autorTb tbody');
                                var textClone = $('<input>', {
                                    id: 'autor' + cont1,
                                    class: 'form-control autocomplete-sql ob-blur-actor-sql',
                                    name: 'autor' + cont1,
                                    value: '',
                                    type: 'text',
                                    style: 'width: 413px; height: 40px;',
                                    placeholder: 'Busqueda del autor...'
                                });
                                var colText = $('<td>').append(textClone);
                                var div = $('<div class="estilobutton" style="width: 40px; higth: 40px; text-align: center; cursor: pointer;" ><a onclick="agregarAutor()"><i class="fa fa-plus" aria-hidden="true"></i></a></div>');
                                var div2 = $('<div class="estilobutton" style="width: 40px; higth: 40px; text-align: center; cursor: pointer;" ><a onclick="borrarFila(' + "'fAutor" + cont1 + "'" + ',' + "'autorTb'" + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></div>');
                                var colButtondel = $('<td>').append(div2);
                                var colButtoadd = $('<td>').append(div);
                                $('<tr>', {id: 'fAutor' + cont1}).append(colText).append(colButtoadd).append(colButtondel).appendTo(tb);
                                cont1++;
                            }
                            //Se borra la fila creada de autores
                            function borrarFila(id_fila, tableName) {
                                var table = document.getElementById(tableName);
                                var cant = table.rows.length;
                                if (cant > 1) {
                                    $('#' + id_fila).remove();
                                }
                            }
                        </script>
                        </tr>
                    </table>
                    
                    
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default" style="width: 200px; ">Titulo</span>
                        </div>
                        <input type="text" placeholder="Escriba el titulo..." onpaste="return false" onkeypress="return SoloLetras(event)" id="titulo" name="titulo" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">

                    </div>
                    
                     
                    <div class="input-group mb-3">
                        <select id="modulo" name="modulo" class="custom-select">
                            <option value="" selected>Elija el Modulo...</option>
                            <option value="1">1er Semestre</option>
                            <option value="2">2do Semestre</option>
                            <option value="3">3er Semestre</option>
                            <option value="4">4to Semestre</option>   
                            <option value="5">5to Semestre</option>   
                            <option value="6">6to Semestre</option>   
                            <option value="7">7mo Semestre</option>   
                            <option value="8">8vo Semestre</option>   
                            <option value="9">9no Semestre</option>   
                        </select>

                        <div class="input-group-append">
                            <label class="input-group-text" for="inputGroupSelect02" style="width: 170px;">Modulo</label>
                        </div>             
                    </div>        
                            
                    <div class="input-group mb-3">
                        <select id="periodo" name="periodo" class="custom-select">
                            <option value="" selected>Elija el periodo...</option>
                            <option value="PPA">Primer Periodo Academico</option>
                            <option value="SPA">Segundo Periodo Academico</option>  
                        </select>
                        <input type="number" placeholder="Elija el año..." onpaste="return false" min="1970" max="2050" maxlength="2050" minlength="1970" onkeypress="return SoloNumeros(event)" id="anio" name="anio" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        <div class="input-group-append">
                            <label class="input-group-text" for="inputGroupSelect02" style="width: 170px;">Periodo Academico</label>
                        </div>             
                    </div>         
                            
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Objetivo General</span>
                        </div>
                        <input type="text"onpaste="return false" onkeypress="return SoloLetras(event)" id="objetivo" name="objetivo" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                    </div>    
                            
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Resumen</span>
                        </div>
                        <textarea rows="6" id="resumen" name="resumen" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2"></textarea>
                    </div> 
                   
                    <table id="generalVariable" style="width: 15px; height: 15px; margin-bottom: 10px;">
                        <tbody>

                            <tr>
                                <td class="input-group-text" style="height: 40px; width: 200px;" >Variables</td>
                                <td> <div style="overflow-y: scroll; max-height: 100px;">
                                        <table style="position: relative; left:0;" id="variableTb" >           
                                            <tbody id="cuerpoVariables">

                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                        <script>
                            //Script para generar Autores
                            var cont2 = 0;
                            $(function () {
                                agregarVariable();
                            });
                            // Aqui se crean los actores
                            function agregarVariable() {
                                var tb = $('#variableTb tbody');
                                var textCloneVar = $('<input>', {
                                    id: 'variable' + cont2,
                                    class: 'form-control autocomplete-sql ob-blur-actor-sql',
                                    name: 'variable' + cont2,
                                    value: '',
                                    type: 'text',
                                    style: 'width: 350px; height: 40px;',
                                    placeholder: 'Escriba la variable...'
                                });
                                var textCloneTipo = $('<select class="custom-select" style="width: 145px; height: 40px;" required="true"><option value="I">Independiente</option><option value="D">Dependiente</option></select>');
                                var colTextVar = $('<td>').append(textCloneVar);
                                var colTextTipo = $('<td>').append(textCloneTipo);
                                var div = $('<div class="estilobutton" style="width: 40px; higth: 40px; text-align: center; cursor: pointer;" ><a onclick="agregarVariable()"><i class="fa fa-plus" aria-hidden="true"></i></a></div>');
                                var div2 = $('<div class="estilobutton" style="width: 40px; higth: 40px; text-align: center; cursor: pointer;" ><a onclick="borrarFilaVariable(' + "'fVariable" + cont2 + "'" + ',' + "'variableTb'" + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></div>');
                                var colButtondel = $('<td>').append(div2);
                                var colButtoadd = $('<td>').append(div);
                                $('<tr>', {id: 'fVariable' + cont2}).append(colTextVar).append(colTextTipo).append(colButtoadd).append(colButtondel).appendTo(tb);
                                cont2++;
                            }
                            //Se borra la fila creada de autores
                            function borrarFilaVariable(id_fila, tableName) {
                                var table = document.getElementById(tableName);
                                var cant = table.rows.length;
                                if (cant > 1) {
                                    $('#' + id_fila).remove();
                                }
                            }
                        </script>
                        </tr>
                    </table>
                    
                    
                    <div class="input-group mb-3">
                        
                        <input type="file" onpaste="return false" id="url" name="url" class="form-control upload-photo" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                        
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 170px;">Archivo de Proyecto</span>
                        </div>
                    </div>   
                  </div> 
                
                  <!--</div>
                    <div class="input__row uploader">
                      <div id="inputval" class="input-value"></div>
                      <label for="file_1"></label>
                      <input id="file_1" class="upload" type="file">
                    </div>-->
                
                  <div style="display: flex; justify-content: space-between;">
                        <button id="guardar" type="submit" class="btn btn-primary btn-lg" style="width: 48%">Guardar</button>
                        <button type="button" onclick="" class="btn btn-secondary btn-lg" style="width: 48%">Cancelar</button>
                    </div>
            </form>
        </div> 
          
         <!--    Modal Coordinadores -->    
         <div class="overlay" id="overlay" style="z-index: 100000000000">
             <div class="popup" id="popup" style="width: 700px; padding: 10px;">
                <a id="btn-cerrar-popup" class="btn-cerrar-popup">X</a>
                <h3>REGISTRAR COORDINADOR</h3>
                <form id="form1">
                    <div class="contenedor-inputs">
                        <table id="tableCoord1" style="padding: 0px; margin: auto;">
                            <tr>
                                <td><input id="cordnombre" name="cordnombre" type="text" placeholder="Nombres..." style="width: 300px; height: 40px;" required minlength="1" maxlength="50" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" /></td>
                                <td><input id="cordapellido" name="cordapellido" type="text" placeholder="Apellidos..." style="width: 300px; height: 40px;" required minlength="1" maxlength="50" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required minlength="1" maxlength="50" /></td>
                            </tr>   
                            <tr>
                                <td><input id="cordidentificacion" name="cordidentificacion" type="text" placeholder="CI, Pasaporte, etc..." style="width: 300px; height: 40px;" required minlength="1" maxlength="15" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required minlength="1" maxlength="15" /></td>
                                <td><input type="date" id="cordfechaNacimiento" min="1930-01-01" max="2010-12-31"name="cordfechaNacimiento" style="width: 300px; height: 40px;"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2"></td>
                            </tr>
                            <tr>
                                <td><input id="cordemail" name="cordemail" type="text" style="width: 300px; height: 40px;" required minlength="8" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Correo electrónico..."/></td>
                                <td><input id="corddireccion" name="corddireccion" type="text" style="width: 300px; height: 40px;" required minlength="10" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Dirección..."/></td>
                            </tr>
                            <tr>
                                <td><input id="cordprovincia" name="cordprovincia" type="text" style="width: 300px; height: 40px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Provincia..."/></td>
                                <td><input id="cordciudad" name="cordciudad" type="text" style="width: 300px; height: 40px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Ciudad..."/></td>
                            </tr>
                            <tr>
                                <td><input id="cordprofesion" name="cordprofesion" type="text" style="width: 300px; height: 40px;"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Escriba la profesión..."/></td>
                                <td><input id="cordinstitucion" name="cordinstitucion" type="text" style="width: 300px; height: 40px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Institución a que pertenece..."/></td>
                            </tr>
                        </table>
                        
                        <select id="cordlevelacademico" name="cordlevelacademico" class="custom-select" style="font-size: 14px;; width: 250px; margin-bottom: 20px;">
                            <option value="" selected>Elija el Nivel académico...</option>
                            <option value="3">Tercer nivel</option>
                            <option value="4">Cuarto nivel</option>
                        </select>
                        
                        <table id="tableCoord2" style="padding: 0px; margin: auto;"">
                            <tr>
                                <td><input id="corduser" name="corduser" type="text" placeholder="Usuario..." style="width: 300px; height: 40px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" /></td>
                                <td><input id="cordpassword" name="cordpassword" type="password" placeholder="Clave..." style="width: 300px; height: 40px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" /></td>
                            </tr>
                        </table>
                    </div>
                    <input type="button" id="envia" class="btn-submit" value="Guardar" style="margin-bottom: 20px;">
                </form>
                <br/>
                <div id="result1" style="color: red" ></div>
                <br/>
            </div>
        </div>
         <!--  End  Modal  -->       
         
         <!--    Modal Autores --> 
         <div class="overlay" id="overlay2" style="z-index: 100000000000">
             <div class="popup" id="popup2" style="width: 700px; padding: 10px;">
                <a id="btn-cerrar-popup2" class="btn-cerrar-popup">X</a>
                <h3>REGISTRAR AUTOR</h3>
                <form id="form2">
                    <div class="contenedor-inputs">
                        <table id="tableAutor" style="padding: 0px; margin: auto;">
                            <tr>
                                <td><input id="autornombre" name="autornombre" type="text" placeholder="Nombres..." style="width: 300px; height: 40px;" required minlength="1" maxlength="50" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required minlength="1" maxlength="50" /></td>
                                <td><input id="autorapellido" name="autorapellido" type="text" placeholder="Apellidos..." style="width: 300px; height: 40px;" required minlength="1" maxlength="50" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required minlength="1" maxlength="50" /></td>
                            </tr>   
                            <tr>
                                <td><input id="autoridentificacion" name="autoridentificacion" type="text" placeholder="CI, Pasaporte, etc..." style="width: 300px; height: 40px;" required minlength="1" maxlength="15" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required minlength="1" maxlength="15" /></td>
                                <td><input type="date" id="autorfechaNacimiento" min="1930-01-01" max="2010-12-31"name="autorfechaNacimiento" style="width: 300px; height: 40px;"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2"></td>
                            </tr>
                            <tr>
                                <td><input id="autoremail" name="autoremail" type="text" style="width: 300px; height: 40px;" required minlength="8" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Correo electrónico..."/></td>
                                <td><input id="autorcarrera" name="autorcarrera" type="text" style="width: 300px; height: 40px;" required minlength="10" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Dirección..."/></td>
                            </tr>
                        </table>
                    </div>
                    <input type="button" id="envia" class="btn-submit" value="Guardar" style="margin-bottom: 20px;">
                </form>
                <br/>
                <div id="result1" style="color: red" ></div>
                <br/>
            </div>
        </div>
         <!-- End modal-->
         
         <script>
             var btnAbrirPopup = document.getElementById("btn-abrir-popup"),
             overlay = document.getElementById('overlay'),
             popup = document.getElementById('popup'),
             btnCerrarPopup = document.getElementById('btn-cerrar-popup');
    
             var btnAbrirPopup2 = document.getElementById("btn-abrir-popup2"),
             overlay2 = document.getElementById('overlay2'),
             popup2 = document.getElementById('popup2'),
             btnCerrarPopup2 = document.getElementById('btn-cerrar-popup2');

            btnAbrirPopup.addEventListener('click', function(e) {
                e.preventDefault();
                overlay.classList.add('active');
                popup.classList.add('active');
            });
            
            btnAbrirPopup2.addEventListener('click', function(e) {
                e.preventDefault();
                console.log(overlay2);
                overlay2.classList.add('active');
                popup2.classList.add('active');
            });

            btnCerrarPopup.addEventListener('click', function (e){
                e.preventDefault();
                overlay.classList.remove('active');
                popup.classList.remove('active');
            });
            
            btnCerrarPopup2.addEventListener('click', function (e){
                e.preventDefault();
                overlay2.classList.remove('active');
                popup2.classList.remove('active');
            });
         </script>
    </body>
</html>
