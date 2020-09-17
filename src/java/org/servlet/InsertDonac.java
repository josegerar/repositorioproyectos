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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.DAO.ConexionMySQL;
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

        ultimoId = ConexionMySQL.seleccion("select idDonaciones as resultado from donaciones order by idDonaciones desc limit 1;");
        ultimoId = String.valueOf(Integer.parseInt(ultimoId) + 1);

        String nom = request.getParameter("txtnombre");
        String res = request.getParameter("txtresumen");
        String fuen = request.getParameter("txtfuente");
        String[] tDa = request.getParameterValues("TipoD");
        String tDatos = "";
        if (tDa != null) {
            for (String tDa1 : tDa) {
                tDatos = tDatos + tDa1 + " - ";
            }
        }

        String[] ta = request.getParameterValues("Tarea");
        String Tarea = "";

        if (ta != null) {
            for (String ta1 : ta) {
                Tarea = Tarea + ta1 + " - ";
            }
        }

        String[] tb = request.getParameterValues("Tatributo");
        String Atributo = "";
        if (tb != null) {
            for (String tb1 : tb) {
                Atributo = Atributo + tb1 + " - ";
            }
        }

        String[] zon = request.getParameterValues("zona");
        String Zona = "";
        if (zon != null) {
            for (String zon1 : zon) {
                Zona = Zona + zon1 + " - ";
            }
        }

        String[] tfor = request.getParameterValues("Tf");
        String TipoF = "";
        if (tfor != null) {
            for (String tfor1 : tfor) {
                TipoF = TipoF + tfor1 + " - ";
            }
        }

        String[] vfal = request.getParameterValues("Vf");
        String ValoresF = "";
        if (vfal != null) {
            for (String vfal1 : vfal) {
                ValoresF = ValoresF + vfal1 + " - ";
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
            String qry = "insert into pivii.donaciones(Usuario_idUsuario,anio,nombreConjuntoDatos, abstracto, fuente,zona ,tipoDatos,tarea,tipoAtributo,tipoFormato,valoresFaltantes,numeroInstancia,numeroAtributos,infoRelevante,infoAtributo,documentoRelevantes,solicitudesCitacion,archivoDatos)  values(" + id + "," + anio + " ,'" + nom + "','" + res + "','" + fuen + "','" + Zona + "','" + tDatos + "','" + Tarea + "','" + Atributo + "','" + TipoF + "','" + ValoresF + "','" + NumeInst + "','" + NumeAtri + "','" + InforRele + "','" + InforAtri + "','" + DocRele + "','" + SoliCita + "','" + "archivos/" + fich + ultimoId + ".csv" + "');";
            st.executeUpdate(qry);
            //out.print("data in inserted");
        } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
            // out.print(e.getMessage());
        }

        request.getRequestDispatcher("index.html").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
