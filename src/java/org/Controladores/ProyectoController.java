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
import org.Object.Proyecto;

/**
 *
 * @author F
 */
public class ProyectoController extends ConexionMySQL {

    String sql;
    ArrayList<String> parameters;
    Integer page;
    private static Integer size = 17;

    private boolean av;

    public ProyectoController() {

        this.config("1");

    }

    public ProyectoController(String page) {

        this.config(page);

    }

    private void config(String page) {
        sql = "";
        sql = sql.concat("SELECT * FROM (SELECT p.id_proyecto, p.titulo, p.modulo, \n");
        sql = sql.concat("CAST( p.fecha_registro AS CHAR) AS fecha, p.objetivo, c.nombre_carrera,  \n");
        sql = sql.concat("p.periodo_lectivo, p.url_proyecto , c.id_facultad, c.id_carrera  \n");
        sql = sql.concat("FROM proyecto_integrador AS p INNER JOIN proyecto_autor AS pa ON pa.id_proyecto=p.id_proyecto \n");
        sql = sql.concat("INNER JOIN autor AS a ON a.id_autor = pa.id_autor \n");
        sql = sql.concat("INNER JOIN carrera c ON c.id_carrera = a.id_carrera) AS p \n");

        try {
            this.page = Integer.parseInt(page);

            if (this.page < 1) {
                this.page = 1;
            }

        } catch (NumberFormatException ex) {
            this.page = 1;
        }

        this.parameters = new ArrayList<>();
        this.av = false;
    }

    private ArrayList<Proyecto> getAll() {

        ArrayList<Proyecto> proyectos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        String inicio = String.valueOf(size * this.page - size);

        sql = sql.concat("LIMIT ").concat(inicio).concat(", ").concat(String.valueOf(size + 1));

        try {
            pst = getConnection().prepareStatement(sql);

            for (int i = 0; i < parameters.size(); i++) {
                pst.setString(i + 1, parameters.get(i));
            }

            rs = pst.executeQuery();
            while (rs.next()) {
                Proyecto proyecto = new Proyecto();
                proyecto.setId(rs.getInt("id_proyecto"));
                proyecto.setCarrera(rs.getString("nombre_carrera"));
                proyecto.setFecha(rs.getString("fecha"));
                proyecto.setObjetivo(rs.getString("objetivo"));
                proyecto.setUrl(rs.getString("url_proyecto"));
                proyecto.setTitulo(rs.getString("titulo"));
                proyecto.setSemestre(rs.getInt("modulo") + " semestre");
                proyecto.setPeriodo(rs.getString("periodo_lectivo"));
                proyectos.add(proyecto);

                if (proyectos.size() >= size) {
                    this.av = true;
                    break;
                }
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
        return proyectos;
    }

    public ArrayList<Proyecto> getAllProyects() {
        return this.getAll();
    }

    public ArrayList<Proyecto> getForSemestres(String semestre) {

        sql = sql.concat("WHERE p.modulo = ? \n");

        parameters.add(semestre);

        return this.getAll();
    }

    public ArrayList<Proyecto> getForFacultad(String facultad) {

        sql = sql.concat("WHERE p.id_facultad = ? \n");

        parameters.add(facultad);

        return this.getAll();
    }

    public ArrayList<Proyecto> getForCarrera(String carrera) {

        sql = sql.concat("WHERE p.id_carrera = ? \n");

        parameters.add(carrera);

        return this.getAll();
    }

    public boolean isAv() {

        return av;
    }

    public boolean isReg() {
        if (this.page > 1) {
            return true;
        } else {
            return false;
        }
    }

    public ArrayList<Proyecto> getForManual(String id) {
        String[] palabras = id.split(" ");

        sql = sql.concat("WHERE ");

        for (String p : palabras) {
            if (p.length() > 0) {

                if (parameters.size() > 0) {
                    sql = sql.concat("OR ");
                }

                parameters.add("%".concat(p).concat("%"));
                parameters.add("%".concat(p).concat("%"));
                sql = sql.concat("p.titulo LIKE ? OR p.objetivo LIKE ? \n");

            }
        }

        return this.getAll();
    }

}
