/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Object;

import java.io.Serializable;

/**
 *
 * @author F
 */
public class Variable implements Serializable{
    
    Integer id;
    Integer idProyecto;
    String tipo;
    String variable;

    public Variable() {
    }

    public Variable(Integer id, Integer idProyecto, String tipo, String variable) {
        this.id = id;
        this.idProyecto = idProyecto;
        this.tipo = tipo;
        this.variable = variable;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(Integer idProyecto) {
        this.idProyecto = idProyecto;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        switch (tipo) {
            case "i":
                this.tipo = "independiente";
                break;
            case "d":
                this.tipo = "dependiente";
                break;
            default:
                this.tipo = tipo;
                break;
        }
    }

    public String getVariable() {
        return variable;
    }

    public void setVariable(String variable) {
        this.variable = variable;
    }

    @Override
    public String toString() {
        return "Variable{" + "id=" + id + ", idProyecto=" + idProyecto + ", tipo=" + tipo + ", variable=" + variable + '}';
    }
        
}
