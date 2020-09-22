<%@page import="org.Object.Variable"%>
<%@page import="org.Object.Autor"%>
<%@page import="org.Controladores.ProyectoController"%>
<%@page import="org.Object.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Proyecto p = null;
    String type = request.getParameter("type");
    String periodo = "";
    String año = "";
    if (type.equals("editar")) {
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

    <form id="datosproyectointegrador">
        <div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Coordinador</span>
                </div>
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                <% if (type.equals("editar")) {%>
                <input type="text" placeholder="Escriba el coordinador..." value="<%=p.getCoordinador().getNombre()%> <%=p.getCoordinador().getApellido()%>" id="coordinador" name="coordinador" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">    
                <script>
                    $('#coordinador').data("data", {idUsuario: <%=p.getCoordinador().getIdUsuario()%>});
                </script>
                <%} else {%>  
                <input type="text" placeholder="Escriba el coordinador..." id="coordinador" name="coordinador" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">    
                <%}%>
                <button id="btn-abrir-popup" class="btn btn-primary btn-lg" style="margin-bottom: 0px; margin-top: 0px; margin-right: 0px; width: 70px; height: 40px; padding: 0; font-size: 15px;">A&ntilde;adir</button>
            </div>

            <table id="general" style="width: 15px; height: 15px; margin-bottom: 10px;">
                <tbody>

                    <tr>
                        <td class="input-group-text" style="height: 40px; width: 200px;" >
                            Autores
                            <i id="imgerrorautores" class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                        </td>
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
                    // Aqui se crean los actores
                    function agregarAutor(nombre, data) {
                        var tb = $('#autorTb tbody');
                        var textClone = $('<input>', {
                            id: 'autor' + cont1,
                            class: 'form-control autocomplete-sql ob-blur-sql',
                            name: 'autor',
                            value: nombre,
                            type: 'text',
                            style: 'width: 413px; height: 40px;',
                            placeholder: 'Busqueda del autor...'
                        });
                        textClone.data("data", data);
                        var colText = $('<td>').append(textClone);
                        var div = $('<div class="estilobutton" style="width: 40px; higth: 40px; text-align: center; cursor: pointer;" ><a onclick="agregarAutor(\'\', null)"><i class="fa fa-plus" aria-hidden="true"></i></a></div>');
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
                    $(function () {
                    <% if (type.equals("editar")) {
                            for (Autor a : p.getAutores()) {
                    %>
                        agregarAutor("<%=a.getNombre()%> <%=a.getApellido()%>", {
                                    "id_autor": <%=a.getId_autor()%>
                                });
                    <%
                        }
                    } else {%>
                                agregarAutor("", null);
                    <%}%>
                            });
                </script>
                </tr>
            </table>


            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default" style="width: 200px; ">Titulo</span>
                </div>
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                <% if (type.equals("editar")) {%>
                <input type="text" placeholder="Escriba el titulo..." value="<%=p.getTitulo()%>"  onpaste="return false" id="titulo" name="titulo" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">

                <%} else {%> 
                <input type="text" placeholder="Escriba el titulo..." onpaste="return false" id="titulo" name="titulo" class="form-control autocomplete-sql ob-blur-sql" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                <%}%>
            </div>


            <div class="input-group mb-3">
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
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
                <%if (type.equals("editar")) {%>
                <script>
                    $("#modulo option").each(function () {
                        if ($(this).val() === "<%=p.getSemestre()%>") {
                            $("#modulo option[value=" + $(this).val() + "]").attr("selected", true);
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
                <%if (type.equals("editar")) {
                        String[] periodoAcademico = p.getPeriodo().split(" ");
                        if (periodoAcademico.length >= 2) {
                            periodo = periodoAcademico[0];
                            año = periodoAcademico[1];
                        }
                %>
                <script>
                    $("#periodo option").each(function () {
                        if ($(this).val() === "<%=periodo%>") {
                            $("#periodo option[value=" + $(this).val() + "]").attr("selected", true);
                        }
                    });
                </script>
                <%}%> 
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                <% if (type.equals("editar")) {%>
                <input type="number" value="<%=año%>" placeholder="Elija el a&ntilde;o..." onpaste="return false" min="1970" max="2050" maxlength="2050" minlength="1970" onkeyUp="return ValNumero(this);" id="anio" name="anio" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                <%} else {%> 
                <input type="number" placeholder="Elija el a&ntilde;o..." onpaste="return false" min="1970" max="2050" maxlength="2050" minlength="1970" onkeyUp="return ValNumero(this);" id="anio" name="anio" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                <%}%>

                <div class="input-group-append">
                    <label class="input-group-text" for="inputGroupSelect02" style="width: 170px;">Periodo Academico</label>
                </div>             
            </div>         

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Objetivo General</span>
                </div>
                <i class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none" aria-hidden="true"></i>
                <% if (type.equals("editar")) {%>
                <input type="text" value="<%= p.getObjetivo()%>" onpaste="return false" onkeypress="return ValTexto(event)" id="objetivo" name="objetivo" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                <%} else {%> 
                <input type="text" onpaste="return false" onkeypress="return ValTexto(event)" id="objetivo" name="objetivo" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                <%}%>
            </div>    

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Resumen</span>
                </div>
                <% if (type.equals("editar")) {%>
                <textarea  rows="6" id="resumen" name="resumen" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2"><%= p.getResumen()%></textarea>
                <%} else {%> 
                <textarea rows="6" id="resumen" name="resumen" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2"></textarea>
                <%}%>
            </div> 

            <table id="generalVariable" style="width: 15px; height: 15px; margin-bottom: 10px;">
                <tbody>

                    <tr>
                        <td class="input-group-text" style="height: 40px; width: 200px;" >
                            Variables
                            <i id="imgerrorvariables" class="fa fa-exclamation-triangle fa-2" style="color: red; margin: auto; display: none; float: left;" aria-hidden="true"></i>
                        </td>
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
                    // Aqui se crean los actores
                    function agregarVariable(nombre, data) {
                        var tb = $('#variableTb tbody');
                        var textCloneVar = $('<input>', {
                            id: 'variable' + cont2,
                            class: 'form-control autocomplete-sql ob-blur-actor-sql',
                            name: 'variable' + cont2,
                            value: nombre,
                            type: 'text',
                            style: 'width: 350px; height: 40px;',
                            placeholder: 'Escriba la variable...'
                        });
                        textCloneVar.data("data", data);
                        var textCloneTipo = $('<select class="custom-select" style="width: 145px; height: 40px;" required="true"><option value="I">Independiente</option><option value="D">Dependiente</option></select>');
                        if (data) {

                            $(textCloneTipo).find('option[value="' + data.tipo + '"]').attr("selected", true);
                        }
                        var colTextVar = $('<td>').append(textCloneVar);
                        var colTextTipo = $('<td>').append(textCloneTipo);
                        var div = $('<div class="estilobutton" style="width: 40px; higth: 40px; text-align: center; cursor: pointer;" ><a onclick="agregarVariable(\'\', null)"><i class="fa fa-plus" aria-hidden="true"></i></a></div>');
                        var div2 = $('<div class="estilobutton" style="width: 40px; higth: 40px; text-align: center; cursor: pointer;" ><a onclick="borrarFilaVariable(\'fVariable' + cont2 + '\',' + "'variableTb'" + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></div>');
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

                    $(function () {
                    <% if (type.equals("editar")) {
                            for (Variable v : p.getVariables()) {
                    %>
                        agregarVariable("<%=v.getVariable()%>", {
                            "id": "<%=v.getId()%>",
                            "tipo": "<%=v.getTipo()%>",
                            "variable": "<%=v.getVariable()%>"
                        });
                    <%
                        }
                    } else {%>
                        agregarVariable("", null);
                    <%}%>
                    });
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
            <button id="cancelarPI" type="button" class="btn btn-secondary btn-lg" style="width: 48%">Cancelar</button>
        </div>
    </form>
</div> 

<!--    Modal Coordinadores -->    
<%@include file="../WEB-INF/jspf/registrarcoordinador.jspf" %>
<!--  End  Modal  -->       

<!--    Modal Autores --> 
<%@include file="../WEB-INF/jspf/registrarautor.jspf" %>
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
    });</script>

<!-- script para guardar datos de los coordinadores y autores-->

<script>
    
    $("#cancelarPI").click(function (e) {
        paginacion('repositorioProyectos.html');
    });
    
    $("#guardarPI").click(function (e) {
        var jSon = {};
        var isValid = true;
        var vectorAutores = [];
        var vectorVariables = [];
        var tbda = $("#cuerpoAutores tr");
        var tbdv = $("#cuerpoVariables tr");
        $.each(tbda, function (i, item) {
            var celdas = $(item).find("td");
            var autordata = $($(celdas[0]).children("input")[0]).data("data");
            if (autordata) {
                autordata.id_autor && vectorAutores.push(autordata.id_autor);
            }
        });
        if (vectorAutores.length === 0) {
            isValid = false;
            $("#imgerrorautores").show();
        } else {
            $("#imgerrorautores").hide();
        }
        $.each(tbdv, function (i, item) {
            var celdas = $(item).find("td");
            var inputdata = $($(celdas[0]).children("input")[0]).data("data");
            var valorvariable = $($(celdas[0]).children("input")[0]).val();
            var tipovariable = $($(celdas[1]).children("select")[0]).val();
            var obj = {};
            if (inputdata) {
                inputdata.id && (obj.id = inputdata.id);
            }
            if (valorvariable) {
                obj.valorvariable = valorvariable;
            }
            if (tipovariable) {
                obj.tipovariable = tipovariable;
            }
            vectorVariables.push(obj);
        });
        if (vectorVariables.length < 2) {
            isValid = false;
            $("#imgerrorvariables").show();
        } else {
            $("#imgerrorvariables").hide();
        }
        var sampleFile = document.getElementById("url").files[0];

        if (sampleFile) {
            $("#url").prev().hide();
        } else {
            isValid = false;
            $("#url").prev().show();
        }

        var titulo = $('#titulo').val();
        if (titulo && titulo.length > 10) {
            $("#titulo").prev().hide();
        } else {
            isValid = false;
            $("#titulo").prev().show();
        }

        var modulo = $("#modulo").val();
        if (modulo && modulo.length > 0) {
            $("#modulo").prev().hide();
        } else {
            isValid = false;
            $("#modulo").prev().show();
        }

        var periodolectivo = $("#periodo").val();
        if (periodolectivo && periodolectivo.length > 0) {
            $("#periodo").prev().hide();
        } else {
            isValid = false;
            $("#periodo").prev().show();
        }

        var aniolectivo = $("#anio").val();
        if (aniolectivo && aniolectivo.length > 0) {
            $("#anio").prev().hide();
        } else {
            isValid = false;
            $("#anio").prev().show();
        }

        var objetivogeneral = $("#objetivo").val();
        if (objetivogeneral && objetivogeneral.length > 20) {
            $("#objetivo").prev().hide();
        } else {
            isValid = false;
            $("#objetivo").prev().show();
        }

        var resumen = $("#resumen").val();
        if (resumen && resumen.length > 20) {
            $("#resumen").prev().hide();
        } else {
            isValid = false;
            $("#resumen").prev().show();
        }

        var coordinadordata = $("#coordinador").data("data");
        if (coordinadordata && coordinadordata.idUsuario) {
            $("#coordinador").prev().hide();
        } else {
            isValid = false;
            $("#coordinador").prev().show();
        }

        if (isValid) {
            var button = this;
            $(button).prop("disabled", true);
            var formdata = new FormData();
    <%if (type.equals("editar")) {%>
            formdata.append("id", <%=p.getId()%>);
    <%}%>
            formdata.append("titulo", titulo);
            formdata.append("modulo", modulo);
            formdata.append("periodolectivo", periodolectivo);
            formdata.append("anio", aniolectivo);
            formdata.append("objetivo", objetivogeneral);
            formdata.append("resumen", resumen);
            formdata.append("coordinador", coordinadordata.idUsuario);
            formdata.append("autores", JSON.stringify(vectorAutores));
            formdata.append("variables", JSON.stringify(vectorVariables));
            formdata.append("archivo", sampleFile);

            var xhr = new XMLHttpRequest();
            xhr.open("POST", serverURL + "TransactProyecto", true);
            xhr.send(formdata);
            xhr.onload = function (e) {
                $(button).prop("disabled", false);
                if (this.status == 200) {
                    alert(this.responseText);
                    paginacion('repositorioProyectos.html');
                }
            };
            xhr.onerror = function (e) {
                $(button).prop("disabled", false);
                alert(this.responseText);
            };
        }
    });

</script>