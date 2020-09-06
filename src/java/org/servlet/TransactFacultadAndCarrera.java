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
import org.Controladores.FacultadController;
import org.Controladores.CarreraController;

/**
 *
 * @author crist
 */
@WebServlet(name = "TransactFacultadAndCarrera", urlPatterns = {"/TransactFacultadAndCarrera"})
public class TransactFacultadAndCarrera extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    FacultadController controller = new FacultadController();
    CarreraController controller2 = new CarreraController();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TransactFacultadAndCarrera</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransactFacultadAndCarrera at " + request.getContextPath() + "</h1>");
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
        String json = "";
        String transact = request.getParameter("transact");
        String objeto = request.getParameter("objeto");
        if(objeto.equals("facultad")){
            if(transact.equals("insert")){
                String facultad = request.getParameter("facultad");
                json = new Gson().toJson(controller.insertFacultad(facultad));
            }
        }
        if(objeto.equals("carrera")){
            if(transact.equals("insert")){
                Integer facultad = Integer.parseInt(request.getParameter("facultad"));
                String carrera = request.getParameter("carrera");
                json = new Gson().toJson(controller2.insertCarrera(facultad, carrera));
            }
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
