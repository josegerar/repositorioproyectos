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
        sql = sql.concat("SELECT * FROM (SELECT p.id_proyecto, p.titulo, p.modulo, p.objetivo, \n");
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
                proyecto.setSemestre(rs.getInt("modulo") + " semestre");
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
                sql = sql.concat("p.titulo LIKE ? OR p.objetivo LIKE ? \n");

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
    
    private boolean existsProyecto (String titulo, String objetivo, String resumen){
        boolean salida = false;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        int cont = 0;
        try {
            sql = "select count(*) from proyecto_integrador where titulo = ? or objetivo = ? or resumen = ?;";
            pst = getConnection().prepareStatement(sql);
            pst.setString(1, titulo);
            pst.setString(2, objetivo);
            pst.setString(3, resumen);
            rs = pst.executeQuery();
            if(rs.next()) { 
                cont = rs.getInt(1);
            }
            if (cont > 0) {
                salida = true;
            } else {
                salida = false;
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
        return salida;
    }
    
    public String insertProyectos (String titulo, Integer modulo, String periodo, Integer anio, String objetivo, String resumen,
            String url, Integer coordinador, Integer[] autor, Integer[] variable){
        String sms = "";
        if(existsProyecto(titulo, objetivo, resumen) != true){
            Integer estado = 0;
            PreparedStatement pst = null;
            String sql = "";
            try {
                sql = "insert into proyecto_integrador (fecha_registro, titulo, modulo, periodo_lectivo, objetivo, resumen, url_proyecto, id_usuario) values (now(),?,?,?,?,?,?,?);";
                pst = getConnection().prepareStatement(sql);
                pst.setString(1, titulo);
                pst.setInt(2, modulo);
                pst.setString(3, periodo + " " + String.valueOf(anio) + "-" + String.valueOf(anio + 1));
                pst.setString(4, objetivo);
                pst.setString(5, resumen);
                pst.setString(6, url);
                pst.setInt(7, coordinador);
                estado = pst.executeUpdate();
                if (estado > 0 ) {
                    sms = "Datos del Proyecto ingresados exitosamente";
                } else {
                    sms = "No se ingresaron los datos, intente nuevamente";
                }
            } catch (SQLException sqle){
                sms = sms + "SQLState: " + sqle.getSQLState() + "SQLErrorCode: " + sqle.getErrorCode();
                sqle.printStackTrace();
             } catch (Exception e){
                e.printStackTrace();
             } finally {
                if (getConnection() != null) {
                   try{
                      pst.close();
                      close();
                   } catch(Exception e){
                      e.printStackTrace();
                   }
                }
             } 
        } else {
            sms = "Ya eciste un proyecto registrado con los datos de titulo y/o objetivo y/o resumen";
        }
        return sms;
    }
    
    
    private Integer getLastIdProyecto (){
        Integer id = 0;
        
        return id;
    }
    
    private boolean insertAutorProyecto (Integer[] autor){
        boolean salida = false;
        
        return salida;
    }
}
