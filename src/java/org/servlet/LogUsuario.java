package org.servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.DAO.ConexionMySQL;
import org.Object.Encript;;

/**
 *
 * @author USUARIO
 */
@WebServlet(urlPatterns = {"/LogUsuario"})
public class LogUsuario extends HttpServlet {

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
            throws ServletException, IOException {
       
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
        processRequest(request, response);
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
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession(true);
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String contraseña=Encript.sha1(clave);
        ConexionMySQL conex = new ConexionMySQL();
        String query="select idUsuario from Usuario where nickName='"+usuario+"'";
        int bandera= conex.validacion(query);
        PrintWriter out=response.getWriter();
        if(bandera==0)
        {
           out.println("Contraseña i/o usuario incorrecto");
        }
        else
        {
            query="select idUsuario from Usuario where nickName='"+usuario+"' and  password='"+contraseña+"' ";
            bandera= conex.validacion(query);
            if(bandera==0)
            {
                    response.setContentType("text/html");
                   
                   out.println("Contraseña i/o usuario incorrecto");
                   
            }
            else
            {
                query="select  rol.idRol from Usuario inner join rol on Usuario.Rol_idRol=rol.idRol where Usuario.idUsuario="+bandera+"";
                int rol= conex.validacion(query);
                sesion.setAttribute("id",bandera);
                sesion.setAttribute("usuario",usuario.trim());
                sesion.setAttribute("rol",rol);
                 out.println("1");
            }
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
