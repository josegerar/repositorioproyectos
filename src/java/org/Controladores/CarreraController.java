
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
import org.Object.Carrera;

/**
 *
 * @author crist
 */
public class CarreraController extends ConexionMySQL {
    public ArrayList<Carrera> getCarreras(String nombre) {
        
        ArrayList<Carrera> carreras = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from(select id_carrera, nombre_carrera as nombre from carrera) as p where p.nombre like ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, "%"+nombre+"%");
            rs = pst.executeQuery();
            
            while (rs.next()) {
                Carrera carrera = new Carrera();
                carrera.setId_carrera(rs.getInt("id_carrera"));
                carrera.setNombre(rs.getString("nombre"));
                carreras.add(carrera);
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
        return carreras;
    }
    
    private boolean existsCarrera (String carrera){
        boolean salida = false;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        int cont = 0;
        try {
            sql = "select count(*) from carrera where nombre_carrera = ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, carrera);
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
    
    public ArrayList<Carrera> getCarreras() {
        ArrayList<Carrera> carreras = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "SELECT id_carrera, nombre_carrera FROM carrera;";
            pst = getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                Carrera carrera = new Carrera();
                carrera.setId(rs.getInt("id_carrera"));
                carrera.setNombre(rs.getString("nombre_carrera"));
                carreras.add(carrera);
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
        return carreras;
    }
    
    public String insertCarrera (Integer facultad, String carrera){
        String sms = "";
        if(existsCarrera(carrera) != true){
            String p = "";
            PreparedStatement pst = null;
            String sql = "";
            try {
                sql = "insert into carrera (id_facultad, nombre_carrera) values (?, ?);";
                pst = getConnection().prepareStatement(sql);
                pst.setInt(1, facultad);
                pst.setString(2, carrera);
                p = String.valueOf(pst.executeUpdate());
                if (p == "0") {
                    sms = "No se ingresaron los datos, intente nuevamente";
                } else {
                    sms = "Carrera registrada exitosamente";
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
            sms = "La carrera ya ha sido registrada";
        }
        return sms;
    }
}
