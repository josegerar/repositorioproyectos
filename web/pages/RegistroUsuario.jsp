<%-- 
    Document   : Registro de Usuario
    Created on : 07-feb-2020, 16:12:22
    Author     : cris_
    Permite registrar un nuevo usuario
--%>

<%@page import="org.Object.Institucion"%>
<%@page import="org.Object.Profesion"%>
<%@page import="java.util.LinkedList"%>
<%@page import="org.Object.Provincia"%>
<%@page import="org.DAO.ConexionMySQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String ID = "0";
    String NombreUsuario = "";
    String Apellido = "";
    String IDprofesion = "";
    int IDinstitucion = 0;
    String fecha = "";
    String Correo = "";
    String Direccion = "";
    int NivelAcademico = 0;
    int IDciudad = 0;
    String NickName = "";
    Integer IDprovincia = 0;
    //  String idusuario=(String)se.getAttribute("idusuario");
    // out.println("<script>alert('"+idusuario+"')</script>");
    HttpSession sesionn = request.getSession(true);
    Object dato = sesionn.getAttribute("id");
    if (dato != null) {
        ID = dato.toString();
    }
    if (ID != "0") {

        ConexionMySQL conex = new ConexionMySQL();
        NombreUsuario = conex.seleccion("select nombre as resultado from usuario where idUsuario ='" + ID + "'");
        Apellido = conex.seleccion("select apellido as resultado from usuario where idUsuario ='" + ID + "'");
        IDprofesion = conex.seleccion("select Profesion_idProfesion as resultado from usuario where idUsuario ='" + ID + "'");
        IDinstitucion = Integer.parseInt(conex.seleccion("select Institucion_idInstitucion as resultado from usuario where idUsuario ='" + ID + "'"));
        fecha = conex.seleccion("select fechaNacimiento as resultado from usuario where idUsuario ='" + ID + "'").substring(0, 10);;
        Correo = conex.seleccion("select correo as resultado from usuario where idUsuario ='" + ID + "'");
        Direccion = conex.seleccion("select direccion as resultado from usuario where idUsuario ='" + ID + "'");
        NivelAcademico = Integer.parseInt(conex.seleccion("select nivelAcademico as resultado from usuario where idUsuario ='" + ID + "'"));
        IDciudad = Integer.parseInt(conex.seleccion("select Ciudad_idCiudad as resultado from usuario where idUsuario ='" + ID + "'"));
        NickName = conex.seleccion("select nickName as resultado from usuario where idUsuario ='" + ID + "'");
        IDprovincia = Integer.parseInt(ConexionMySQL.seleccion("select Provincia_idProvincia as resultado from ciudad where idCiudad='" + IDciudad + "'"));
    }
%>

<!--Llama al servlet para insertar un usuario nuevo--> 
<div class="regisContenedor" style="max-width: 800px; margin: auto;">
    <p class="regisTitulo"> Registro </p>
    <form action="InsertUsuario" method="post">
        <div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default" style="width: 200px; ">Nombre</span>
                </div>
                <input type="text" onpaste="return false" onkeypress="return SoloLetras(event)" id="nombre" name="nombre" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required="true" value="<%=NombreUsuario%>">

                <input type="text" id="ID"  name="ID" hidden="false" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required="true" value="<%=ID%>">

            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Apellidos</span>
                </div>
                <input type="text"onpaste="return false" onkeypress="return SoloLetras(event)" id="apellido" name="apellido" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" required="true" value="<%= Apellido%>">
            </div>            
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Fecha de nacimiento</span>
                </div>
                <input type="date" id="fechaNacimiento" min="1930-01-01" max="2010-12-31"name="fechaNacimiento" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" required="true">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Correo electrónico</span>
                </div>
                <input type="text" id="correo" name="correo" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" value="<%= Correo%>">
            </div>


            <div class="input-group mb-3">
                <select name="provinciaid" id="provinciaid" class="custom-select" required="true">
                    <option value="" selected>Elija una provincia...</option>
                    <%
                        LinkedList<Provincia> listaP = ConexionMySQL.getProvincias();
                        int idProvincia = 0;
                        String nombre = "";
                        for (int i = 0; i < listaP.size(); i++) {
                            idProvincia = listaP.get(i).getIdProvincia();
                            nombre = listaP.get(i).getNombre();
                            out.println("<option value=" + idProvincia + ">" + nombre + "</option>");
                        }
                    %>  

                </select>
                <div class="input-group-append">
                    <label class="input-group-text" for="inputGroupSelect02">Provincia</label>
                </div>
            </div>
            <div class="input-group mb-3">                   
                <select id="ciudad_id" class="form-control" name="ciudad_id" required="true">
                </select>

                <div class="input-group-append">
                    <label class="input-group-text" for="inputGroupSelect02">Ciudad</label>
                </div>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Dirección</span>
                </div>
                <input type="text" id="direccion" name="direccion" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" required="true" value="<%=Direccion%>">
            </div> 

            <div class="input-group mb-3">
                <select id="nivelAcademico" name="nivelAcademico" class="custom-select" required="true">
                    <option value="" selected>Elija...</option>
                    <option value="1">Primaria</option>
                    <option value="2">Secundaria</option>
                    <option value="3">Superior</option>                      
                </select>

                <div class="input-group-append">
                    <label class="input-group-text" for="inputGroupSelect02">Nivel Académico</label>
                </div>             
            </div>
            <div class="input-group mb-3">
                <select id="idProfesion" name="idProfesion" class="custom-select" required="true">
                    <option value="" selected>Elija una profesión...</option>
                    <%
                        LinkedList<Profesion> listaPr = ConexionMySQL.getProfesion();
                        int idProfesion = 0;
                        String nombreP = "";
                        for (int i = 0; i < listaPr.size(); i++) {
                            idProfesion = listaPr.get(i).getProfesionID();
                            nombreP = listaPr.get(i).getNombre();
                            out.println("<option value=" + idProfesion + ">" + nombreP + "</option>");
                        }
                        //  out.println("<option value='otro'>Otro...</option>");
                    %>  
                </select>

                <div class="input-group-append">
                    <label class="input-group-text" for="inputGroupSelect02">Profesión</label>
                </div>
            </div>

            <div class="input-group mb-3">
                <select id="idInstitucion" name="idInstitucion" class="custom-select" id="inputGroupSelect02" required="true">
                    <option value="" selected>Elija una institución...</option>
                    <%  LinkedList<Institucion> listaI = ConexionMySQL.getInstitucion();
                        int idInstitucion = 0;
                        String nombreI = "";
                        for (int i = 0; i < listaI.size(); i++) {
                            idInstitucion = listaI.get(i).getInstitucionID();
                            nombreI = listaI.get(i).getNombre();
                            out.println("<option value=" + idInstitucion + ">" + nombreI + "</option>");

                        }
                        //   out.println("<option value='otro'>Otro...</option>");

                    %>  

                </select>
                <div class="input-group-append">
                    <label class="input-group-text" for="inputGroupSelect02">Institución</label>
                </div>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Nombre de Usuario</span>
                </div>
                <input type="text" name="usuario" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2" required="true" value="<%=NickName%>">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Contraseña</span>
                </div>
                <input type="password" name="clave" id="clave" placeholder="Ingrese una contraseña..."  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                <div style="font-size: 25px"> <i class="fa fa-eye" id="show"></i></div>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default2"  style="width: 200px; ">Confirmar Contraseña</span>
                </div>
                <input type="password" name="clave2" id="clave2" placeholder="Confirme su contraseña..." class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default2">
                <div style="font-size: 25px"> <i class="fa fa-eye" id="show2"></i></div>
            </div>
        </div>

        <div style="display: flex; justify-content: space-between;">
            <button id="guardar" type="submit" class="btn btn-primary btn-lg" style="width: 48%">Guardar</button>
            <button type="button" onclick="recargar()" class="btn btn-secondary btn-lg" style="width: 48%">Cancelar</button>
        </div>
    </form>
</div>     
<script>
    function Actualizar() {
        document.getElementById("nivelAcademico").selectedIndex = "<%= NivelAcademico%>";
        document.getElementById("idInstitucion").selectedIndex = "<%= IDinstitucion%>";
        document.getElementById("fechaNacimiento").value = "<%= fecha%>";
        document.getElementById("idProfesion").selectedIndex = "<%= IDprofesion%>";
        document.getElementById("provinciaid").selectedIndex = "<%= IDprovincia%>";

        $('#provinciaid').trigger('change');
    }
    function recargar() {
        location.reload();
    }
    function SoloLetras(e) {
        key = e.keyCode || e.which;
        teclado = String.fromCharCode(key).toLowerCase();
        letras = "qwertyuiopasdfghjklñzxcvbnm ";
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

</script>

<script>
    $(document).ready(function () {
        $("#provinciaid").on("change", function () {
            var provincia_id = $("#provinciaid").val();
            var ciudad_id = <%= IDciudad%>;
            //location.href = "http://" + window.location.host + "/PII/RegistroUsuario.jsp?provincia="+provincia_id+"";
            $.ajax({
                url: "ciudad.jsp", //your jsp page name
                data: {provincia_id: provincia_id, ciudad_id: ciudad_id}, //sending request to state.jsp page.
                method: "POST", //HTTP method.
                success: function (data)
                {
                    $("#ciudad_id").html(data);//output or response will display in state select box.
                }
            });
            //   alert(ciudad_id);   
        });
        Actualizar();
    });
</script>
