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
import org.Object.Semestre;

/**
 *
 * @author F
 */
public class SemestreController extends ConexionMySQL{
    
    public ArrayList<Semestre> getSemestres(){
        ArrayList<Semestre> semestres = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "SELECT DISTINCT modulo FROM proyecto_integrador order by modulo asc;";
            pst = getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                Semestre semestre = new Semestre();
                semestre.setId(rs.getInt("modulo"));
                semestre.setSemestre(rs.getInt("modulo"));
                semestre.setNombre(semestre.getSemestre().toString() + " semestre");
                semestres.add(semestre);
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
        return semestres;
    }
    
}
