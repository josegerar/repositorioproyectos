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
import org.Object.Usuario;
import org.DAO.ConexionMySQL;

/**
 *
 * @author F
 */
public class CoordinadorController extends ConexionMySQL {

    public ArrayList<Usuario> getCoordinadores(String nombre) {
        
        ArrayList<Usuario> coordinadores = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "SELECT * FROM(SELECT idUsuario, nombre, apellido FROM usuario WHERE Rol_idRol=2) AS p WHERE  p.nombre LIKE ? OR p.apellido LIKE ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, "%"+nombre+"%");
            pst.setString(2, "%"+nombre+"%");
            rs = pst.executeQuery();
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setIdUsuario(rs.getInt("idUsuario"));
                user.setNombre(rs.getString("nombre"));
                user.setApellido(rs.getString("apellido"));
                coordinadores.add(user);
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
        return coordinadores;
    }

}
