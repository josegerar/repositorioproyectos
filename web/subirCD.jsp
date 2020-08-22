<%-- 
    Document   : subirCD
    Created on : 21-ene-2020, 23:23:57
    Author     : cris_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUBIR</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="subir.jsp" method="post" enctype="multipart/form-data">
            <div class="custom-file">
                    <input type="file" class="custom-file-input" id="inputGroupFile01">
                    <label class="custom-file-label" for="inputGroupFile01">Archivo de datos</label>
                    <input type="submit" value="Subir archivo">
                </div>
        </form>
    </body>
</html>
