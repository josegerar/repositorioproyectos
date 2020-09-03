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
import org.Object.Profesion;

/**
 *
 * @author crist
 */
public class ProfesionController extends ConexionMySQL {
    public ArrayList<Profesion> getProfesiones(String nombre) {
        
        ArrayList<Profesion> profesiones = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from profesion where nombre like ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, "%"+nombre+"%");
            rs = pst.executeQuery();
            
            while (rs.next()) {
                Profesion profesion = new Profesion();
                profesion.setProfesionID(rs.getInt("idProfesion"));
                profesion.setNombre(rs.getString("nombre"));
                profesiones.add(profesion);
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
        return profesiones;
    }
}
