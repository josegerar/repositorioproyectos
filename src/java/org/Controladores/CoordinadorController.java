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
import org.Object.Usuario;
import org.DAO.ConexionMySQL;

/**
 *
 * @author F
 */
public class CoordinadorController extends ConexionMySQL {

    public ArrayList<Usuario> getCoordinadores(String nombre) {
        
        ArrayList<Usuario> coordinadores = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "SELECT * FROM(SELECT idUsuario, nombre, apellido FROM usuario WHERE Rol_idRol=2) AS p WHERE  p.nombre LIKE ? OR p.apellido LIKE ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, "%"+nombre+"%");
            pst.setString(2, "%"+nombre+"%");
            rs = pst.executeQuery();
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setIdUsuario(rs.getInt("idUsuario"));
                user.setNombre(rs.getString("nombre") + " " + rs.getString("apellido"));
                coordinadores.add(user);
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
        return coordinadores;
    }
    
    public String insertCoordinadores (String user, String password, String nombre, String apellido, String cedula, String nacimiento, String email, 
            String direccion, Integer nivelacademico, Integer idciudad, Integer idprofesion, Integer idinstitucion){
        String sms = "";
        if(existsCoordinador(cedula, email) != true ){
            Integer estado = 0;
            PreparedStatement pst = null;
            String sql = "";
            try {
                sql = "insert into usuario (nickName,password,nombre,apellido,cedula,fechaNacimiento,correo,direccion,nivelAcademico,Ciudad_idCiudad,Rol_idRol,Profesion_idProfesion,Institucion_idInstitucion) values (?,?,?,?,?,?,?,?,?,?,2,?,?);";
                pst = getConnection().prepareStatement(sql);
                pst.setString(1, user);
                pst.setString(2, password);
                pst.setString(3, nombre);
                pst.setString(4, apellido);
                pst.setString(5, cedula);
                pst.setString(6, nacimiento);
                pst.setString(7, email);
                pst.setString(8, direccion);
                pst.setInt(9, nivelacademico);
                pst.setInt(10, idciudad);
                pst.setInt(11, idprofesion);
                pst.setInt(12, idinstitucion);
                estado = pst.executeUpdate();
                if (estado > 0 ) {
                    sms = "Datos del coordinador ingresados exitosamente";
                } else {
                    sms = "No se ingresaron los datos, intente nuevamente";
                }
            } catch (SQLException sqle){
                sms = sms + "SQLState: " + sqle.getSQLState() + "SQLErrorCode: " + sqle.getErrorCode();
                sqle.printStackTrace();
             } catch (Exception e){
                e.printStackTrace();
             } finally {
                if (getConnection() != null) {
                   try{
                      pst.close();
                      close();
                   } catch(Exception e){
                      e.printStackTrace();
                   }
                }
             }
        } else {
            sms = "Ya existe un Coordinador registrado con ese No. de Identificacion y/o Email";
        }
        return sms;
    }
    
    private boolean existsCoordinador (String identificacion, String email){
        boolean salida = false;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        int cont = 0;
        try {
            sql = "select count(*) from usuario where cedula = ? or correo = ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, identificacion);
            pst.setString(2, email);
            rs = pst.executeQuery();
            if(rs.next()) { 
                cont = rs.getInt(1);
            }
            if (cont > 0) {
                salida = true;
            } else {
                salida = false;
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
        return salida;
    }

}
