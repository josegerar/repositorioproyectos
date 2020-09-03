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
import org.Object.Provincia;
/**
 *
 * @author crist
 */
public class ProvinciaController extends ConexionMySQL{
    public ArrayList<Provincia> getProvincias(String nombre) {
        
        ArrayList<Provincia> provincias = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "SELECT * FROM(SELECT idProvincia, nombre FROM provincia) AS p WHERE p.nombre LIKE ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, "%"+nombre+"%");
            rs = pst.executeQuery();
            while (rs.next()) {
                Provincia user = new Provincia();
                user.setIdProvincia(rs.getInt("idProvincia"));
                user.setNombre(rs.getString("nombre"));
                provincias.add(user);
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
        return provincias;
    }
}
