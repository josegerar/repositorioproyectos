/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Object;

import java.util.List;
/**
 *
 * @author Suanny
 */
public class Provincia {
    int idProvincia;
    String nombre;
    
    public Provincia(int idProvincia, String nombre) {
        this.idProvincia = idProvincia;
        this.nombre = nombre;
    }

    

    public Provincia() {
    }


    public void setIdProvincia(int idProvincia) {
        this.idProvincia = idProvincia;
    }

    public int getIdProvincia() {
        return idProvincia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
}
