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
import org.Object.Ciudad;
import org.Object.Provincia;

/**
 *
 * @author crist
 */
public class CiudadController extends ConexionMySQL {
    public ArrayList<Ciudad> getCiudades(String nombre, Integer idp) {
        
        ArrayList<Ciudad> ciudades = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "SELECT * FROM(SELECT idCiudad, nombre, Provincia_idProvincia FROM ciudad where Provincia_idProvincia = ?) AS p WHERE p.nombre LIKE ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setInt(1, idp);
            pst.setString(2, "%"+nombre+"%");
            rs = pst.executeQuery();
            
            while (rs.next()) {
                Ciudad user = new Ciudad();
                Provincia prov = new Provincia();
                user.setIdCiudad(rs.getInt("idCiudad"));
                user.setNombre(rs.getString("nombre"));
                prov.setIdProvincia(rs.getInt("Provincia_idProvincia"));
                user.setIdProvincia(prov);
                ciudades.add(user);
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
        return ciudades;
    }
}
