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
        <script src="js/popup.js" type="text/javascript"></script>
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
            <form action="InsertProject" method="post">
                <div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Coordinador</span>
                        </div>
                        <!--<input type="text" name="coordinadorid" id="coordinadorid" class="custom-select" required="true" style="height: 40px; width: 500px;" />-->
                        <input type="text" placeholder="Escriba el coordinador..." onpaste="return false" onkeypress="return SoloLetras(event)" id="coordinador" name="coordinador" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">    
                        <button id="anadirCoordinador" class="btn btn-primary btn-lg" style="margin-bottom: 0px; margin-top: 0px; margin-right: 0px; width: 70px; height: 40px; padding: 0; font-size: 15px;">Añadir</button>
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
                                <td><button id="anadirAutor" class="btn btn-primary btn-lg" type="submit" style="margin-bottom: 0px; margin-top: 0px; width: 70px; height: 40px; padding: 0; font-size: 15px;">Añadir</button></td>
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
          
         <!--    Modal  -->    
         <div id="dialog" title="Dialogo básico">
             <p>Diálogo básico modal. Puede ser movido, redimensionado y cerrado haciendo clic sobre el botón 'X'.</p>
         </div>
         
         <!--  End  Modal  --> 
        <script>
             $(function () {
                  $("#dialog").dialog({
                  autoOpen: false,
                  modal: true
             });
             $("#anadirCoordinador")
                  .button()
                  .click(function () {
                  $("#dialog").dialog("open");
                  });
             });
        </script>          
    </body>
</html>
