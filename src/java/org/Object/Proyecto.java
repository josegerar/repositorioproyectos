/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Object;

/**
 *
 * @author F
 */
public class Proyecto {
    
    Integer id;
    String titulo;
    String semestre;
    String fecha;
    String objetivo;
    String carrera;
    String periodo;
    String url;

    public Proyecto(Integer id, String titulo, String semestre, String fecha, String objetivo, String carrera, String periodo) {
        this.id = id;
        this.titulo = titulo;
        this.semestre = semestre;
        this.fecha = fecha;
        this.objetivo = objetivo;
        this.carrera = carrera;
        this.periodo = periodo;
    }

    public Proyecto(Integer id, String titulo) {
        this.id = id;
        this.titulo = titulo;
    }

    public Proyecto() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Proyecto{" + "id=" + id + ", titulo=" + titulo + ", semestre=" + semestre + ", fecha=" + fecha + ", objetivo=" + objetivo + ", carrera=" + carrera + ", periodo=" + periodo + ", url=" + url + '}';
    }

}
