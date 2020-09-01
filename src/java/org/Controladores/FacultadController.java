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
 * @author F
 */
public class FacultadController extends ConexionMySQL{

    public ArrayList<Facultad> getFacultades() {
        ArrayList<Facultad> facultades = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "SELECT id_facultad, nombre_facultad FROM facultad;";
            pst = getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                Facultad facultad = new Facultad();
                facultad.setId(rs.getInt("id_facultad"));
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
    
}
