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

/**
 *
 * @author crist
 */
public class ProyectoController extends ConexionMySQL {
    
    private boolean existsProyecto (String titulo, String objetivo, String resumen){
        boolean salida = false;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        int cont = 0;
        try {
            sql = "select count(*) from proyecto_integrador where titulo = ? or objetivo = ? or resumen = ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, titulo);
            pst.setString(2, objetivo);
            pst.setString(3, resumen);
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
    
    public String insertProyectos (String titulo, Integer modulo, String periodo, Integer anio, String objetivo, String resumen,
            String url, Integer coordinador, Integer[] autor, Integer[] variable){
        String sms = "";
        if(existsProyecto(titulo, objetivo, resumen) != true){
            Integer estado = 0;
            PreparedStatement pst = null;
            String sql = "";
            try {
                sql = "insert into proyecto_integrador (fecha_registro, titulo, modulo, periodo_lectivo, objetivo, resumen, url_proyecto, id_usuario) values (now(),?,?,?,?,?,?,?);";
                pst = getConnection().prepareStatement(sql);
                pst.setString(1, titulo);
                pst.setInt(2, modulo);
                pst.setString(3, periodo + " " + String.valueOf(anio) + "-" + String.valueOf(anio + 1));
                pst.setString(4, objetivo);
                pst.setString(5, resumen);
                pst.setString(6, url);
                pst.setInt(7, coordinador);
                estado = pst.executeUpdate();
                if (estado > 0 ) {
                    sms = "Datos del Proyecto ingresados exitosamente";
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
            sms = "Ya eciste un proyecto registrado con los datos de titulo y/o objetivo y/o resumen";
        }
        return sms;
    }
    
    
    private Integer getLastIdProyecto (){
        Integer id = 0;
        
        return id;
    }
    
    private boolean insertAutorProyecto (Integer[] autor){
        boolean salida = false;
        
        return salida;
    }
}
