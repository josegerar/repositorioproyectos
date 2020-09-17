/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.Controladores.CoordinadorController;
import org.Object.Encript;

/**
 *
 * @author crist
 */
@WebServlet(name = "TransactCoordinador", urlPatterns = {"/TransactCoordinador"})
public class TransactCoordinador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    CoordinadorController controller = new CoordinadorController();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TransactCoordinador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransactCoordinador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);
        String nickName = request.getParameter("user");
        String password = request.getParameter("password");
        String contrasenia = Encript.sha1(password);
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("identificacion");
        String fechanacimiento = request.getParameter("nacimiento");
        String correo = request.getParameter("email");
        String direccion = request.getParameter("direccion");
        Integer nivelacademico = Integer.parseInt(request.getParameter("nivelacademico"));
        Integer idciudad = Integer.parseInt(request.getParameter("ciudad"));
        Integer idprofesion = Integer.parseInt(request.getParameter("profesion"));
        Integer idinstitucion = Integer.parseInt(request.getParameter("institucion"));
        String transact = request.getParameter("transact");
        String json = "";
        if (transact.equals("insert")){
            json = new Gson().toJson(controller.insertCoordinadores(nickName, contrasenia, nombre, apellido, cedula, fechanacimiento, correo, direccion, nivelacademico, idciudad, idprofesion, idinstitucion));
        }
        response.getWriter().write(json);
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
