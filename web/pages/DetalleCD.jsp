<%-- 
    Document   : DetalleCD
    Created on : 14-ene-2020, 1:09:24
    Author     : cris_
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.DAO.ConexionMySQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession(false);
%>
<%-- Carga la informacion del dataset seleccionado para mostrarla en cada campo--%>
<%            Connection con = ConexionMySQL.getConnectionE();
    PreparedStatement ps;
    ResultSet rs;
    int id = Integer.parseInt(request.getParameter("id"));
    int insta = 0, numAtr = 0, NumVis = 0, FechaD = 0, IdDon = 0;
    String nom = "", abstra = "", caract = "", zona = "", docRel = "", solicCita = "", carAtr = "", Tarea = "", Na = "", Fuente = "", InfAtr = "", InfCD = "", NombArc = "";
    ps = con.prepareStatement("Select * from Donaciones where idDonaciones=" + id);
    rs = ps.executeQuery();
    while (rs.next()) {
        IdDon = rs.getInt("IdDonaciones");
        nom = rs.getString("nombreConjuntoDatos");
        abstra = rs.getString("abstracto");
        insta = rs.getInt("numeroInstancia");
        numAtr = rs.getInt("numeroAtributos");
        NumVis = rs.getInt("numeroVisitas");
        caract = rs.getString("tipoDatos");
        zona = rs.getString("zona");
        carAtr = rs.getString("tipoAtributo");
        FechaD = rs.getInt("anio");
        Tarea = rs.getString("tarea");
        Na = rs.getString("valoresFaltantes");
        Fuente = rs.getString("fuente");
        InfAtr = rs.getString("infoRelevante");
        InfCD = rs.getString("infoAtributo");
        docRel = rs.getString("documentoRelevantes");
        solicCita = rs.getString("solicitudesCitacion");
        NombArc = rs.getString("archivoDatos");
    }

    ConexionMySQL Con2 = new ConexionMySQL();
    Boolean nvisitas = Con2.accion("update donaciones set numeroVisitas='" + String.valueOf(NumVis + 1) + "' where idDonaciones='" + IdDon + "';");

%>
<div  style="width: 90%;margin-left: 5%; z-index: 10000000; background: #fff; ">
    <nav aria-label="breadcrumb" style="margin-top: 10px; width: 90%; margin-left: 5%;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">Inicio</li>
        </ol>
    </nav>
</div>
<div class="contenedor bcrumbSt" >

    <form action="" method="post" style=" margin-bottom: 100px;" >
        <div style="display: flex; flex-wrap: wrap; font-size: 30px; font-weight: 700; text-transform: uppercase;">
            <p style="margin-right: 7px;">Descargar el conjunto de Datos</p>
            <label name="txtNombres"><%= nom%></label>
        </div>
        <div >
            <%
                if (sesion.getAttribute("usuario") != null) {%>
            <a class="page-link" style="margin-bottom: 5px;" href="<%=NombArc%>">Descargar</a>
            <% } else {%>
            <a class="page-link" style="margin-bottom: 5px;" href="">Descargar</a>

            <% }
            %>
        </div>
        <div>
            <p class="iniCabTitulo" style="text-align: justify;">Resumen:</p>
            <label name="txtNombres" style="text-align: justify; margin-bottom: 20px;" ><%= abstra%></label>
        </div>

        <div>

            <table id="myTable" class="table" style="width: 100%;">

                <tbody>

                    <tr>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Características del conjunto de datos:   </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"> <%= caract%> </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; "> Número de instancias:  </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; ">  <%= insta%></td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Zona: </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; "><%= zona%> </td>
                    </tr>

                    <tr>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF;font-weight: 600;  ">Características del atributo:  </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"> <%= carAtr%> </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; "> Número de atributos: </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; "> <%= numAtr%></td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF;font-weight: 600;  ">Año de recopilación </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; "> <%= FechaD%></td>
                    </tr>

                    <tr>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Tareas asociadas:  </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;"> <%= Tarea%> </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; "> ¿Valores faltantes?</td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; "> <%= Na%> </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF ;background:#E9ECEF; font-weight: 600; ">Número de visitas web: </td>
                        <td style="border-style: solid; border-width: 2px; border-color: #E9ECEF; "> <%= NumVis%></td>
                    </tr>

                </tbody>


            </table>
        </div>
        <div>
            <p class="iniCabTitulo">Fuente:</p>
            <label style="text-align: justify;margin-bottom: 20px;" ><%= Fuente%></label>
        </div>
        <div>
            <p class="iniCabTitulo">Información del conjunto de datos:</p>
            <label  style="text-align: justify; margin-bottom: 20px;"><%= InfAtr%></label>
        </div>
        <div>
            <p class="iniCabTitulo">Información del atributo:</p>
            <label style="text-align: justify; margin-bottom: 20px;" ><%= InfCD%></label>
        </div>
        <div>
            <p class="iniCabTitulo">Documentos relevantes:</p>
            <label  style="text-align: justify; margin-bottom: 20px;"><%= docRel%></label>
        </div>

    </form>   

</div>

