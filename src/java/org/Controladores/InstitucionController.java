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
import org.Object.Institucion;

/**
 *
 * @author crist
 */
public class InstitucionController extends ConexionMySQL{
    public ArrayList<Institucion> getInstituciones(String nombre) {
        
        ArrayList<Institucion> instituciones = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from institucion where nombre like ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, "%"+nombre+"%");
            rs = pst.executeQuery();
            
            while (rs.next()) {
                Institucion institucion = new Institucion();
                institucion.setInstitucionID(rs.getInt("idInstitucion"));
                institucion.setNombre(rs.getString("nombre"));
                instituciones.add(institucion);
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
        return instituciones;
    }
}
