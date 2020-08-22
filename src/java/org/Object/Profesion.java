/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Object;

/**
 *
 * @author Suanny
 */
public class Profesion {
    Integer profesionID;
    String nombre;

    public Profesion()
    {
    }
    public Profesion(Integer profesionID, String nombre) {
        this.profesionID = profesionID;
        this.nombre = nombre;
    }

    public Integer getProfesionID() {
        return profesionID;
    }

    public void setProfesionID(Integer profesionID) {
        this.profesionID = profesionID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
