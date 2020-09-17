/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.DAO.ConexionMySQL;

/**
 *
 * @author USUARIO
 */
@WebServlet(name = "AprobarDenegar", urlPatterns = {"/AprobarDenegar"})
public class AprobarDenegar extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
                ConexionMySQL con=new ConexionMySQL();
         int id=Integer.parseInt(request.getParameter("id"));
         int opcion=Integer.parseInt(request.getParameter("opcion"));
         String observacion=request.getParameter("observacion");
         switch(opcion)
         {
             case 1: 
             String query="update donaciones set validacion='Aprobado' where idDonaciones='"+id+"';";
             con.accion(query);
             break;
             case 2:
             String query2="update donaciones set validacion='No aprobado', observacion='"+observacion+"' where idDonaciones='"+id+"';";    
             con.accion(query2);
             String Archivo=request.getParameter("archivo");
             File data=new File("C:/Users/cris_/Desktop/pivi/PII/web/"+Archivo);
               if (!data.exists()) {
              } else {
                 data.delete();
                 System.out.println("El archivo data fue eliminado.");
              }   
            break;
         }
        
         response.sendRedirect("aprobacion.html");
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
        } catch (SQLException ex) {
            Logger.getLogger(AprobarDenegar.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(AprobarDenegar.class.getName()).log(Level.SEVERE, null, ex);
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
