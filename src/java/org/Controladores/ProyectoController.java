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
import org.Object.Autor;
import org.Object.Proyecto;

/**
 *
 * @author crist
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
        sql = sql.concat("SELECT DISTINCT * FROM (SELECT p.id_proyecto, p.titulo, p.modulo, p.objetivo, \n");
        sql = sql.concat("CAST( p.fecha_registro AS CHAR) AS fecha, c.nombre_carrera, p.resumen, \n");
        sql = sql.concat("p.periodo_lectivo, p.url_proyecto , c.id_facultad, c.id_carrera \n");
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
                proyecto.setSemestre(String.valueOf(rs.getInt("modulo")));
                proyecto.setPeriodo(rs.getString("periodo_lectivo"));
                proyecto.setResumen(rs.getString("resumen"));
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
        return this.page > 1;
    }

    public ArrayList<Proyecto> getForManual(String condiciones) {
        String[] palabras = condiciones.split(" ");

        sql = sql.concat("WHERE ");

        for (String p : palabras) {
            if (p.length() > 0) {

                if (parameters.size() > 0) {
                    sql = sql.concat("OR ");
                }

                parameters.add("%".concat(p).concat("%"));
                parameters.add("%".concat(p).concat("%"));
                parameters.add("%".concat(p).concat("%"));
                parameters.add("%".concat(p).concat("%"));
                sql = sql.concat("p.titulo LIKE ? OR p.objetivo LIKE ? OR p.modulo LIKE ? OR p.periodo_lectivo LIKE ? \n");

            }
        }

        return this.getAll();
    }

    public Proyecto getProyecto(String id) {
        Proyecto p;

        sql = sql.concat("WHERE p.id_proyecto = ? \n");

        parameters.add(id);

        ArrayList<Proyecto> ps = this.getAll();

        if (ps.size() > 0) {
            p = ps.get(0);
        } else {
            p = new Proyecto();
        }

        p.setCoordinador(new CoordinadorController().getCoordinadorProyecto(id));
        p.setAutores(new AutorController().getAutoresProyecto(id));
        p.setVariables(new VariableController().getVariablesProyecto(id));

        return p;
    }

    private boolean existsProyecto(String titulo, String objetivo, String resumen) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        int cont = 0;
        try {
            String query = "select count(*) from proyecto_integrador where titulo = ? or objetivo = ? or resumen = ?;";
            pst = getConnection().prepareStatement(query);
            pst.setString(1, titulo);
            pst.setString(2, objetivo);
            pst.setString(3, resumen);
            rs = pst.executeQuery();
            if (rs.next()) {
                cont = rs.getInt(1);
            }
            return cont > 0;
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
        return false;
    }

    public String insertProyectos(Proyecto proyecto) {
        String sms = "";
        Integer lastId;
        if (proyecto != null) {
            if (existsProyecto(proyecto.getTitulo(), proyecto.getObjetivo(), proyecto.getResumen()) != true) {
                Integer estado;
                PreparedStatement pst = null;
                String query;
                try {
                    query = "insert into proyecto_integrador (fecha_registro, titulo, modulo, periodo_lectivo, objetivo, resumen, url_proyecto, id_usuario) values (now(),?,?,?,?,?,?,?);";
                    pst = getConnection().prepareStatement(query);
                    pst.setString(1, proyecto.getTitulo());
                    pst.setInt(2, Integer.parseInt(proyecto.getSemestre()));
                    pst.setString(3, proyecto.getPeriodo() + " " + proyecto.getAnio());
                    pst.setString(4, proyecto.getObjetivo());
                    pst.setString(5, proyecto.getResumen());
                    pst.setString(6, proyecto.getUrl());
                    pst.setInt(7, proyecto.getCoordinador().getIdUsuario());
                    estado = pst.executeUpdate();
                    if (estado > 0) {
                        lastId = this.getLastIdProyecto();
                        this.insertAutorProyecto(proyecto.getAutores(), lastId);
                        new VariableController().insertVariableProyecto(proyecto.getVariables(), lastId);
                        sms = "Proyecto registrado exitosamente";
                    } else {
                        sms = "No se ingresaron los datos, intente nuevamente";
                    }
                } catch (SQLException sqle) {
                    sms = sms + "SQLState: " + sqle.getSQLState() + "SQLErrorCode: " + sqle.getErrorCode() + sqle.getMessage();
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
            } else {
                sms = "Ya existe un proyecto registrado con los datos de titulo y/o objetivo y/o resumen";
            }
        } else {
            sms = "Proyecto a guardar esta vacio o nulo";
        }

        return sms;
    }

    private Integer getLastIdProyecto() throws SQLException {
        Integer id = 0;
        PreparedStatement pst;
        ResultSet rs;
        String query;
        query = "select max(id_proyecto) as idlast from proyecto_integrador;";
        pst = getConnection().prepareStatement(query);
        rs = pst.executeQuery();
        if (rs.next()) {
            id = rs.getInt("idlast");
        }
        pst.close();
        rs.close();
        return id;
    }

    private void insertAutorProyecto(ArrayList<Autor> autores, Integer idproyecto) throws SQLException {
        PreparedStatement pst = null;
        String query;
        query = "insert into proyecto_autor (id_proyecto, id_autor) values (?, ?);";
        for (Autor i : autores) {
            pst = getConnection().prepareStatement(query);
            pst.setInt(1, idproyecto);
            pst.setInt(2, i.getId_autor());
            pst.executeUpdate();
        }
        if (pst != null) {
            pst.close();
        }
    }

    public String updateProyecto(Proyecto proyecto) {
        String sms = "";
        PreparedStatement pst = null;
        String query = "";
        query = query.concat("UPDATE proyecto_integrador \n");
        query = query.concat("	SET \n");
        query = query.concat("	titulo = ?, \n");
        query = query.concat("	modulo = ?,  \n");
        query = query.concat("	periodo_lectivo = ?, \n");
        query = query.concat("	objetivo = ?,  \n");
        query = query.concat("	resumen = ?,  \n");
        query = query.concat("	url_proyecto = ?, \n");
        query = query.concat("	id_usuario = ? \n");
        query = query.concat("	WHERE \n");
        query = query.concat("	id_proyecto = ? ;");
        try {
            pst = getConnection().prepareStatement(query);
            pst.setString(1, proyecto.getTitulo());
            pst.setInt(2, Integer.parseInt(proyecto.getSemestre()));
            pst.setString(3, proyecto.getPeriodo() + " " + proyecto.getAnio());
            pst.setString(4, proyecto.getObjetivo());
            pst.setString(5, proyecto.getResumen());
            pst.setString(6, proyecto.getUrl());
            pst.setInt(7, proyecto.getCoordinador().getIdUsuario());
            pst.setInt(8, proyecto.getId());
            Integer estado = pst.executeUpdate();
            if (estado > 0) {
                this.updateAutorProyecto(proyecto.getAutores(), proyecto.getId());
                new VariableController().updateVariableProyecto(proyecto.getVariables(), proyecto.getId());
                sms = "Proyecto actualizado exitosamente";
            } else {
                sms = "No se actualizaron los datos, intente nuevamente";
            }
        } catch (SQLException sqle) {
            sms = sms + "SQLState: " + sqle.getSQLState() + "SQLErrorCode: " + sqle.getErrorCode() + sqle.getMessage();
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

    private void updateAutorProyecto(ArrayList<Autor> autores, Integer id) throws SQLException {
        String query = "DELETE FROM proyecto_autor WHERE id_proyecto = ?;";
        PreparedStatement pst;
        pst = getConnection().prepareStatement(query);
        pst.setInt(1, id);
        pst.executeUpdate();
        this.insertAutorProyecto(autores, id);
        pst.close();
    }

}
