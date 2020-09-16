<%-- 
    Document   : Aprobacion
    Created on : Jan 31, 2020, 12:57:09 PM
    Author     : USUARIO
    fORMULARIO DISEÑADO PARA APROBAR O RECHAZAR LOS CONJUNTO DE DATOS SUBIDOS PARA LOS USUARIOS ESTE FORMULARIO
    SOLO ES MOSTRADO A EL ADMINISTRADOR
--%>

<%@page import="org.DAO.ConexionMySQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ConexionMySQL con = new ConexionMySQL();
%> 
<div  style="width: 90%;margin-left: 5%; z-index: 10000000; background: #fff; ">
    <nav aria-label="breadcrumb" style="margin-top: 10px; width: 90%; margin-left: 5%;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">Inicio</li>
        </ol>
    </nav>
</div>
<div class="contenedor bcrumbSt">


</div>

<div class="IniContPrim">
    <div class="IniContSecDe">
        <div class="iniContCab">
        </div>
        <hr class="hrInic">

        <div class="IniContCardsBusq" id="contenedores"style="margin-bottom: 100px;">
            <table id="example"  data-order='[[ 5, "asc" ]]' data-page-length='10' class="table table-sm table-striped table-hover table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th style="visibility: hidden" scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Resumen</th>
                        <th scope="col">Tarea</th>
                        <th scope="col">Tipo de Datos</th>
                        <th scope="col">Numero de Atributos</th>
                        <th scope="col">Archivo</th>
                        <th scope="col">Observación</th>
                        <th scope="col">Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <!--Carga la tabla de conjunto de datos que no estan aprobados-->
                    <%                                    String query = "select idDonaciones,nombreConjuntoDatos,abstracto,tarea,tipoDatos,numeroAtributos,archivoDatos from donaciones where validacion is null or validacion='' order by nombreConjuntoDatos desc";
                        ResultSet leer = con.select(query);
                        while (leer.next()) {
                    %>
                    <tr>
                        <td style="visibility: hidden"><%= leer.getString("idDonaciones")%></td>
                        <th scope="row"> <a class="nav-link" href="javascript:paginacion('pages/DetalleCD.jsp?id=<%= leer.getString("idDonaciones")%>')"><%= leer.getString("nombreConjuntoDatos")%></a></th>
                        <td><%= leer.getString("abstracto")%></td>
                        <td><%= leer.getString("tarea")%></td>
                        <td><%= leer.getString("tipoDatos")%></td>
                        <td><%= leer.getString("numeroAtributos")%></td>
                        <td><a href="<%= leer.getString("archivoDatos")%>" >Descargar Archivo</a></td>
                <form  action="AprobarDenegar" onsubmit="return alertaR()">
                    <td><textarea id="ta" name="observacion" onkeypress="validaCaractaer(event);" rows="4" cols="25" maxlength="200"></textarea></td>
                    <input type="hidden" id="id" name="id" class="btn btn-success" value="<%= leer.getString("idDonaciones")%>"/>
                    <input type="hidden" id="opcion" name="opcion" class="btn btn-success" value="2">
                    <input type="hidden" name="archivo" class="btn btn-success" value="<%= leer.getString("archivoDatos")%>">
                    <td class="text-center" style="display: flex; "><input type="submit" class="btn btn-danger" value="Rechazar">
                </form>
                &nbsp;&nbsp;
                <form action="AprobarDenegar" onsubmit="return alerta()">
                    <input type="hidden"  name="id" class="btn btn-success" value="<%= leer.getString("idDonaciones")%>"/>
                    <input type="hidden" name="opcion" class="btn btn-success" value="1">
                    <input type="submit" class="btn btn-success" value="  Aprobar ">
                </form>
                </td>
                </tr>
                <%}%>
                </tbody>

            </table>
            <div style="float: right;">    
                <input type="button"  value="<"name="btnatras" onclick="dec()" style="background: #2079C5; border: none; color: #fff; width: 40px; height: 35px; border-radius: 5px;" class="btn-default waves-effect waves-light">
                <input type="button" id="btnAV" name="paginaN" value="1" style="background: #F5F5F5; border: none; color: #666666; width: 40px; height: 35px; border-radius: 5px;" class=" waves-effect waves-light">
                <input type="button"  value=">" name="btnsig" onclick="ad()" style="background: #2079C5; border: none; color: #fff; width: 40px; height: 35px; border-radius: 5px;" class="btn-default waves-effect waves-light">
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("ta").addEventListener("keypress", verificar);
    function verificar(e) {

        // comprovamos con una expresion regular que el caracter pulsado sea
        // una letra, numero o un espacio
        if (e.key.match(/[a-z0-9ñçáéíóú\s]/i) === null) {
            // Si la tecla pulsada no es la correcta, eliminado la pulsación
            e.preventDefault();
        }
    }
</script>    
<!-- ajax y validaciones de la página -->
<script>

    function alerta()
    {
        var opcion = confirm("Esta seguro que desea publicar el conjunto de datos seleccionado.");
        if (opcion == true) {
            return true;
        } else {
            return false;
        }
    }

    function alertaR()
    {
        var opcion = confirm("Esta seguro que desea eliminar este conjunto de datos.");
        if (opcion == true) {
            return true;
        } else {
            return false;
        }
    }
</script>
<script type="text/javascript" >
    $(document).ready(function () {
        $('#example').DataTable({
            "columnDefs": [{
                    "targets": 0
                }],
            language: {
                "sProcessing": "Procesando...",
                "sLengthMenu": "Mostrar _MENU_ resultados",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
                "sInfo": "Mostrando resultados _START_-_END_ de  _TOTAL_",
                "sInfoEmpty": "Mostrando resultados del 0 al 0 de un total de 0 registros",
                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sSearch": "Buscar:",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                }
            }
        });
    });
</script>