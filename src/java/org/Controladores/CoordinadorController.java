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
        nombre = nombre.trim();
        try {
            sql = "SELECT * FROM(SELECT idUsuario, nombre, apellido FROM usuario WHERE Rol_idRol=2) AS p \n";
            sql = sql.concat("WHERE  p.nombre LIKE ? OR p.apellido LIKE ? \n");
            sql = sql.concat("OR CONCAT_WS(' ', p.nombre, p.apellido) LIKE ? ;");
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, "%" + nombre + "%");
            pst.setString(2, "%" + nombre + "%");
            pst.setString(3, "%" + nombre + "%");
            rs = pst.executeQuery();
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setIdUsuario(rs.getInt("idUsuario"));
                user.setNombre(rs.getString("nombre") + " " + rs.getString("apellido"));
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

    public String insertCoordinadores(String user, String password, String nombre, String apellido, String cedula, String nacimiento, String email,
            String direccion, Integer nivelacademico, Integer idciudad, Integer idprofesion, Integer idinstitucion) {
        String sms = "";
        PreparedStatement pst = null;
        try {
            if (existsCoordinador(cedula, email) != true) {
                Integer estado;
                
                String sql;

                sql = "insert into usuario (nickName,password,nombre,apellido,cedula,fechaNacimiento,correo,direccion,nivelAcademico,Ciudad_idCiudad,Rol_idRol,Profesion_idProfesion,Institucion_idInstitucion) values (?,?,?,?,?,?,?,?,?,?,2,?,?);";
                pst = getConnection().prepareStatement(sql);
                pst.setString(1, user);
                pst.setString(2, password);
                pst.setString(3, nombre);
                pst.setString(4, apellido);
                pst.setString(5, cedula);
                pst.setString(6, nacimiento);
                pst.setString(7, email);
                pst.setString(8, direccion);
                pst.setInt(9, nivelacademico);
                pst.setInt(10, idciudad);
                pst.setInt(11, idprofesion);
                pst.setInt(12, idinstitucion);
                estado = pst.executeUpdate();
                if (estado > 0) {
                    sms = "Datos del coordinador ingresados exitosamente";
                } else {
                    sms = "No se ingresaron los datos, intente nuevamente";
                }
            } else {
                sms = "Ya existe un Coordinador registrado con ese No. de Identificacion y/o Email";
            }
        } catch (SQLException e) {
            sms = "A ocurrido un error al guardar la informacion";
        } finally {
            try {
                if (isConected()) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            }
        }

        return sms;
    }

    private boolean existsCoordinador(String identificacion, String email) throws SQLException {

        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        int cont = 0;

        sql = "select count(*) from usuario where cedula = ? or correo = ?;";
        pst = getConnection().prepareStatement(sql);
        pst.setString(1, identificacion);
        pst.setString(2, email);
        rs = pst.executeQuery();
        if (rs.next()) {
            cont = rs.getInt(1);
        }
        pst.close();
        rs.close();
        return cont > 0;
    }

    public Usuario getCoordinadorProyecto(String idProyecto) {
        Usuario coordinador = new Usuario();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "";
        try {
            sql = sql.concat("SELECT u.idUsuario, u.nombre, u.apellido ");
            sql = sql.concat("FROM proyecto_integrador p INNER JOIN usuario u ");
            sql = sql.concat("ON u.idUsuario=p.id_usuario WHERE p.id_proyecto = ?");
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, idProyecto);
            rs = pst.executeQuery();
            if (rs.next()) {
                coordinador.setIdUsuario(rs.getInt("idUsuario"));
                coordinador.setNombre(rs.getString("nombre"));
                coordinador.setApellido(rs.getString("apellido"));
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
        return coordinador;
    }

}
