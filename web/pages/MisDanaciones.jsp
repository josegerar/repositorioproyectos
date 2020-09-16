<%-- 
    Document   : MisDonaciones
    Created on : 20-ene-2020, 22:00:40
    Author     : cris_
    Donaciones que se ha realizado
--%>

<%@page import="org.DAO.ConexionMySQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% ConexionMySQL con = new ConexionMySQL();
    HttpSession sesion = request.getSession(false);
    String id = String.valueOf(sesion.getAttribute("id"));
%>  

<div  style="width: 90%;margin-left: 5%; z-index: 10000000; background: #fff; ">
    <nav aria-label="breadcrumb" style="margin-top: 10px; width: 90%; margin-left: 5%;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">Aprobacion de Dataset</li>
        </ol>
    </nav>
</div>

<p class="regisTitulo"> Mis Donaciones</p>

<div class="IniContPrim">
    <div class="IniContSecDe">
        <div class="iniContCab">
        </div>
        <hr class="hrInic">
        <form action="InsertDonac" method="post">

            <div class="IniContCardsBusq" id="contenedores"style="margin-bottom: 100px; width: 90%; margin-left: 5%">
                <table id="example"  data-order='[[ 5, "asc" ]]' data-page-length='10' class="table table-sm table-striped table-hover table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th style="visibility: hidden" scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Resumen</th>
                            <th scope="col">Tarea</th>
                            <th scope="col">Tipo de Datos</th>
                            <th scope="col">Estado</th>

                            <th scope="col">Observación</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--Muestra en una tabla todas mis donaciones--> 
                        <%
                            String query = "select idDonaciones,nombreConjuntoDatos,abstracto,tarea,tipoDatos,validacion,archivoDatos,observacion from donaciones where   Usuario_idUsuario ='" + id + "';";
                            ResultSet leer = con.select(query);
                            while (leer.next()) {
                        %>
                        <tr>
                            <td style="visibility: hidden" ><%= leer.getString("idDonaciones")%></td>
                            <th scope="row"> <a class="nav-link" href="javascript:void(0)" onclick="paginacion('pages/Donar.jsp?id=<%= leer.getString("idDonaciones")%>&us=<%=sesion.getAttribute("usuario")%>')"><%= leer.getString("nombreConjuntoDatos")%></a></th>
                            <td><%= leer.getString("abstracto")%></td>
                            <td><%= leer.getString("tarea")%></td>
                            <td><%= leer.getString("tipoDatos")%></td>
                            <td><%= leer.getString("validacion")%></td>
                            <td><%= leer.getString("observacion")%></td>
                        </tr>
                        <%
                            }
                            leer.close();
                        %>
                    </tbody>
                </table>

            </div>
        </form>
    </div>
</div>  

<!-- ajax -->
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
            "columnDefs": [
                {
                    "targets": [0],
                    "visible": false,
                    "searchable": false
                }
            ],
            "language": {
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
            },
            fixedColumns: {
                heightMatch: 'auto'
            }
        });
    });
</script>