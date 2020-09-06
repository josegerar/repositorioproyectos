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
import org.Object.Facultad;

/**
 *
 * @author crist
 */

public class FacultadController extends ConexionMySQL {
    
    public ArrayList<Facultad> getFacultades (String nombre) {
        ArrayList<Facultad> facultades = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from facultad where nombre_facultad like ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, "%"+nombre+"%");
            rs = pst.executeQuery();
            while (rs.next()) {
                Facultad facultad = new Facultad();
                facultad.setId_facultad(rs.getInt("id_facultad"));
                facultad.setNombre(rs.getString("nombre_facultad"));
                facultades.add(facultad);
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
        return facultades;
    }
    
    private boolean existsFacultad (String facultad) {
        boolean salida = false;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        int cont = 0;
        try {
            sql = "select count(*) from facultad where nombre_facultad = ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, facultad);
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
    
    public String insertFacultad (String facultad){
        String sms = "";
        if(existsFacultad(facultad) != true){
            Integer estado = 0;
            PreparedStatement pst = null;
            String sql = "";
            try {
                sql = "insert into facultad (nombre_facultad) values (?);";
                pst = getConnection().prepareStatement(sql);
                pst.setString(1, facultad);
                estado = pst.executeUpdate();
                if (estado > 0 ) {
                    sms = "Facultad registrada exitosamente";
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
            sms = "Ya existe una Facultad registrado con ese nombre";
        }
        return sms;
    }
}
