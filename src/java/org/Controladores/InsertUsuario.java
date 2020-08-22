/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.Object.Usuario;
import org.DAO.ConexionMySQL;
import org.Object.hash;

/**
 *
 * @author Suanny
 */
@WebServlet(name = "InsertUsuario", urlPatterns = {"/InsertUsuario"})
public class InsertUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Usuario usuario = new Usuario();
            usuario.setIdUsuario(Integer.parseInt(request.getParameter("ID")));
            usuario.setNickName(request.getParameter("usuario"));
            usuario.setPassword(request.getParameter("clave"));
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellido(request.getParameter("apellido"));
            usuario.setFechaNacimiento(request.getParameter("fechaNacimiento"));
            usuario.setCorreo(request.getParameter("correo"));
            usuario.setNivelAcademico(Integer.parseInt(request.getParameter("nivelAcademico")));
            usuario.setDireccion(request.getParameter("direccion"));
            usuario.setIdCiudad(Integer.parseInt(request.getParameter("ciudad_id")));
            usuario.setIdProfesion(Integer.parseInt(request.getParameter("provinciaid")));
            usuario.setIdProfesion(Integer.parseInt(request.getParameter("idProfesion")));
            usuario.setIdInstitucion(Integer.parseInt(request.getParameter("idInstitucion")));
            ConexionMySQL conex = new ConexionMySQL();
            String date = usuario.getFechaNacimiento() + " 00:00:00";
            boolean band = false;
            String contraseña = hash.sha1(usuario.getPassword());
            String clave1 = request.getParameter("clave");
            String clave2 = request.getParameter("clave2");

            if ("0".equals(request.getParameter("ID"))) {
                String userR = ConexionMySQL.seleccion("select count(*) as resultado from usuario where nickName='" + usuario.getNickName() + "'");
                if ("0".equals(userR)) {
                    String cadena = "insert into usuario(nickName, password ,nombre, apellido, Profesion_idProfesion,Institucion_idInstitucion,fechaNacimiento, correo, direccion, nivelAcademico, Ciudad_idCiudad, Rol_idRol) "
                            + "values ('" + usuario.getNickName() + "','" + contraseña + "','" + usuario.getNombre() + "','" + usuario.getApellido() + "'," + usuario.getIdProfesion() + "," + usuario.getIdInstitucion() + ",'" + date + "','" + usuario.getCorreo() + "','" + usuario.getDireccion() + "','" + usuario.getNivelAcademico() + "'," + usuario.getIdCiudad() + ",1);";

                    if (clave1 == null ? clave2 == null : clave1.equals(clave2)) {
                        band = conex.accion(cadena);
                        if (band == true) {
                            out.println("<script>alert(\"Datos Registrados Exitosamente\"); </script>");
                            
    
                            out.println("<script>location.href = \"http://\" + window.location.host + \"/PII/RegistroUsuario.jsp\"</script>");
                  //          response.sendRedirect("http://localhost:8082/PII/RegistroUsuario.jsp");
                        }
                    } else {
                        //     response.sendRedirect("http://localhost:8082/PII/RegistroUsuario.jsp");
                        //     out.println("<script>alert(\"Las contraseñas no coinciden. Vuelva a intentarlo\"); </script>");
                    }
                } else {
                    
                    out.println("<script>alert(\"Advertencia al insertar: El nombre de usuario ya existe\"); </script>");
                }
            } else {
                String userR = ConexionMySQL.seleccion("select count(*) as resultado from usuario where nickName='" + usuario.getNickName() + "' and idUsuario !='" + usuario.getIdUsuario() + "'");
                if ("0".equals(userR)) {
                    if ("".equals(clave1) && "".equals(clave2)) {
                        String cadena = "update usuario set nickName='" + usuario.getNickName() + "',nombre='" + usuario.getNombre() + "',\n"
                                + "apellido='" + usuario.getApellido() + "', cedula='" + usuario.getCedula() + "',fechaNacimiento='" + usuario.getFechaNacimiento() + "',\n"
                                + "correo='" + usuario.getCorreo() + "', direccion='" + usuario.getDireccion() + "',nivelAcademico='" + usuario.getNivelAcademico() + "', \n"
                                + "Ciudad_idCiudad='" + usuario.getIdCiudad() + "',Profesion_idProfesion='" + usuario.getIdProfesion() + "',Institucion_idInstitucion='" + usuario.getIdInstitucion() + "'\n"
                                + "where idUsuario=" + usuario.getIdUsuario() + ";";

                        band = conex.accion(cadena);
                        if (band == true) {
                            out.println("<script>alert(\"Datos Modificados Exitosamente\"); </script>");
                            response.sendRedirect("http://localhost:8082/PII/RegistroUsuario.jsp");
                        }

                    } else {
                        String cadena = "update usuario set nickName='" + usuario.getNickName() + "',password='" + contraseña + "' ,nombre='" + usuario.getNombre() + "',\n"
                                + "apellido='" + usuario.getApellido() + "', cedula='" + usuario.getCedula() + "',fechaNacimiento='" + usuario.getFechaNacimiento() + "',\n"
                                + "correo='" + usuario.getCorreo() + "', direccion='" + usuario.getDireccion() + "',nivelAcademico='" + usuario.getNivelAcademico() + "', \n"
                                + "Ciudad_idCiudad='" + usuario.getIdCiudad() + "',Profesion_idProfesion='" + usuario.getIdProfesion() + "',Institucion_idInstitucion='" + usuario.getIdInstitucion() + "'\n"
                                + "where idUsuario=" + usuario.getIdUsuario() + ";";

                        band = conex.accion(cadena);
                        if (band == true) {
                            out.println("<script>alert(\"Datos Modificados Exitosamente\"); </script>");
                            response.sendRedirect("http://localhost:8082/PII/RegistroUsuario.jsp");
                        }

                    }

                } else {
                    out.println("<script>alert(\"El nombre de usuario ya existe\"); </script>");
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InsertUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InsertUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
