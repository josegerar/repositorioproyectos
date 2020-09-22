<%@page import="org.Object.Autor"%>
<%@page import="org.Object.Variable"%>
<%@page import="org.Controladores.ProyectoController"%>
<%@page import="org.Object.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Proyecto p = new ProyectoController().getProyecto(request.getParameter("id"));
%>
<div  style="width: 90%;margin-left: 5%; z-index: 10000000; background: #fff; ">
    <nav aria-label="breadcrumb" style="margin-top: 10px; width: 90%; margin-left: 5%;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">Inicio</li>
        </ol>
    </nav>
</div>
<div style="display: flex;">
    <div class="bcrumbSt" style="width: 50%; margin-left: 5%; margin-right: 5%">



        <form action="" method="post" style=" margin-bottom: 100px;" >
            <div style="display: flex; flex-wrap: wrap; font-size: 30px; font-weight: 700; text-transform: uppercase;">
                <p style="margin-right: 7px;">Descargar proyecto</p>
            </div>
            <div style="display: flex;">
                <!--<a class="btn btn-primary btn-lg" download="" style="margin-bottom: 5px;" href="<%=p.getUrl()%>">Descargar</a>
                <a class="btn btn-primary btn-lg" style="margin-bottom: 5px;" href="<%=p.getUrl()%>">Editar</a>-->
                <a class="nav-link form-control" style="color: black; text-align: center;" download="" href="<%=p.getUrl()%>">
                    <i class="fa fa-home"></i>
                    Descargar
                </a>
                <a class="nav-link form-control" style="color: black; text-align: center;" href="javascript:void(0)" onclick="paginacion('editarProyecto.html', {id:<%=p.getId()%>, type: 'editar'})">
                    <i class="fa fa-home"></i>
                    Editar
                </a>
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
                            <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"><%= p.getSemestre()%> Semestre</td>
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
                                String tipo = "";
                                if (v.getTipo().equals("I")) {
                                    tipo = "Independiente";
                                } else if (v.getTipo().equals("D")) {
                                    tipo = "Dependiente";
                                }
                        %>
                        <tr>
                            <td><%=v.getVariable()%></td>
                            <td><%=tipo%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </form>

    </div>
    <div style="width: 50%">
        <embed src="<%=p.getUrl()%>" type="application/pdf" width="100%" height="1000px" />
    </div>
</div>