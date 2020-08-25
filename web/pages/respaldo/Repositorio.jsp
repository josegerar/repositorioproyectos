<%-- 
    Document   : Repositorio
    Created on : 27-nov-2019, 17:47:06
    Author     : cris_
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="estilos_rep.css" >
        <script src="js/script.js" type="text/javascript"></script>
        <script
            src="http://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" ></script>
        <script src="js/dinamico.js" type="text/javascript"></script>
    </head>
    <body>
    <navbar>
        <img class="navImg" src="2.jpg" alt="">
        <ul class="nav justify-content-end navstyle" >
            <li class="nav-item">
                <a class="nav-link navenlaces" href="#"><img src="iconos/icons8_Home_48px.png" class="iconEnlace" alt="">Inicio</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle navenlaces" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> <img src="iconos/icons8_Settings_50px_1.png" class="iconEnlace" alt="">Configuración </a>
                <div class="dropdown-menu" style="margin-top: 11px;">
                    <a class="dropdown-item" href="#">Perfil</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Cerrar Sesión</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link navenlaces" href="#"><img src="iconos/icons8_User_50px_2.png" class="iconEnlace" alt="">Registrarse</a>
            </li>
        </ul>
    </navbar>



    <div class="contenedor bcrumbSt">



        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">Inicio</li>
            </ol>
        </nav>

        <form>


            <div class="IniContPrim">
                <div class="IniContSecIz">
                    <p class="iniCabTitulo">NAVEGAR A TRAVÉS DE:</p>
                    <p class="iniCabTitulo2" style="font-size: 12px;">TAREA PREDETERMINADA</p>
                    <button class="page-link" style="width: 100%; text-align: left;" type="submit" onclick="this.form.submit();" value="Iris" name="bt1"> algo</button>
                    <a class="page-link" href="#">Clasificación</a>
                    <a class="page-link" href="#">Regresión</a>
                    <a class="page-link" href="#">Agrupación</a>
                    <a class="page-link" href="#">Otros</a>
                    <p class="iniCabTitulo2" style="font-size: 12px;">FILTRAR POR:</p>
                    <select class="form-control"  name="cmbDept" onchange="this.form.submit();">
                        <option class="form-control" value="Clasification">Clasificación</option>
                        <option class="form-control" value="Regression">Regresión</option>
                        <option class="form-control" value="Agrupacion">Agrupación </option>
                        <option class="form-control" value="Otros">Otros </option>

                    </select>
                    <p class="iniCabTitulo2" style="font-size: 12px;">VALOR:</p>
                    <select class="form-control"  onchange="this.form.submit();">
                        <option class="form-control" value="Regression">Todo </option>
                        <option class="form-control" value="Dugon">Regresión</option>
                        <option class="form-control" value="basketball">Agrupación </option>
                        <option class="form-control" value="Iris">Otros </option>

                    </select>

                    <p class="iniCabTitulo2" style="font-size: 12px;">TIPO DE ATRIBUTO</p>
                    <a class="page-link" href="#">Categórico</a>
                    <a class="page-link" href="#">Numérico</a>
                    <a class="page-link" href="#">Mixto</a>

                    <p class="iniCabTitulo2" style="font-size: 12px;">TIPO DE DATO</p>
                    <a class="page-link" href="#">Multivariante</a>
                    <a class="page-link" href="#">Univariante</a>
                    <a class="page-link" href="#">Secuencial</a>
                    <a class="page-link" href="#">Series temporales</a>
                    <a class="page-link" href="#">Texto</a>
                    <a class="page-link" href="#">Teoría del dominio</a>
                    <a class="page-link" href="#">Otros</a>

                    <p class="iniCabTitulo2" style="font-size: 12px;">ZONA</p>
                    <a class="page-link" href="#">Ciencias de la vida</a>
                    <a class="page-link" href="#">Ciencias físicas</a>
                    <a class="page-link" href="#">CS / Ingeniería</a>
                    <a class="page-link" href="#">Ciencias sociales</a>
                    <a class="page-link" href="#">Negocios</a>
                    <a class="page-link" href="#">Otros</a>

                    <p class="iniCabTitulo2" style="font-size: 12px;">ATRIBUTOS</p>
                    <a class="page-link" href="#">Menos de 10</a>
                    <a class="page-link" href="#">10 a 100</a>
                    <a class="page-link" href="#">Más de 100</a>

                    <p class="iniCabTitulo2" style="font-size: 12px;">INSTANCIAS</p>
                    <a class="page-link" href="#">Menos de 100</a>
                    <a class="page-link" href="#"> 100 a 1000</a>
                    <a class="page-link" href="#">Mayor a 1000</a>

                    <p class="iniCabTitulo2" style="font-size: 12px;">TIPO DE FORMATO</p>
                    <a class="page-link" href="#">Matriz</a>
                    <a class="page-link" href="#">No matricial</a>


                </div>
                <div class="IniContSecDe">
                    <div class="iniContCab">
                        <p class="iniCabTitulo">REPOSITORIO</p>
                        <hr style="margin-top: -10px;">
                    </div>




                    <div class="IniContCardsBusq" id="contenedores">
                        <div class="container">



                            <table id="myTable" class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Name</th>
                                        <th scope="col">Tipo de Dato</th>
                                        <th scope="col">Tarea Predeterminada</th>
                                        <th scope="col">Tipo Atributo</th>
                                        <th scope="col"># de Instan cias</th>
                                        <th scope="col"># de atributos</th>
                                        <th scope="col">Año</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                        try {
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pivii?zeroDateTimeBehavior=convertToNull", "root", "1234");
                                            Statement stm = conn.createStatement();
                                            String clasificador = request.getParameter("cmbDept");
                                            String sqlQ = "";

                                           
                                            ResultSet rs = stm.executeQuery("select * from pivii.donaciones ");

                                            while (rs.next()) {
                                    %>

                                    <tr >
                                        <td><a href="DetalleCD.jsp?id=<%= rs.getInt("idDonaciones")%>" id="<%= rs.getInt("idDonaciones")%>"><%= rs.getString("nombreConjuntoDatos")%> </a></td>

                                        <td><%= rs.getString("tipoDatos")%> </td>
                                        <td><%= rs.getString("tarea")%> </td>
                                        <td><%= rs.getString("tipoAtributo")%> </td>
                                        <td><%= rs.getString("numeroInstancia")%> </td>
                                        <td><%= rs.getString("numeroAtributos")%> </td>
                                        <td><%= rs.getString("anio")%> </td>
                                    </tr>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </tbody>
                            </table>
                                <div id="resultado">
                                    
                                </div>
                          
                                <input type="button" onclick="buscar()" value="buscar">
                        </div>



                    </div>
                </div>
            </div>
<div class="caja">
        Contenido inicial
    </div>
        </form>
    </div>
    

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <script>
        function buscar(){
            $.ajax({
            url: "/filtrar",
            data: {
                modo: "tarea",
                filtro: "Regression"
            },
            success: function (result) {
                $("#caja").html(result);
            }
        });
        }
    </script>
    
</body>
</html>
