<%-- 
    Document   : Repo
    Created on : 20-ene-2020, 22:00:40
    Author     : cris_
    Pagina Principal del sistema
--%>

<%@page import="org.DAO.ConexionMySQL"%>
<%@page import="model.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="width=device-width" />
        <title>Repositorio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilos_rep.css" rel="stylesheet" type="text/css" />
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <script src="js/dinamico.js" type="text/javascript"></script>
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/estylless.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <!--Cuando el usuario no ha seleccionado ningun filtro se muestra todas los dataset--> 
    <body >
        <div style="margin-bottom: 50px;">
            <!--Si esta logueado trae el nombre del usuario y el rol--> 
            <%
                ConexionMySQL con = new ConexionMySQL();
                HttpSession sesion = request.getSession(true);
                String usuario = String.valueOf(sesion.getAttribute("usuario"));
                String rol = String.valueOf(sesion.getAttribute("rol"));

            %>
            <!-- NavBar -->
            <%@include file="WEB-INF/jspf/navbar.jspf" %>
            <!-- NavBar -->
            <!-- Content -->

            <div id="contenidoPrincipal">
                
            </div>
            <!-- Content -->

        </div>

        <!-- Footer -->
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <!-- Footer -->
        <!--Modal Login  action="LogUsuario" method="post"-->
        <%@include file="WEB-INF/jspf/modallogin.jspf" %>
        <!--fin-->
        
        <script>
            paginacion("pages/repositorioDocentes.html");
        </script>

    </body>
</html>
