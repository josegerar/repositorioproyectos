<%-- 
    Document   : Repo
    Created on : 20-ene-2020, 22:00:40
    Author     : cris_
    Pagina Principal del sistema
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="width=device-width" />
        <title>Repositorio</title>
        <%
            String scheme = request.getScheme();
            String serverName = request.getServerName();
            int serverPort = request.getServerPort();
            String contextPath = request.getContextPath();
            String serverURL = scheme + "://" + serverName + ":" + serverPort + contextPath + "/";
        %>
        <script>
            const serverURL = "<%=serverURL%>";
            console.log(serverURL);
        </script>
        <link rel="apple-touch-icon" sizes="57x57" href="<%=serverURL%>iconos/fav/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="<%=serverURL%>iconos/fav/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="<%=serverURL%>iconos/fav/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="<%=serverURL%>iconos/fav/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="<%=serverURL%>iconos/fav/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="<%=serverURL%>iconos/fav/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="<%=serverURL%>iconos/fav/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="<%=serverURL%>iconos/fav/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="<%=serverURL%>iconos/fav/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="<%=serverURL%>iconos/fav/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="<%=serverURL%>iconos/fav/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="<%=serverURL%>iconos/fav/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="<%=serverURL%>iconos/fav/favicon-16x16.png">
        <link rel="manifest" href="<%=serverURL%>iconos/fav/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="<%=serverURL%>iconos/fav/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="<%=serverURL%>css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%=serverURL%>css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="<%=serverURL%>css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%=serverURL%>css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="<%=serverURL%>css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%=serverURL%>css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="<%=serverURL%>css/estilos_rep.css" rel="stylesheet" type="text/css" />
        <link href="<%=serverURL%>css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="<%=serverURL%>css/estylless.css" rel="stylesheet" type="text/css"/>
        <link href="<%=serverURL%>css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="<%=serverURL%>css/widgetSelect.css" rel="stylesheet" type="text/css"/>
        <script src="<%=serverURL%>js/dinamico.js" type="text/javascript"></script>

        <script src="<%=serverURL%>js/jquery.min_1.js" type="text/javascript"></script>
        <script src="<%=serverURL%>js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="<%=serverURL%>js/jquery-ui.js" type="text/javascript"></script>

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

    </head>
    <!--Cuando el usuario no ha seleccionado ningun filtro se muestra todas los dataset--> 
    <body >
        <div style="margin-bottom: 50px;">
            <!--Si esta logueado trae el nombre del usuario y el rol--> 
            <%
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

        <script type="text/javascript">
            $(function () {

                var availableTags = new Array();

                function autocompleteSql(input, event) {
                    var data = {};
                    data.nombre = $(input).val();
                    data.tipo = $(input).attr("name");
                    if (data.tipo === "ciudad") {
                        var prov = $("#cordprovincia").data("data");
                        data.idProvincia = prov.idProvincia;
                    }
                    $(input).data("data", null);
                    $.ajax({
                        url: serverURL + "autocomplete",
                        data: data,
                        dataType: "json",
                        type: "GET",
                        success: function (data) {
                            availableTags.length = 0;
                            if (data) {
                                $.each(data, function (i, item) {
                                    availableTags[i] = {label: item.nombre, value: item};
                                });
                            }
                        }
                    });
                }

                $(document).on("focus", ".autocomplete-sql", function (e) {
                    $(this).autocomplete({
                        source: availableTags,
                        minLength: 1,
                        select: function (event, ui) {
                            $(this).val(ui.item.label);
                            $(this).data("data", ui.item.value);
                            /*var f = $(this).data("data");
                             console.log(f);*/
                            return false;
                        },
                        create: function () {
                            $(this).data('ui-autocomplete')._renderItem = function (ul, item) {
                                return $('<li>').append('<label>' + item.label + '</label>').appendTo(ul);
                            };
                        }
                    });
                });

                function blurSql(input) {
                    $.ajax({
                        url: serverURL + "validate",
                        data: {nombre: $(input).val(), type: "actor"},
                        type: "GET",
                        success: function (data) {
                            if (data !== '1') {
                                $(this).val('');
                                $('.msjGeneral').text("Invalid actor (Example: + actor)");
                            } else {
                                $('.msjGeneral').text('');
                            }
                        }
                    });
                }

                $(document).on("keyup", ".autocomplete-sql", function (event) {
                    autocompleteSql(this, event);
                });
                $(document).on("keyup", ".ob-blur-sql", function (event) {
                    blurSql(this);
                });
            });
        </script>

        <!-- script de validacion de campos de formularios -->
        <script>
            function SoloNumerico(variable) {
                Numer = parseInt(variable);
                if (isNaN(Numer)) {
                    return "";
                }
                return Numer;
            }

            function ValNumero(Control) {
                Control.value = SoloNumerico(Control.value);
            }

            function ValTexto(e) {
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
                if (letras.indexOf(tecla) === -1) {
                    return false;
                }
            }
        </script>
    </body>
</html>
