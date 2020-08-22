/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.DAO.ConexionMySQL;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author cris_
 */
@MultipartConfig
@WebServlet(name = "InsertDonac", urlPatterns = {"/InsertDonac"})

public class InsertDonac extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        String ultimoId = "";

        ConexionMySQL conex = new ConexionMySQL();
        ultimoId = conex.seleccion("select idDonaciones as resultado from donaciones order by idDonaciones desc limit 1;");
        ultimoId=  String.valueOf(Integer.parseInt(ultimoId)+ 1);

        String nom = request.getParameter("txtnombre");
        String res = request.getParameter("txtresumen");
        String fuen = request.getParameter("txtfuente");
        String[] tDa = request.getParameterValues("TipoD");
        String tDatos = "";
        if (tDa!=null) {
         for (int i = 0; i < tDa.length; i++) {
            tDatos = tDatos + tDa[i] + " - ";
        }   
        }
        

        String[] ta = request.getParameterValues("Tarea");
        String Tarea = "";

        if (ta!=null) {
            for (int i = 0; i < ta.length; i++) {
            Tarea = Tarea + ta[i] + " - ";
        }
        }
        

        String[] tb = request.getParameterValues("Tatributo");
        String Atributo = "";
        if (tb!=null) {
             for (int i = 0; i < tb.length; i++) {
            Atributo = Atributo + tb[i] + " - ";
        }
        }
       

        String[] zon = request.getParameterValues("zona");
        String Zona = "";
        if (zon!=null) {
              for (int i = 0; i < zon.length; i++) {
            Zona = Zona + zon[i] + " - ";
        }
        }
      

        String[] tfor = request.getParameterValues("Tf");
        String TipoF = "";
        if (tfor!=null) {
            for (int i = 0; i < tfor.length; i++) {
            TipoF = TipoF + tfor[i] + " - ";
        }
        }
        

        String[] vfal = request.getParameterValues("Vf");
        String ValoresF = "";
        if (vfal!=null) {
             for (int i = 0; i < vfal.length; i++) {
            ValoresF = ValoresF + vfal[i] + " - ";
        }
        }
       
        String anio = request.getParameter("txtsAnio");
        String NumeInst = request.getParameter("txtnInstancias");
        String NumeAtri = request.getParameter("txtnAtributos");
        String InforRele = request.getParameter("txtnIRelevante");
        String InforAtri = request.getParameter("txtIAtributos");
        String DocRele = request.getParameter("txtdRelevantes");
        String SoliCita = request.getParameter("txtsCitacion");

        String NombArc = "";
        Connection con = null;
        Statement st = null;
        HttpSession sesion = request.getSession(false);
        String usuario = String.valueOf(sesion.getAttribute("usuario"));
        String id = String.valueOf(sesion.getAttribute("id"));
        try {

            //file1 es el nombre de subir archivos
            Part filePart = request.getPart("file1"); // Retrieves <input type="file" name="file">
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            NombArc = fileName;
            InputStream fileContent = filePart.getInputStream();
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String cadena = dateFormat.format(date);
            String fich = cadena.replaceAll("[^0-9]", "");

            File fichero = new File("C:\\Users\\cris_\\Desktop\\pivi\\Nueva carpeta\\PII\\web\\archivos", fich + ultimoId + ".csv");

            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, fichero.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pivii", "root", "1234");
            st = con.createStatement();
            String qry = "insert into pivii.donaciones(Usuario_idUsuario,anio,nombreConjuntoDatos, abstracto, fuente,zona ,tipoDatos,tarea,tipoAtributo,tipoFormato,valoresFaltantes,numeroInstancia,numeroAtributos,infoRelevante,infoAtributo,documentoRelevantes,solicitudesCitacion,archivoDatos)  values(" + id + "," + anio + " ,'" + nom + "','" + res + "','" + fuen + "','" + Zona + "','" + tDatos + "','" + Tarea + "','" + Atributo + "','" + TipoF + "','" + ValoresF + "','" + NumeInst + "','" + NumeAtri + "','" + InforRele + "','" + InforAtri + "','" + DocRele + "','" + SoliCita + "','" + "archivos/" + fich + ultimoId +".csv"+ "');";
            st.executeUpdate(qry);
            //out.print("data in inserted");
        } catch (Exception e) {
            // out.print(e.getMessage());
        }

        request.getRequestDispatcher("Repo.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
