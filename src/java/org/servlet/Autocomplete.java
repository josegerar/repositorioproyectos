/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.Controladores.AutorController;
import org.Controladores.CarreraController;
import org.Controladores.CiudadController;
import org.Controladores.CoordinadorController;
import org.Controladores.FacultadController;
import org.Controladores.InstitucionController;
import org.Controladores.ProfesionController;
import org.Controladores.ProvinciaController;
import org.Object.Usuario;
import org.Object.Autor;
import org.Object.Provincia;
import org.Object.Ciudad;
import org.Object.Profesion;
import org.Object.Institucion;
import org.Object.Carrera;
import org.Object.Facultad;

/**
 *
 * @author F
 */
public class Autocomplete extends HttpServlet {

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
        
        String nombre = request.getParameter("nombre");
        String tipo = request.getParameter("tipo");
        
        String json = "[]";
        
        if(tipo.equals("coordinador")){
            ArrayList<Usuario> coordinadores = new CoordinadorController().getCoordinadores(nombre);
            json = new Gson().toJson(coordinadores);
        }
        if(tipo.equals("autor")){
            ArrayList<Autor> autor = new AutorController().getAutores(nombre);
            json = new Gson().toJson(autor);
        }
        if(tipo.equals("provincia")){
            ArrayList<Provincia> provincia = new ProvinciaController().getProvincias(nombre);
            json = new Gson().toJson(provincia);
        }
        if(tipo.equals("ciudad")){
            Integer idp = Integer.parseInt(request.getParameter("idProvincia"));
            ArrayList<Ciudad> ciudad = new CiudadController().getCiudades(nombre, idp);
            json = new Gson().toJson(ciudad);
        }
        if(tipo.equals("profesion")){
            ArrayList<Profesion> profesion = new ProfesionController().getProfesiones(nombre);
            json = new Gson().toJson(profesion);
        }
        if(tipo.equals("institucion")){
            ArrayList<Institucion> institucion = new InstitucionController().getInstituciones(nombre);
            json = new Gson().toJson(institucion);
        }
        if(tipo.equals("carrera")){
            ArrayList<Carrera> carrera = new CarreraController().getCarreras(nombre);
            json = new Gson().toJson(carrera);
        }
        if(tipo.equals("facultad")){
            ArrayList<Facultad> facultad = new FacultadController().getFacultades(nombre);
            json = new Gson().toJson(facultad);
        }       
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
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
