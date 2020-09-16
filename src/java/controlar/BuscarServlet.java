/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlar;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DataR;
import model.RepositorioD;

/**
 *
 * @author cris_
 */
@WebServlet(name = "BuscarServlet", urlPatterns = {"/BuscarServlet"})
public class BuscarServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String condicion = request.getParameter("condicion");
            String filtro = request.getParameter("filtro");
            String pag = request.getParameter("pagi");
            String ban = request.getParameter("ban");
            // out.println("Buscar Servlet"+filtro);
            // int npagina= Integer.parseInt(request.getParameter("npagina"));
            int npagina = Integer.parseInt(pag);
            npagina = npagina * 17;
            int cont = 0, aux = npagina - 17;
            DataR d = new DataR();

            for (RepositorioD R : d.getRepositorio(condicion, filtro, "")) {
                cont++;
                if (cont <= npagina && cont > aux) {
                    out.println("<tr>");
                    out.println("<td><a href=\"javascript:void(0)\" onclick=\"paginacion('pages/DetalleCD.jsp', {'id': "+ R.getIdDonaciones() +" })\">" + R.getNombreConjuntoDatos() + "</a></td>");
                    out.println("<td>" + R.getTipoDatos() + "</td>");
                    out.println("<td>" + R.getTarea() + "</td>");
                    out.println("<td>" + R.getTipoAtributo() + "</td>");
                    out.println("<td>" + R.getNumeroInstancia() + "</td>");
                    out.println("<td>" + R.getNumeroAtributos() + "</td>");
                    out.println("<td>" + R.getAnio() + "</td>");
                    out.println("</tr>");
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
        } catch (SQLException ex) {
            Logger.getLogger(BuscarServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BuscarServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(BuscarServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BuscarServlet.class.getName()).log(Level.SEVERE, null, ex);
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
