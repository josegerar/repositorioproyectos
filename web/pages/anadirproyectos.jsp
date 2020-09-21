<%@page import="org.Controladores.ProyectoController"%>
<%@page import="org.Object.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Proyecto p = null;
    String type = request.getParameter("type");
    if(type.equals("editar")){
        p = new ProyectoController().getProyecto(request.getParameter("id"));
    }
    
%>

<div  style="width: 90%;margin-left: 5%; z-index: 10000000; background: #fff; ">
    <nav aria-label="breadcrumb" style="margin-top: 10px; width: 90%; margin-left: 5%;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">Inicio</li>
        </ol>
    </nav>
</div>
<div class="regisContenedor" style="max-width: 800px; margin: auto;">

    <% if (type.equals("anadir")) { %>
    <p class="regisTitulo"> Registro de Proyecto </p>
    <%} else if (type.equals("editar")) {%>                        
    <p class="regisTitulo"> Editar de Proyecto </p>
    <%}%>
    
    <form>
        <div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Coordinador</span>
                </div>
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                <% if (type.equals("editar")) { %>
                <input type="text" placeholder="Escriba el coordinador..." value="<%=p.getCoordinador().getNombre()%>" id="coordinador" name="coordinador" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">    
                <script>
                    $('#coordinador').data("data",{idUsuario:p.getCoordinador().getIdUsuario()});
                </script>
                <%}else {%>  
                <input type="text" placeholder="Escriba el coordinador..." id="coordinador" name="coordinador" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">    
                <%}%>
                <button id="btn-abrir-popup" class="btn btn-primary btn-lg" style="margin-bottom: 0px; margin-top: 0px; margin-right: 0px; width: 70px; height: 40px; padding: 0; font-size: 15px;">A&ntilde;adir</button>
            </div>

            <table id="general" style="width: 15px; height: 15px; margin-bottom: 10px;">
                <tbody>

                    <tr>
                        <td class="input-group-text" style="height: 40px; width: 200px;" >Autores</td>
                        <td> <div style="overflow-y: scroll; max-height: 160px;">
                                <table style="position: relative; left:0;" id="autorTb" >           
                                    <tbody id="cuerpoAutores">

                                    </tbody>
                                </table>
                            </div>
                        </td>
                        <td><button id="btn-abrir-popup2" class="btn btn-primary btn-lg" style="margin-bottom: 0px; margin-top: 0px; width: 70px; height: 40px; padding: 0; font-size: 15px;">A&ntilde;adir</button></td>
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
                            class: 'form-control autocomplete-sql ob-blur-sql',
                            name: 'autor',
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
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                 <% if (type.equals("editar")) { %>
                <input type="text" placeholder="Escriba el titulo..." value="<%=p.getTitulo()%>"  onpaste="return false" id="titulo" name="titulo" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                
                <%}else {%> 
                <input type="text" placeholder="Escriba el titulo..." onpaste="return false" id="titulo" name="titulo" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                <%}%>
            </div>

            
            <div class="input-group mb-3">
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                <select id="modulo" name="modulo" class="custom-select">
                    <option value="0" selected>Elija el Modulo...</option>
                    <option value="1">1 Semestre</option>
                    <option value="2">2 Semestre</option>
                    <option value="3">3 Semestre</option>
                    <option value="4">4 Semestre</option>   
                    <option value="5">5 Semestre</option>   
                    <option value="6">6 Semestre</option>   
                    <option value="7">7 Semestre</option>   
                    <option value="8">8 Semestre</option>   
                    <option value="9">9 Semestre</option>   
                </select>
                <%if (type.equals("editar")) {%>
                <script>
                    $("#modulo option").each(function(){
                        if ($(this).text() === <%=p.getSemestre()%> ){        
                         $("#modulo option[value="+ $(this).val() +"]").attr("selected",true);
                        }
                     });
                </script>
                 <%}%> 
                 
                <div class="input-group-append">
                    <label class="input-group-text" for="inputGroupSelect02" style="width: 170px;">Modulo</label>
                </div>             
            </div>        

            <div class="input-group mb-3">
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                <select id="periodo" name="periodo" class="custom-select">
                    <option value="" selected>Elija el periodo...</option>
                    <option value="PPA">Primer Periodo Academico</option>
                    <option value="SPA">Segundo Periodo Academico</option>  
                </select>
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                <input type="number" placeholder="Elija el a&ntilde;o..." onpaste="return false" min="1970" max="2050" maxlength="2050" minlength="1970" onkeyUp="return ValNumero(this);" id="anio" name="anio" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                <div class="input-group-append">
                    <label class="input-group-text" for="inputGroupSelect02" style="width: 170px;">Periodo Academico</label>
                </div>             
            </div>         

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Objetivo General</span>
                </div>
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                <input type="text"onpaste="return false" onkeypress="return ValTexto(event)" id="objetivo" name="objetivo" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
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
                        <td> <div style="overflow-y: scroll; max-height: 160px;">
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
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                <input type="file" id="url" name="url" accept="application/pdf" class="form-control upload-photo" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                <script>
                    $('#url').on('change', function () {
                        var ext = $(this).val().split('.').pop();
                        console.log($(this)[0].files);
                        if ($(this).val() !== '') {
                            if (ext !== "pdf") {
                                $(this).val('');
                                console.log($(this)[0].files);
                                alert("Tipo de archivo no permitido: " + ext);
                            }
                        }
                    });
                </script>
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 170px;">Archivo de Proyecto</span>
                </div>
            </div>   
        </div> 

        <div style="display: flex; justify-content: space-between;">
            <button id="guardarPI" type="button" class="btn btn-primary btn-lg" style="width: 48%">Guardar</button>
            <button type="button" onclick="" class="btn btn-secondary btn-lg" style="width: 48%">Cancelar</button>
        </div>
    </form>
</div> 

<!--    Modal Coordinadores -->    
<div class="overlay" id="overlay" style="z-index: 100">
    <div class="popup" id="popup" style="width: 700px; padding: 10px;">
        <a id="btn-cerrar-popup" class="btn-cerrar-popup">X</a>
        <h3>REGISTRAR COORDINADOR</h3>
        <form id="form1">
            <div id="conttabla" class="contenedor-inputs">
                <table id="tableCoord1" style="padding: 0px; margin: auto;">
                    <tr>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="cordnombre" name="cordnombre" type="text" placeholder="Nombres..." onkeypress="return ValTexto(event)" style="width: 300px; height: 40px; margin-bottom: 5px;" required minlength="1" maxlength="50" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" />
                        </td>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="cordapellido" name="cordapellido" type="text" placeholder="Apellidos..." onkeypress="return ValTexto(event)"  style="width: 300px; height: 40px; margin-bottom: 5px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required minlength="1" maxlength="50" />
                        </td>
                    </tr>   
                    <tr>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="cordidentificacion" name="cordidentificacion" type="text" placeholder="CI, Pasaporte, etc..." onkeyUp="return ValNumero(this);" style="width: 300px; height: 40px; margin-bottom: 5px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required minlength="1" maxlength="15" />
                        </td>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input type="date" id="cordfechaNacimiento" min="1930-01-01" max="2010-12-31"name="cordfechaNacimiento" style="width: 300px; height: 40px; margin-bottom: 5px;"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="cordemail" name="cordemail" type="text" style="width: 300px; height: 40px; margin-bottom: 5px;" required minlength="8" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Correo elect&oacute;nico..."/>
                        </td>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="corddireccion" name="corddireccion" type="text" style="width: 300px; height: 40px; margin-bottom: 5px;" required minlength="10" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Direcci&oacute;n..."/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="cordprovincia" name="provincia" type="text" onkeypress="return ValTexto(event)"  style="width: 300px; height: 40px; margin-bottom: 5px;" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Provincia..."/>
                        </td>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="cordciudad" name="ciudad" type="text" onkeypress="return ValTexto(event)"  style="width: 300px; height: 40px; margin-bottom: 5px;" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Ciudad..."/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="cordprofesion" name="profesion" onkeypress="return ValTexto(event)"  type="text" style="width: 300px; height: 40px; margin-bottom: 5px;"  class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Escriba la profesi&oacute;n..."/>
                        </td>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="cordinstitucion" name="institucion" onkeypress="return ValTexto(event)"  type="text" style="width: 300px; height: 40px; margin-bottom: 5px;" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Instituci&oacute;n a que pertenece..."/>
                        </td>
                    </tr>
                </table>
                <br/>
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                <select id="cordlevelacademico" name="cordlevelacademico" class="custom-select" style="font-size: 14px;; width: 250px; margin-bottom: 20px;">
                    <option value="" selected>Elija el Nivel acad&eacute;mico...</option>
                    <option value="3">Tercer nivel</option>
                    <option value="4">Cuarto nivel</option>
                </select>

                <table id="tableCoord2" style="padding: 0px; margin: auto;">
                    <tr>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="corduser" name="corduser" type="text" placeholder="Usuario..." style="width: 300px; height: 40px; margin-bottom: 5px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" />
                        </td>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="cordpassword" name="cordpassword" type="password" placeholder="Clave..." style="width: 300px; height: 40px; margin-bottom: 5px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" />
                        </td>
                    </tr>
                </table>
            </div>
            <br/>
            <input type="button" id="saveCoord" class="btn-submit" value="Guardar" style="margin-bottom: 20px;">
        </form>
        <br/>
        <div id="resultC" style="color: red" ></div>
        <br/>
    </div>
</div>
<!--  End  Modal  -->       

<!--    Modal Autores --> 
<div class="overlay" id="overlay2" style="z-index: 100">
    <div class="popup" id="popup2" style="width: 700px; padding: 10px;">
        <a id="btn-cerrar-popup2" class="btn-cerrar-popup">X</a>
        <h3>REGISTRAR AUTOR</h3>
        <form id="form2">
            <div class="contenedor-inputs">
                <table id="tableAutor" style="padding: 0px; margin: auto;">
                    <tr>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="autornombre" name="autornombre" type="text" placeholder="Nombres..." onkeypress="return ValTexto(event)"  style="width: 300px; height: 40px; margin-bottom: 5px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required minlength="1" maxlength="50" />
                        </td>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="autorapellido" name="autorapellido" type="text" placeholder="Apellidos..." onkeypress="return ValTexto(event)"  style="width: 300px; height: 40px; margin-bottom: 5px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required minlength="1" maxlength="50" />
                        </td>
                    </tr>   
                    <tr>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="autoridentificacion" name="autoridentificacion" type="text" placeholder="CI, Pasaporte, etc..." onkeyUp="return ValNumero(this);" style="width: 300px; height: 40px; margin-bottom: 5px;" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required minlength="1" maxlength="15" />
                        </td>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input type="date" id="autorfechaNacimiento" min="1930-01-01" max="2010-12-31"name="autorfechaNacimiento" style="width: 300px; height: 40px; margin-bottom: 5px;"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="autoremail" name="autoremail" type="text" style="width: 300px; height: 40px; margin-bottom: 5px;" required minlength="8" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Correo electr&oacute;nico..."/>
                        </td>
                        <td>
                            <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                            <input id="autorcarrera" name="carrera" type="text" onkeypress="return ValTexto(event)"  style="width: 300px; height: 40px; margin-bottom: 5px;" required minlength="10" maxlength="100" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Carrera que cursa..."/>
                        </td>
                    </tr>
                </table>
            </div>
            <br/>
            <input type="button" id="saveAutor" class="btn-submit" value="Guardar" style="margin-bottom: 20px;">
        </form>
        <br/>
        <div id="resultA" style="color: red" ></div>
        <br/>
    </div>
</div>
<!-- End modal-->

<!-- Eventos para abrir los modals -->
<script>
    var btnAbrirPopup = document.getElementById("btn-abrir-popup"),
            overlay = document.getElementById('overlay'),
            popup = document.getElementById('popup'),
            btnCerrarPopup = document.getElementById('btn-cerrar-popup');

    var btnAbrirPopup2 = document.getElementById("btn-abrir-popup2"),
            overlay2 = document.getElementById('overlay2'),
            popup2 = document.getElementById('popup2'),
            btnCerrarPopup2 = document.getElementById('btn-cerrar-popup2');

    btnAbrirPopup.addEventListener('click', function (e) {
        e.preventDefault();
        overlay.classList.add('active');
        popup.classList.add('active');
    });

    btnAbrirPopup2.addEventListener('click', function (e) {
        e.preventDefault();
        console.log(overlay2);
        overlay2.classList.add('active');
        popup2.classList.add('active');
    });

    btnCerrarPopup.addEventListener('click', function (e) {
        e.preventDefault();
        overlay.classList.remove('active');
        popup.classList.remove('active');
    });

    btnCerrarPopup2.addEventListener('click', function (e) {
        e.preventDefault();
        overlay2.classList.remove('active');
        popup2.classList.remove('active');
    });

</script>

<!-- script para guardar datos de los coordinadores y autores-->

<script>
    $('#saveAutor').click(function (e) {
        var jSon = {};
        var carrera = $('#autorcarrera').data("data");
        jSon.identificacion = $('#autoridentificacion').val();
        jSon.nacimiento = $('#autorfechaNacimiento').val().toString();
        jSon.nombre = $('#autornombre').val();
        jSon.apellido = $('#autorapellido').val();
        jSon.email = $('#autoremail').val().toString();
        if(jSon.identificacion.length === 0){
            $("#autoridentificacion").prev().show();
        } else {
            $("#autoridentificacion").prev().hide();
        }
        if(jSon.nacimiento.length === 0){
            $("#autorfechaNacimiento").prev().show();
        } else {
            $("#autorfechaNacimiento").prev().hide();
        }
        if(jSon.nombre.length === 0){
            $("#autornombre").prev().show();
        } else {
            $("#autornombre").prev().hide();
        }
        if(jSon.apellido.length === 0){
            $("#autorapellido").prev().show();
        } else {
            $("#autorapellido").prev().hide();
        }
        if(jSon.email.length === 0){
            $("#autoremail").prev().show();
        } else {
            $("#autoremail").prev().hide();
        }
        if(!carrera){
            $("#autorcarrera").prev().show();
        } else {
            $("#autorcarrera").prev().hide();
        }
        if(jSon.identificacion.length > 0 && jSon.nacimiento.length > 0 && jSon.nombre.length > 0 && jSon.apellido.length > 0 && jSon.email.length > 0 && carrera) {
            var button = this;
            $(button).prop("disabled", true);
            jSon.carreraid = carrera.id_carrera;
            jSon.transact = "insert";
            $.ajax({
                type: "POST",
                url: serverURL + "TransactAutor",
                data: jSon,
                cache: false,
                dataType: "json",
                beforeSend: function (xhr) {
                },
                success: function (data, textStatus, jqXHR) {
                    $("#autoridentificacion").val("");
                    $("#autorfechaNacimiento").val("");
                    $("#autornombre").val("");
                    $("#autorapellido").val("");
                    $("#autoremail").val("");
                    $("#autorcarrera").data("data", null);
                    alert(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $(button).prop("disabled", false);              
                    alert(jqXHR + "\n" + textStatus + "\n" + errorThrown);
                }
            });
        }
    });

    $('#saveCoord').click(function (e) {
        var jSon = {};
        jSon.user = $('#corduser').val();
        jSon.password = $('#cordpassword').val();
        jSon.nombre = $('#cordnombre').val();
        jSon.apellido = $('#cordapellido').val();
        jSon.identificacion = $('#cordidentificacion').val();
        jSon.nacimiento = $('#cordfechaNacimiento').val().toString();
        jSon.email = $('#cordemail').val();
        jSon.direccion = $('#corddireccion').val();
        jSon.nivelacademico = $('#cordlevelacademico').val();
        var ciudad = $("#cordciudad").data("data");
        var profesion = $('#cordprofesion').data("data");
        var institucion = $('#cordinstitucion').data("data");
        if(jSon.user.length === 0){
            $("#corduser").prev().show();
        } else {
            $("#corduser").prev().hide();
        }
        if(jSon.password.length === 0){
            $("#cordpassword").prev().show();
        } else {
            $("#cordpassword").prev().hide();
        }
        if(jSon.nombre.length === 0){
            $("#cordnombre").prev().show();
        } else {
            $("#cordnombre").prev().hide();
        }
        if(jSon.apellido.length === 0){
            $("#cordapellido").prev().show();
        } else {
            $("#cordapellido").prev().hide();
        }
        if(jSon.identificacion.length === 0){
            $("#cordidentificacion").prev().show();
        } else {
            $("#cordidentificacion").prev().hide();
        }
        if(jSon.nacimiento.length === 0){
            $("#cordfechaNacimiento").prev().show();
        } else {
            $("#cordfechaNacimiento").prev().hide();
        }
        if(jSon.email.length === 0){
            $("#cordemail").prev().show();
        } else {
            $("#cordemail").prev().hide();
        }
        if(jSon.direccion.length === 0){
            $("#corddireccion").prev().show();
        } else {
            $("#corddireccion").prev().hide();
        }
        if(jSon.nivelacademico.length === 0){
            $("#cordlevelacademico").prev().show();
        } else {
            $("#cordlevelacademico").prev().hide();
        }
        if(!ciudad){
            $("#cordciudad").prev().show();
        } else {
            $("#cordciudad").prev().hide();
        }
        if(!profesion){
            $("#cordprofesion").prev().show();
        } else {
            $("#cordprofesion").prev().hide();
        }
        if(!institucion){
            $("#cordinstitucion").prev().show();
        } else {
            $("#cordinstitucion").prev().hide();
        }
        if (jSon.user.length > 0 && jSon.password.length > 0 && jSon.nombre.length > 0 && jSon.apellido.length > 0 && jSon.identificacion.length > 0
                && jSon.nacimiento.length > 0 && jSon.email.length > 0 && jSon.direccion.length > 0 && jSon.nivelacademico.length > 0 && ciudad
                && profesion && institucion) {
            var button = this;
            $(button).prop("disabled", true);
            jSon.ciudad = ciudad.idCiudad;
            jSon.profesion = profesion.profesionID;
            jSon.institucion = institucion.institucionID;
            jSon.transact = "insert";
            $.ajax({
                type: "POST",
                url: serverURL + "TransactCoordinador",
                data: jSon,
                cache: false,
                dataType: "json",
                beforeSend: function (xhr) {
                },
                success: function (data, textStatus, jqXHR) {
                    $("#corduser").val("");
                    $("#cordpassword").val("");
                    $("#cordnombre").val("");
                    $("#cordapellido").val("");
                    $("#cordidentificacion").val("");
                    $("#cordfechaNacimiento").val("");
                    $("#corddireccion").val("");
                    $("#cordlevelacademico").val("");
                    $("#cordciudad").data("data", null);
                    $("#cordprofesion").data("data", null);
                    $("#cordinstitucion").data("data", null);
                    $(button).prop("disabled", false);
                    alert(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $(button).prop("disabled", false);            
                    alert(jqXHR + "\n" + textStatus + "\n" + errorThrown);
                }
            });
        }
    });

    $("#guardarPI").click(function (e) {
        var jSon = {};
        var vectorAutores = [];
        var vectorVariables = [];
        //var vectorTipos = [];
        var tbda = $("#cuerpoAutores tr");
        var tbdv = $("#cuerpoVariables tr");
        $.each(tbda, function (i, item) {
            var celdas = $(item).find("td");
            var msj = $($(celdas[0]).children("input")[0]).data("data");
            if (msj) {
                msj.id_autor && vectorAutores.push(msj.id_autor);
            }
        });
        $.each(tbdv, function (i, item) {
            var celdas = $(item).find("td");
            var msj = $($(celdas[0]).children("input")[0]).val();
            var msj2 = $($(celdas[1]).children("select")[0]).val();
            var obj = {};
            if (msj) {
                //vectorVariables.push(msj);
                obj.valorvariable = msj;
            }
            if (msj2) {
                //vectorTipos.push(msj2)
                obj.tipovariable = msj2;
            }
            vectorVariables.push(obj);
        });
        var sampleFile = document.getElementById("url").files[0];
        var formdata = new FormData();
        formdata.append("titulo", $('#titulo').val());
        formdata.append("modulo", $("#modulo").val());
        formdata.append("periodolectivo", $("#periodo").val());
        formdata.append("anio", $("#anio").val());
        formdata.append("objetivo", $("#objetivo").val());
        formdata.append("resumen", $("#resumen").val());
        formdata.append("coordinador", $("#coordinador").data("data").idUsuario);
        formdata.append("autores", vectorAutores);
        formdata.append("variables", JSON.stringify(vectorVariables));
        //formdata.append("tipos", vectorTipos);
        formdata.append("archivo", sampleFile);

        var xhr = new XMLHttpRequest();
        xhr.open("POST", serverURL + "TransactProyecto", true);
        //xhr.setRequestHeader('Content-Type', 'multipart/form-data');
        xhr.send(formdata);
        xhr.onload = function (e) {
            if (this.status == 200) {
                alert(this.responseText);
            }
        };
    });

</script>