/*BURBANO MECO
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.Object.Ciudad;
import org.Object.Provincia;
import org.Object.Profesion;
import org.Object.Institucion;
/**
 *
 * @author Suanny
 */
public class ConexionMySQL {

    String bd = "pivii";
    String user = "root";
    String password = "qwerty";
    //jdbc:mysql://localhost:3306/pivii?zeroDateTimeBehavior=convertToNull
    String url = "jdbc:mysql://localhost:3306/pivii?autoReconnect=true&useSSL=false";

    Connection connection;
    Statement statement;
    String message;
    ResultSet resultSet;

    //Constructor de clase que se conecta a la base de datoS
    public ConexionMySQL() {

        //String urlDatabase = "jdbc:postgresql://localhost:5432/AutismoDB";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
            message = "ok";
        } catch (Exception e) {
            System.out.println("Ocurrio un error : " + e.getMessage());
            message = e.getMessage();
        }
        //System.out.println("La conexión se realizo sin problemas! =) ");
    }
public static Connection getConnectionE() {
        Connection cn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pivii?autoReconnect=true&useSSL=false", "root", "qwerty");
        } catch (Exception e) {

        }
        return cn;
    }
    public ConexionMySQL(Connection connection, Statement statement, String message, ResultSet resultSet) {
        this.connection = connection;
        this.statement = statement;
        this.message = message;
        this.resultSet = resultSet;
    }

    public void close() {
        try {
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception ex) {
            message = ex.getMessage();
        }
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Connection ConexionPostgreSQLABD() {

        return connection;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public ResultSet select(String sentence) {
        //ResultSet resultSet = null;

        if (message.equals("ok")) {
            try {
                statement = getConnection().createStatement();
                resultSet = statement.executeQuery(sentence);
            } catch (SQLException exSQL) {
                message = exSQL.getMessage();
            }
        }
        return resultSet;
    }

    public boolean accion(String sentence) {
        //ResultSet resultSet = null;
        boolean b = false;
        if (message.equals("ok")) {
            try {
                statement = getConnection().createStatement();
                statement.execute(sentence);
                b = true;
            } catch (SQLException exSQL) {
                b = false;
                message = exSQL.getMessage();
            }
        }
        return b;
    }

public static LinkedList<Provincia> getProvincias() {

        LinkedList<Provincia> listaProvincia = new LinkedList<Provincia>();
        try {
           Class.forName("com.mysql.jdbc.Driver");
            Connection conexion =  DriverManager.getConnection("jdbc:mysql://localhost:3306/pivii?autoReconnect=true&useSSL=false", "root", "qwerty");
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("select * from provincia;");
            while (rs.next()) {
                Provincia provincia = new Provincia();
                provincia.setIdProvincia(rs.getInt("idProvincia"));
                provincia.setNombre(rs.getString("nombre"));
                listaProvincia.add(provincia);
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaProvincia;
    }
public static LinkedList<Ciudad> getCiudad(String idProvincia) {

        LinkedList<Ciudad> listaCiudad = new LinkedList<Ciudad>();
        try {
           Class.forName("com.mysql.jdbc.Driver");
            Connection conexion =  DriverManager.getConnection("jdbc:mysql://localhost:3306/pivii?autoReconnect=true&useSSL=false", "root", "qwerty");
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("select * from ciudad where Provincia_idProvincia="+idProvincia+";");
            while (rs.next()) {
                Ciudad ciudad = new Ciudad();
                ciudad.setIdCiudad(rs.getInt("idCiudad"));
                ciudad.setNombre(rs.getString("nombre"));
                listaCiudad.add(ciudad);
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaCiudad;
    }
public static LinkedList<Profesion> getProfesion()
{    
        LinkedList<Profesion> listaProfesion = new LinkedList<Profesion>();
        try {
           Class.forName("com.mysql.jdbc.Driver");
            Connection conexion =  DriverManager.getConnection("jdbc:mysql://localhost:3306/pivii?autoReconnect=true&useSSL=false", "root", "qwerty");
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("select * from profesion;");
            while (rs.next()) {
                Profesion profesion=new Profesion();
                profesion.setProfesionID(rs.getInt("idProfesion"));
                profesion.setNombre(rs.getString("nombre"));
                listaProfesion.add(profesion);
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaProfesion;    
}
public static LinkedList<Institucion> getInstitucion()
{    
     LinkedList<Institucion> listaInstitucion = new LinkedList<Institucion>();
        try {
           Class.forName("com.mysql.jdbc.Driver");
            Connection conexion =  DriverManager.getConnection("jdbc:mysql://localhost:3306/pivii?autoReconnect=true&useSSL=false", "root", "qwerty");
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("select * from institucion;");
            while (rs.next()) {
                Institucion institucion=new Institucion();
                institucion.setInstitucionID(rs.getInt("idInstitucion"));
                institucion.setNombre(rs.getString("nombre"));
                listaInstitucion.add(institucion);
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaInstitucion;    
}
 public static String seleccion(String sentence) {
        //ResultSet resultSet = null;
        String cadena = "";

        try {
           Class.forName("com.mysql.jdbc.Driver");
            Connection conexion =  DriverManager.getConnection("jdbc:mysql://localhost:3306/pivii?autoReconnect=true&useSSL=false", "root", "qwerty");
          Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(sentence);
            while (rs.next()) {
                cadena = rs.getString("resultado");
            }
        } catch (SQLException exSQL) {

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionMySQL.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cadena;
    }
     public int validacion(String sentence) {
        ResultSet resultSet = null;
        int b = 0;
        if (message.equals("ok")) {
            try {
                statement = getConnection().createStatement();
                resultSet = statement.executeQuery(sentence);
                if(resultSet.next())
                {
                  b=resultSet.getInt(1);
                }
                else{
                    b=0;
                }
                
            } catch (SQLException exSQL) {
                message = exSQL.getMessage();
            }
        }
        return b;
    }
}