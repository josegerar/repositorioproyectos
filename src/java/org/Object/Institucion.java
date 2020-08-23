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
public class Institucion {
    Integer institucionID;
    String nombre;
    public Institucion()
    {
    
    }
    public Institucion(Integer institucionID, String nombre) {
        this.institucionID = institucionID;
        this.nombre = nombre;
    }

    public Integer getInstitucionID() {
        return institucionID;
    }

    public void setInstitucionID(Integer institucionID) {
        this.institucionID = institucionID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
