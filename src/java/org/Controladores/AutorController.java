/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Controladores;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.DAO.ConexionMySQL;
import org.Object.Autor;

/**
 *
 * @author crist
 */
public class AutorController extends ConexionMySQL {

    public ArrayList<Autor> getAutores(String nombre) {
        ArrayList<Autor> autores = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;

        try {
            sql = "SELECT * FROM(SELECT id_autor, nombre, apellido FROM autor) AS p WHERE p.nombre LIKE ? OR p.apellido LIKE ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, "%" + nombre + "%");
            pst.setString(2, "%" + nombre + "%");
            rs = pst.executeQuery();
            while (rs.next()) {
                Autor autor = new Autor();
                autor.setId_autor(rs.getInt("id_autor"));
                autor.setNombre(rs.getString("nombre") + " " + rs.getString("apellido"));
                autores.add(autor);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            try {
                if (isConected()) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            }
        }
        return autores;
    }

    private boolean existsAutor(String identificacion, String email) {
        boolean salida = false;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        int cont = 0;
        try {
            sql = "select count(*) from autor where identificacion = ? or email = ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, identificacion);
            pst.setString(2, email);
            rs = pst.executeQuery();
            if (rs.next()) {
                cont = rs.getInt(1);
            }
            salida = cont > 0;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            try {
                if (isConected()) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            }
        }
        return salida;
    }

    public String insertAutores(Integer carrera, String identificacion, String nacimiento, String nombre, String apellido, String email) {
        String sms = "";
        if (existsAutor(identificacion, email) != true) {
            Integer estado;
            PreparedStatement pst = null;
            String sql;
            try {
                sql = "insert into autor (id_carrera,identificacion,fecha_nacimiento,nombre,apellido,email) values (?,?,?,?,?,?);";
                pst = getConnection().prepareStatement(sql);
                pst.setInt(1, carrera);
                pst.setString(2, identificacion);
                pst.setString(3, nacimiento);
                pst.setString(4, nombre);
                pst.setString(5, apellido);
                pst.setString(6, email);
                estado = pst.executeUpdate();
                if (estado > 0) {
                    sms = "Datos del Autor ingresados exitosamente";
                } else {
                    sms = "No se ingresaron los datos, intente nuevamente";
                }
            } catch (SQLException sqle) {
                sms = sms + "SQLState: " + sqle.getSQLState() + "SQLErrorCode: " + sqle.getErrorCode();
            } finally {
                try {
                    if (isConected()) {
                        getConnection().close();
                    }
                    if (pst != null) {
                        pst.close();
                    }
                } catch (SQLException e) {
                    System.err.println(e.getMessage());
                }
            }
        } else {
            sms = "Ya existe un Autor registrado con ese No. de Identificacion y/o Email";
        }
        return sms;
    }

    ArrayList<Autor> getAutoresProyecto(String idProyecto) {
        ArrayList<Autor> autores = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "";
        try {
            sql = sql.concat("SELECT a.id_autor, a.nombre, a.apellido, a.email \n");
            sql = sql.concat("FROM proyecto_integrador AS p INNER JOIN proyecto_autor AS pa \n");
            sql = sql.concat("ON pa.id_proyecto=p.id_proyecto INNER JOIN autor AS a \n");
            sql = sql.concat("ON a.id_autor = pa.id_autor WHERE p.id_proyecto = ?");
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, idProyecto);
            rs = pst.executeQuery();
            while (rs.next()) {
                Autor autor = new Autor();
                autor.setId_autor(rs.getInt("id_autor"));
                autor.setNombre(rs.getString("nombre"));
                autor.setApellido(rs.getString("apellido"));
                autor.setEmail(rs.getString("email"));
                autores.add(autor);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            try {
                if (isConected()) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            }
        }
        return autores;
    }

}
