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
public class Facultad {
    
    Integer id_facultad;
    String nombre;

    public Facultad() {
    }

    public Facultad(Integer id_facultad, String nombre) {
        this.id_facultad = id_facultad;
        this.nombre = nombre;
    }

    public Integer getId_facultad() {
        return id_facultad;
    }

    public void setId_facultad(Integer id_facultad) {
        this.id_facultad = id_facultad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
