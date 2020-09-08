/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.servlet;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.DriverManager;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.Controladores.CoordinadorController;
import org.Controladores.ProyectoController;
import org.Object.Autor;
import org.Object.Proyecto;
import org.Object.Usuario;
import org.Object.Variable;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

/**
 *
 * @author crist
 */
@WebServlet(name = "TransactProyecto", urlPatterns = {"/TransactProyecto"})
public class TransactProyecto extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TransactProyecto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransactProyecto at " + request.getContextPath() + "</h1>");
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

        Proyecto proyecto = new Proyecto();
        String sms = "";
        PrintWriter out = response.getWriter();
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            ServletFileUpload upload = new ServletFileUpload();
            try {
                FileItemIterator iter = upload.getItemIterator(request);
                FileItemStream item = null;
                String name = "";
                InputStream stream = null;
                while (iter.hasNext()) {
                    item = iter.next();
                    name = item.getFieldName();
                    stream = item.openStream();
                    if (item.isFormField()) {
                        if (name.equals("titulo")) {
                            proyecto.setTitulo(Streams.asString(stream));
                        } else if (name.equals("modulo")) {
                            proyecto.setSemestre(Streams.asString(stream));
                        } else if (name.equals("periodolectivo")) {
                            proyecto.setPeriodo(Streams.asString(stream));
                        } else if (name.equals("anio")) {
                            proyecto.setAnio(Streams.asString(stream));
                        } else if (name.equals("objetivo")) {
                            proyecto.setObjetivo(Streams.asString(stream));
                        } else if (name.equals("resumen")) {
                            proyecto.setResumen(Streams.asString(stream));
                        } else if (name.equals("coordinador")) {
                            proyecto.setCoordinador(new Usuario(Integer.parseInt(Streams.asString(stream))));
                        } else if (name.equals("autores")) {
                            String[] v = Streams.asString(stream).split(",");
                            ArrayList<Autor> autor = new ArrayList<Autor>();
                            for (String i : v) {
                                autor.add(new Autor(Integer.parseInt(i)));
                            }
                            proyecto.setAutores(autor);
                        } else if (name.equals("variables")) {
                            ArrayList<Variable> variableArray = new ArrayList<Variable>();
                            JsonParser parser = new JsonParser();
                            JsonArray gsonArrClases = parser.parse(Streams.asString(stream)).getAsJsonArray();
                            for (JsonElement gsonArrClase : gsonArrClases) {
                                Variable variable = new Variable();
                                JsonObject gsonObj = gsonArrClase.getAsJsonObject();
                                String vv = gsonObj.get("valorvariable").getAsString();
                                String tv = gsonObj.get("tipovariable").getAsString();
                                variable.setVariable(vv);
                                variable.setTipo(tv);
                                variableArray.add(variable);
                            }
                            proyecto.setVariables(variableArray);
                        }
                    } else {
                        name = item.getName();
                        System.out.println("name==" + name);
                        if (name != null && !"".equals(name)) {
                            String fileName = new File(item.getName()).getName();
                            String[] extencion = fileName.split("\\.");
                            String ext = extencion[extencion.length - 1];
//                            out.write("Client file: " + item.getName() + " <br/>with file name "
//                                    + fileName + " was uploaded.<br/>");
                            Date date = new Date();
                            String ruta = "/archivos/" + proyecto.getTitulo() + "." + ext;
                            ruta = ruta.replace(" ", "_");
                            File file = new File(getServletContext().getRealPath(ruta));
                            FileOutputStream fos = new FileOutputStream(file);
                            long fileSize = Streams.copy(stream, fos, true);
                            proyecto.setUrl("/PII" + ruta);
//                            out.write("Size was " + fileSize + " bytes <br/>");
//                            out.write("File Path is " + file.getPath() + "<br/>");
                        }
                    }
                    
                }
                sms = new ProyectoController().insertProyectos(proyecto);
            } catch (FileUploadException fue) {
                out.write("Error!");
            }
            out.write(sms);
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
