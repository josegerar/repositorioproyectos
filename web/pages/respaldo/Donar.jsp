<%-- 
    Document   : Donar
    Created on : 16-ene-2020, 2:53:24
    Author     : cris_
Página para donar un conjunto de datos
--%>


<%@page import="org.DAO.ConexionMySQL"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donar un Conjunto de datos</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link href="css/util.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilos_rep.css" rel="stylesheet" type="text/css" />
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <script src="js/dinamico.js" type="text/javascript"></script>
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="js/popup.js" type="text/javascript"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/estylless.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    </head>
    <%-- Valida que el usuario este logueado --%>
    <body <% ConexionMySQL con = new ConexionMySQL();
        HttpSession sesion = request.getSession(false);
        int idddd = Integer.parseInt(request.getParameter("id"));
        String us = request.getParameter("us");
        String usuario = String.valueOf(sesion.getAttribute("usuario"));
          String rol = String.valueOf(sesion.getAttribute("rol"));
        if (sesion.getAttribute("usuario") == null | us.equals(null)) {
             response.sendRedirect("Repo.jsp");
        } else {
           
        }
        
        %>>
        <%
            String ID = "0";
            String NombreCD = "";
            String Resu = "";
            String Fuente = "";
            String nInst = "";
            String natrb = "";
            String anioP = "";
            String InfRel = "";
            String InfAtr = "";
            String DocRelv = "";
            String ultimoId = "";
            //  HttpSession se = (HttpSession) request.getSession();
            // String idusuario=(String)se.getAttribute("id");
            // out.println("<script>alert('"+idusuario+"')</script>")
            Object dato = sesion.getAttribute("id");
            if (dato != null) {
                ID = dato.toString();
            }
            if (ID != "0") {
                ConexionMySQL conex = new ConexionMySQL();
                NombreCD = conex.seleccion("select nombreConjuntoDatos as resultado from  pivii.donaciones where idDonaciones =" + idddd + ";");
                Resu = conex.seleccion("select abstracto as resultado from  pivii.donaciones where idDonaciones =" + idddd + ";");
                Fuente = conex.seleccion("select fuente as resultado from  pivii.donaciones where idDonaciones =" + idddd + ";");
                nInst = conex.seleccion("select numeroInstancia as resultado from  pivii.donaciones where idDonaciones =" + idddd + ";");
                natrb = conex.seleccion("select numeroAtributos as resultado from  pivii.donaciones where idDonaciones =" + idddd + ";");
                anioP = conex.seleccion("select anio as resultado from  pivii.donaciones where idDonaciones =" + idddd + ";");
                InfRel = conex.seleccion("select infoRelevante as resultado from  pivii.donaciones where idDonaciones =" + idddd + ";");
                DocRelv = conex.seleccion("select documentoRelevantes as resultado from  pivii.donaciones where idDonaciones =" + idddd + ";");
                 InfAtr = conex.seleccion("select infoAtributo as resultado from  pivii.donaciones where idDonaciones =" + idddd + ";");
                 ultimoId = conex.seleccion("select nombreConjuntoDatos from pivii.donaciones where idDonaciones = 1;");

            }
        %>    
      <nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark " style="background:#225499; margin-top: 0px; position: fixed; top: 0; width: 100%; z-index: 10000000000;">
          <a class="navbar-brand" href="Repo.jsp">REPOSITORIO</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-targ
                        et="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Repo.jsp">
                                <i class="fa fa-home"></i>
                                Inicio

                            </a>
                        </li>



                        <% if (sesion.getAttribute("usuario") != null) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="RegistroUsuario.jsp">
                                <i class="fa fa-user-o" id="userli"></i>
                                Mi Perfil

                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AcuerdoDonacion.jsp">
                                <i class="fa fa-gift">
                                </i>
                                Donar
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MisDanaciones.jsp">
                                <i class="fa fa-database">

                                </i>
                                Mis Donaciones
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="GenerarDatos.jsp">
                                <i class="fa fa-table">

                                </i>
                                Generar Datos
                            </a>
                        </li>
                        <%}%>

                        <% if (rol.equals("1")) { %>
                        <li class="nav-item">
                            <a class="nav-link " href="Aprobacion.jsp"><i class="fa fa-envelope-o"></i>Solicitudes</a>
                        </li>
                        <%}%>

                    </ul>
                    <div style="position: fixed; top: 8px; right:  10px;"  class=" justify-content-end " >
                        <ul class="navbar-nav  justify-content-end " >
                            <li class="nav-item">
                                <% if (sesion.getAttribute("usuario") != null) {%>
                                <a class="nav-link"  id="user" > <i class="fa fa-user"></i><%=sesion.getAttribute("usuario")%></a>
                                    <%} else {%>
                                <a class="nav-link" href="RegistroUsuario.jsp"> <i class="fa fa-user"></i>Registrarse</a>
                                <%}%>
                            </li>
                            <li class="nav-item">
                                <% if (sesion.getAttribute("usuario") != null) { %>
                                <a class="nav-link" id="btncerrarsesion" > <i class="fa fa-sign-in"> </i>Cerrar Sesión</a>
                                <%} else {%>                        
                                <a class="nav-link"  id="btn-abrir-popup"  > <i class="fa fa-sign-in"> </i>Iniciar Sesión</a>
                                <%}%>   
                            </li>
                        </ul>
                    </div>


                </div>
            </nav>

<%-- Insertar donaciones formulario para mandar al servlet--%>
        <form action="InsertDonac" method="post" enctype="multipart/form-data" style="margin-top: 100px;">
            <nav aria-label="breadcrumb" style="margin-top: 10px; width: 80%; margin-left: 5%; margin: auto;">
                <ol class="breadcrumb">
                    <a class="breadcrumb-item " aria-current="page" href="Repo.jsp">Inicio</a>  <a class="breadcrumb-item " aria-current="page" href="AcuerdoDonacion.jsp">Acuerdo de donación</a><li class="breadcrumb-item active" aria-current="page">Donar</li>
                </ol>
            </nav>

            <div style="margin-left: 20%; margin-right: 20%;">
                <div class="regisContenedor">
                    <p class="regisTitulo" style=" display: flex; width: 420px; font-weight: 600;"> FORMULARIO DE DONACIÓN</p>
                </div>
                <div>
                    <label style="text-align: justify;margin-bottom: 20px;" >Completar este formulario nos permitirá procesar su conjunto de datos de manera eficiente. Antes de completar el formulario, puede ser útil visitar una página de conjunto de datos para ver cómo otros han documentado sus conjuntos de datos. Si tiene algún problema, no dude en contactarnos . Gracias por tu aporte!</label>
                </div>
                <hr>
              
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 430px;"  >Nombre del conjunto de datos</span>
                    </div>
                    <% if (sesion.getAttribute("usuario") != null) {%>
                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" id="txtnombre" name="txtnombre" value="<%= NombreCD%>"  onkeypress="return SoloLetras()(event)" onpaste="return false" required="true"/>
                    <%} else {%>
                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" id="txtnombre" name="txtnombre"  onkeypress="return SoloLetras()(event)" onpaste="return false" required="true"/>
                    <%}%>

                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 430px; " >Resumen</span>
                    </div>
                    <% if (sesion.getAttribute("usuario") != null) {%>
                    <textarea class="form-control" onpaste="return false" required="true" placeholder="Proporcione una breve descripción de su conjunto de datos (menos de 200 caracteres)."  aria-label="With textarea"   aria-describedby="inputGroup-sizing-default2" id="txtresumen" name="txtresumen" ><%= Resu%></textarea>

                    <%} else {%>
                    <textarea class="form-control" onpaste="return false" required="true" placeholder="Proporcione una breve descripción de su conjunto de datos (menos de 200 caracteres)." aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtresumen" name="txtresumen" ></textarea>

                    <%}%>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 430px; " >Fuente</span>
                    </div>
                    <% if (sesion.getAttribute("usuario") != null) {%>
                    <textarea class="form-control"  aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtfuente" name="txtfuente" onpaste="return false" required="true"><%= Fuente%></textarea>
                    <%} else {%>
                    <textarea class="form-control"  aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtfuente" name="txtfuente" onpaste="return false" required="true"></textarea>
                    <%}%>
                </div>
                <hr>
                <div style="margin-bottom: 15px;">
                    <div>
                        <p class="iniCabTitulo">Tipo de Datos:</p>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="Multivariante" name="TipoD">
                        <label class="form-check-label" for="inlineCheckbox1">Multivariante   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="Univariante"name="TipoD">
                        <label class="form-check-label" for="inlineCheckbox2">Univariante   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="Secuencial"name="TipoD" >
                        <label class="form-check-label" for="inlineCheckbox3">Secuencial   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="Secuencial1" name="TipoD">
                        <label class="form-check-label" for="inlineCheckbox4">Secuencial1   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="Series de tiempo"name="TipoD" >
                        <label class="form-check-label" for="inlineCheckbox5">Series de tiempo   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="Texto" name="TipoD">
                        <label class="form-check-label" for="inlineCheckbox6">Texto   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="Teoría del dominio" name="TipoD">
                        <label class="form-check-label" for="inlineCheckbox7">Teoría del dominio    </label>
                    </div>
                </div>
                <div style="margin-bottom: 15px;">
                    <div>
                        <p class="iniCabTitulo">Tarea:</p>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="Clasificación"name="Tarea">
                        <label class="form-check-label" for="inlineCheckbox1">Clasificación   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="Regresión"name="Tarea">
                        <label class="form-check-label" for="inlineCheckbox2">Regresión   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="Agrupamiento"name="Tarea" >
                        <label class="form-check-label" for="inlineCheckbox3">Agrupamiento   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox11" value="Descubrimiento" name="Tarea">
                        <label class="form-check-label" for="inlineCheckbox4">Descubrimiento causal    </label>
                    </div>

                </div>
                <div style="margin-bottom: 15px;">
                    <div>
                        <p class="iniCabTitulo">Tipo de atributo:</p>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="Categórico"name="Tatributo">
                        <label class="form-check-label" for="inlineCheckbox1">Categórico  </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="Entero"name="Tatributo">
                        <label class="form-check-label" for="inlineCheckbox2">Entero   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="Real"name="Tatributo" >
                        <label class="form-check-label" for="inlineCheckbox3">Real</label>
                    </div>

                </div>
                <div style="margin-bottom: 15px;">
                    <div>
                        <p class="iniCabTitulo">Zona:</p>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"  id="inlineRadio1" value="Ciencias de la vida" name="zona">
                        <label class="form-check-label" for="inlineRadio1">Ciencias de la vida   </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"  id="inlineRadio2" value="Ciencias fisicas"name="zona">
                        <label class="form-check-label" for="inlineRadio2">Ciencias fisicas</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"  id="inlineRadio3" value="CS / Ingeniería" name="zona">
                        <label class="form-check-label" for="inlineRadio3">CS / Ingeniería </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"  id="inlineRadio4" value="iencias Sociales"name="zona">
                        <label class="form-check-label" for="inlineRadio4">Ciencias Sociales</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"  id="inlineRadio5" value="Negocio" name="zona">
                        <label class="form-check-label" for="inlineRadio5">Negocio  </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"  id="inlineRadio6" value="Juego"name="zona">
                        <label class="form-check-label" for="inlineRadio6">Juego </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"  id="inlineRadio7" value="Otro" name="zona">
                        <label class="form-check-label" for="inlineRadio7">Otro </label>
                    </div>
                </div>

                <div style="margin-bottom: 15px;">
                    <div>
                        <p class="iniCabTitulo">Tipo de formato: </p>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"  id="inlineRadio1" value="Matriz" name="Tf">
                        <label class="form-check-label" for="inlineRadio1">Matriz  </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"  id="inlineRadio2" value="No Matriz" name="Tf">
                        <label class="form-check-label" for="inlineRadio2">No Matriz</label>
                    </div>

                </div>
                <div style="margin-bottom: 15px;">
                    <div>
                        <p class="iniCabTitulo">¿Su conjunto de datos contiene valores faltantes?</p>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="Vf"  id="inlineRadio1" value="Si">
                        <label class="form-check-label" for="inlineRadio1">Si </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="Vf" id="inlineRadio2" value="No">
                        <label class="form-check-label" for="inlineRadio2">No</label>
                    </div>

                </div>
                <hr>
                <div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 430px; " >Número de instancias (registros en su conjunto de datos):</span>
                        </div>
                        <% if (sesion.getAttribute("usuario") != null) {%>
                        <input type="text"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" id="txtInstancias"  value="<%= nInst%>"  name="txtnInstancias" onkeypress="return SoloNum(event)" onpaste="return false" required="true"/>
                        <%} else {%>
                        <input type="text"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" id="txtInstancias"   name="txtnInstancias" onkeypress="return SoloNum(event)" onpaste="return false" required="true"/>

                        <%}%>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 430px; " onkeypress="return SoloNum(event)"  >Número de atributos (campos dentro de cada registro):</span>
                        </div>
                        <% if (sesion.getAttribute("usuario") != null) {%>
                        <input type="text"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" value="<%= natrb%>" id="txtnAtributos"  name="txtnAtributos" onkeypress="return SoloNum(event)" onpaste="return false" required="true"/>

                        <%} else {%>
                        <input type="text"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" id="txtnAtributos"  name="txtnAtributos" onkeypress="return SoloNum(event)" onpaste="return false" required="true"/>

                        <%}%>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 430px; "    >Año de obtención:</span>
                        </div>
                        <% if (sesion.getAttribute("usuario") != null) {%>
                        <input type="text"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" value="<%= anioP%>"  id="txtsAnio"  name="txtsAnio" onkeypress="return SoloNum(event)" onpaste="return false" required="true" />
                        <%} else {%>
                        <input type="text"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" id="txtsAnio"  name="txtsAnio" onkeypress="return SoloNum(event)" onpaste="return false" required="true" />

                        <%}%>

                    </div>
                </div>

                <hr>
                <div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 430px; ">Información relevante</span>
                        </div>
                        <% if (sesion.getAttribute("usuario") != null) {%>
                        <textarea class="form-control" onpaste="return false" required="true"  placeholder="Proporcione toda la información relevante sobre su conjunto de datos."  aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtnIRelevante" name="txtnIRelevante"><%= InfRel%></textarea>
                        <%} else {%>
                        <textarea class="form-control" onpaste="return false" required="true" placeholder="Proporcione toda la información relevante sobre su conjunto de datos."  aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtnIRelevante" name="txtnIRelevante"></textarea>
                        <%}%>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 430px; ">Información del atributo:</span>
                        </div>
                        <% if (sesion.getAttribute("usuario") != null) {%>
                        <textarea class="form-control" onpaste="return false" required="true" placeholder="Proporcione información sobre cada atributo en su conjunto de datos."  aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtIAtributos" name="txtIAtributos"><%= InfAtr%></textarea>
                        <%} else {%>
                        <textarea class="form-control" onpaste="return false" required="true" placeholder="Proporcione información sobre cada atributo en su conjunto de datos."  aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtIAtributos" name="txtIAtributos"></textarea>
                        <%}%>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 430px; ">Documentos relevantes:</span>
                        </div>
                        <% if (sesion.getAttribute("usuario") != null) {%>
                        <textarea class="form-control" onpaste="return false" required="true" placeholder="Proporcione información sobre cada atributo en su conjunto de datos."  aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtIAtributos" name="txtIAtributos"><%= DocRelv%></textarea>
                        <%} else {%>
                        <textarea class="form-control" onpaste="return false" required="true" placeholder="Proporcione referencias a documentos que hayan citado este conjunto de datos en el pasado (si corresponde)."  aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtdRelevantes" name="txtdRelevantes"></textarea>
                        <%}%>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 430px; ">Agradecimientos:</span>
                        </div>
                        <% if (sesion.getAttribute("usuario") != null) {%>
                        <textarea class="form-control" onpaste="return false" required="true" placeholder="Si no tiene solicitudes de citas especiales, deje este campo en blanco."  aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtsCitacion" name="txtsCitacion"><%= DocRelv%></textarea>

                        <%} else {%>
                        <textarea class="form-control" onpaste="return false" required="true" placeholder="Si no tiene solicitudes de citas especiales, deje este campo en blanco."  aria-label="With textarea" aria-describedby="inputGroup-sizing-default2" id="txtsCitacion" name="txtsCitacion"></textarea>

                        <%}%>

                    </div>

                </div>
                <hr>
                <div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Subir</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" onpaste="return false" required="true" id="inputGroupFile01" name="file1" accept=".csv">
                            <label class="custom-file-label" for="inputGroupFile01">Archivo de datos</label>

                        </div>
                    </div> 

                    <hr>
                </div>
            </div>

            <div style="display: flex; justify-content: space-between; width: 60%; margin-left: 20%; margin-bottom: 100px;">
                
                <%if(us.equals("na")){%>
                       <button type="submit" class="btn btn-primary btn-lg" style="width: 48%" name="btnGuardar">Donar</button>
                    <%}else{%>
                    <button type="submit" class="btn btn-primary btn-lg" style="width: 48%" name="btnGuardar">Modificar</button>
                    <%}%>
                <button type="button" class="btn btn-secondary btn-lg" style="width: 48%">Cancelar</button>
            </div>

        </form>
        <!-- Footer -->
        <footer class="page-footer font-small blue" style="background: #5B5F61;position: fixed; left: 0; bottom: 0; width: 100%; color: white; text-align: center; z-index: 10000000">

            <!-- Copyright -->
            <div class="footer-copyright text-center py-3" style="margin: auto; color:#fff;" >© 2020 Copyright:
                <a href="https://mdbootstrap.com/education/bootstrap/" style="margin: auto; color:#fff; " >Universidad Técnica Estatal de Quevedo</a>
            </div>
            <!-- Copyright -->

        </footer>
        <!-- Footer -->
    </body>
    <!--Modal Login  action="LogUsuario" method="post"-->
    <div class="overlay" id="overlay" style="z-index: 100000000000">
        <div class="popup" id="popup">
            <a id="btn-cerrar-popup" class="btn-cerrar-popup">X</a>
            <h3>INICIO DE SESIÓN</h3>
            <form id="form1">
                <div class="contenedor-inputs">
                    <input id="usuario" name="usuario" type="text" placeholder="Nombre de Usuario"  required minlength="3" maxlength="20" />
                    <input id="clave" name="clave" type="password" placeholder="Contraseña"  required minlength="3" maxlength="25" />
                </div>
                <input  type="button" id="envia" class="btn-submit" value="Ingresar">
            </form>
            <br/>
            <div id="result1" style="color: red" ></div>
            <br/>
            <a href="RegistroUsuario.jsp" class="txt3">Registrate Ahora</a>
        </div>
    </div>
    <!--fin-->
    <!-- ajax -->
    <script>
        document.getElementById("txtnombre").addEventListener("keypress", verificar);
        document.getElementById("txtresumen").addEventListener("keypress", verificar);
        document.getElementById("txtfuente").addEventListener("keypress", verificar);
        document.getElementById("txtInstancias").addEventListener("keypress", verificar);
        document.getElementById("txtnIRelevante").addEventListener("keypress", verificar);
        document.getElementById("txtIAtributos").addEventListener("keypress", verificar);
        document.getElementById("txtsCitacion").addEventListener("keypress", verificar);
        document.getElementById("txtdRelevantes").addEventListener("keypress", verificar);

        function verificar(e) {

            // comprovamos con una expresion regular que el caracter pulsado sea
            // una letra, numero o un espacio
            if (e.key.match(/[a-z0-9ñçáéíóú\s]/i) === null) {
                // Si la tecla pulsada no es la correcta, eliminado la pulsación
                e.preventDefault();
            }
        }
    </script>
    <%-- loguin llamar a servlet para validar el ingreso del usuario--%>
    <script>
        $(document).ready(function () {
            $('#envia').click(function (event) {
                var usuarioVar = $('#usuario').val();
                var claveVar = $('#clave').val();
                // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
                $.ajax({
                    type: "POST",
                    url: "LogUsuario",
                    data: {
                        usuario: usuarioVar,
                        clave: claveVar
                    },
                    success: function (result) {
                        var resultado = result;
                        if (resultado == 1) {
                            overlay.classList.remove('active');
                            popup.classList.remove('active');
                            location.reload(true);

                        }
                        ;
                        $("#result1").html(result);
                    }

                });
                document.getElementById("clave").value = "";
            });

        });
    </script>
    <!--Cerrar Sesion-->
    <script>
        $(document).ready(function () {
            $('#btncerrarsesion').click(function (event) {
                var usuarioVar = $('#usuario').val();
                $.ajax({
                    type: "POST",
                    url: "CerrarSesion",
                    data: {
                        usuario: usuarioVar
                    },
                    success: function (result) {
                        location.reload(true);
                    }
                });
            });

        });
    </script>
    <script>
        var btnAbrirPopup = document.getElementById("btn-abrir-popup"),
                overlay = document.getElementById('overlay'),
                popup = document.getElementById('popup'),
                btnCerrarPopup = document.getElementById('btn-cerrar-popup');

        btnAbrirPopup.addEventListener('click', function () {
            overlay.classList.add('active');
            popup.classList.add('active');
        });

        btnCerrarPopup.addEventListener('click', function () {
            overlay.classList.remove('active');
            popup.classList.remove('active');
            location.reload(true);
        });

    </script>
    <%-- validaciones --%>
    <script>
        function SoloNum(e) {

            key = e.keyCode || e.which;
            teclado = String.fromCharCode(key).toLowerCase();
            letras = "1234567890 ";
            especiales = "8-37-38-46-164";
            teclado_especial = false;

            for (var i in especiales) {
                if (key == especiales[i]) {
                    teclado_especial = true;
                    break;
                }
            }
            if (letras.indexOf(teclado) == -1 && !teclado_especial) {
                return false;
            }

        }
      function SoloLetras(e) {
	key=e.keyCode || e.which;
 	teclado=String.fromCharCode(key).toLowerCase();
 	letras="qwertyuiopasdfghjklñzxcvbnm ";
 	especiales="8-37-38-46-164";
 	teclado_especial=false;
        
 	for(var i in especiales){
		if(key==especiales[i]){
			teclado_especial=true;
			break;
		}
	}
 	if(letras.indexOf(teclado)==-1 && !teclado_especial){
		return false;
	}
}
    </script>

</html>