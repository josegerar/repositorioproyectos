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
import org.Object.Variable;

/**
 *
 * @author F
 */
public class VariableController extends ConexionMySQL {

    ArrayList<Variable> getVariablesProyecto(String idProyecto) {
        ArrayList<Variable> variables = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "";
        try {
            sql = sql.concat("SELECT v.id_variable,v.id_proyecto, v.tipo, v.variable \n");
            sql = sql.concat("FROM variable v INNER JOIN proyecto_integrador p \n");
            sql = sql.concat("ON v.id_proyecto=p.id_proyecto WHERE p.id_proyecto = ?");
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, idProyecto);
            rs = pst.executeQuery();
            while (rs.next()) {
                Variable variable = new Variable();
                variable.setId(rs.getInt("id_variable"));
                variable.setIdProyecto(rs.getInt("id_proyecto"));
                String tipo = rs.getString("tipo");
                if (tipo.equals("I")) {
                    variable.setTipo("Independiente");
                } else if (tipo.equals("D")) {
                    variable.setTipo("Dependiente");
                }
                variable.setVariable(rs.getString("variable"));
                variables.add(variable);
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
        return variables;
    }

    public void insertVariableProyecto(ArrayList<Variable> variable, Integer idproyecto) throws SQLException {

        PreparedStatement pst;
        
        String sql = "insert into variable (id_proyecto,tipo,variable) values (?, ?, ?);";
        
        for (Variable i : variable) {
            pst = getConnection().prepareStatement(sql);
            pst.setInt(1, idproyecto);
            pst.setString(2, i.getTipo());
            pst.setString(3, i.getVariable());
            pst.executeUpdate();
        }
        
    }

}
