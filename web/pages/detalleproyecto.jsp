<%@page import="org.Object.Autor"%>
<%@page import="org.Object.Variable"%>
<%@page import="org.Controladores.ProyectoController"%>
<%@page import="org.Object.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Proyecto p = new ProyectoController().getProyecto(request.getParameter("id"));
%>

<div class="contenedor bcrumbSt" style="margin-top: 100px;">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page"><a href="javascript:paginacion('pages/repositorioDocentes.html')">Inicio</a></li>
            <li class="breadcrumb-item active" aria-current="page"><a href="javascript:paginacion('pages/repositorioProyectos.html')">Proyectos</a></li>
            <li class="breadcrumb-item active" aria-current="page">Detalle</li>
        </ol>
    </nav>

    <form action="" method="post" style=" margin-bottom: 100px;" >
        <div style="display: flex; flex-wrap: wrap; font-size: 30px; font-weight: 700; text-transform: uppercase;">
            <p style="margin-right: 7px;">Descargar proyecto</p>
        </div>
        <div >
            <a class="page-link" download="" style="margin-bottom: 5px;" href="<%=p.getUrl()%>">Descargar</a>
        </div>
        <div>
            <p class="iniCabTitulo" style="text-align: justify;">Titulo:</p>
            <label id="txtTitulo" style="text-align: justify; margin-bottom: 20px;"><%= p.getTitulo()%></label>
        </div>
        <!-- Tabla de Autores -->
        <div>
            <p class="iniCabTitulo" style="text-align: justify;">Autores:</p>
            <table class="table table-striped">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Nombres</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Email</th>
                    </tr>
                </thead>
                <tbody >
                    <%
                        for (Autor a : p.getAutores()) {
                    %>
                    <tr>
                        <td><%=a.getNombre()%></td>
                        <td><%=a.getApellido()%></td>
                        <td><%=a.getEmail()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div>
            <p class="iniCabTitulo">Coordinador:</p>
            <label style="text-align: justify;margin-bottom: 20px;" ><%= p.getCoordinador().getNombre() + " " + p.getCoordinador().getApellido()%> </label>
        </div>
        <!-- Tabla de Modulo - Periodo -->
        <div>
            <table id="myTable" class="table" style="width: 100%;">
                <tbody>
                    <tr>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Modulo:</td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"><%= p.getSemestre()%></td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Periodo Lectivo:</td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"> <%= p.getPeriodo()%></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <p class="iniCabTitulo" style="text-align: justify;">Resumen:</p>
            <label id="txtResumen" style="text-align: justify; margin-bottom: 20px;" ><%= p.getResumen()%></label>
        </div>
        <div>
            <p class="iniCabTitulo" style="text-align: justify;">Objetivo:</p>
            <label id="txtObjetivo" style="text-align: justify; margin-bottom: 20px;" ><%= p.getObjetivo()%></label>
        </div>
        <!-- Tabla de Variables -->
        <div>
            <p class="iniCabTitulo" style="text-align: justify;">Variables:</p>
            <table class="table table-striped">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Tipo</th>
                    </tr>
                </thead>
                <tbody >
                    <%
                        for (Variable v : p.getVariables()) {
                    %>
                    <tr>
                        <td><%=v.getVariable()%></td>
                        <td><%=v.getTipo()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </form>

</div>
