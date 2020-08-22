<%-- 
    Document   : ciudad
    Created on : 29/12/2019, 13:25:11
    Author     : Suanny
    Cargar ciudad formulario modal para el formulario de Registro de usuarios
--%>
<%@page import="org.Object.Usuario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="org.Object.Ciudad"%>
<%@page import="org.Object.Provincia"%>
<%@ page import = "org.DAO.ConexionMySQL"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>         
        <select id="ciudad" name="ciudad" class="custom-select" id="inputGroupSelect02" required="true">
            <!--Carga las ciudades--> 
            <option value='' selected>Elija una ciudad...</option>
                        <%
                            String ID = request.getParameter("provincia_id");
                            String ciudadID = request.getParameter("ciudad_id");
                            LinkedList<Ciudad> listaC = ConexionMySQL.getCiudad(ID);                            
                            int idCiudad = 0;
                            String nombreC = "";
                            for (int i = 0; i < listaC.size(); i++) {
                                idCiudad = listaC.get(i).getIdCiudad();
                                nombreC = listaC.get(i).getNombre();
                                if(idCiudad== Integer.parseInt(ciudadID))
                                {
                                    out.println("<option value=" + idCiudad + " selected>" + nombreC + "</option>");
                                } 
                                else
                                {
                                    out.println("<option value=" + idCiudad + ">" + nombreC + "</option>");
                                } 
                            }                   
                        
                        %>  
                       
         </select>
    </body>
</html>
