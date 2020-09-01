/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Object;

/**
 *
 * @author crist
 */
public class Autor {
    Integer id_autor;
    Integer id_carrera;
    String identificacion;
    String fecha_nacimiento;
    String nombre;
    String apellido;
    String email;

    public Autor() {
    }

    public Autor(Integer id_autor, Integer id_carrera, String identificacion, String fecha_nacimiento, String nombre, String apellido, String email) {
        this.id_autor = id_autor;
        this.id_carrera = id_carrera;
        this.identificacion = identificacion;
        this.fecha_nacimiento = fecha_nacimiento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
    }

    public Integer getId_autor() {
        return id_autor;
    }

    public void setId_autor(Integer id_autor) {
        this.id_autor = id_autor;
    }

    public Integer getId_carrera() {
        return id_carrera;
    }

    public void setId_carrera(Integer id_carrera) {
        this.id_carrera = id_carrera;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
    
}
