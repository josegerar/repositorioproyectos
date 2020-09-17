/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.ConexionR;

/**
 *
 * @author cris_
 */
@MultipartConfig
@WebServlet(name = "SubirArchGener", urlPatterns = {"/SubirArchGener"})
public class SubirArchGener extends HttpServlet {

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

        String variblesClase = request.getParameter("txtVariables");
        String numRequer = request.getParameter("txtestimar");
        try {

            //file1 es el nombre de subir archivos
            Part filePart = request.getPart("file1"); // Retrieves <input type="file" name="file">
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            InputStream fileContent = filePart.getInputStream();

            File fichero = new File("C:\\Users\\cris_\\Desktop\\pivi\\Nueva carpeta\\PII\\web\\GenerarDatos", fileName);
            String rut = "C:/Users/cris_/Desktop/pivi/Nueva carpeta/PII/web/GenerarDatos/" + fileName;
            //Llama a la conexion a R recordar que se necesita tener iniciado RServer en R investigar sobre R server
            ConexionR con = new ConexionR();
            con.conectar(rut, variblesClase, numRequer);

            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, fichero.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            //out.print("data in inserted");
        } catch (IOException | ServletException e) {
            // out.print(e.getMessage());
        }
        request.getRequestDispatcher("descargarDG.html").forward(request, response);
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
