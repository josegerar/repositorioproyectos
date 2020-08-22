/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author cris_
 */
public class RepositorioD {
       private int idDonaciones;
    private String nombreConjuntoDatos;
    private String tipoDatos;
    private String tarea;
    private String tipoAtributo;
    private String numeroInstancia;
    private String numeroAtributos;
    private String anio;
    private String observacion;
    private String validacion;

    public String getValidacion() {
        return validacion;
    }

    public void setValidacion(String validacion) {
        this.validacion = validacion;
    }
    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }


    public int getIdDonaciones() {
        return idDonaciones;
    }

    public void setIdDonaciones(int idDonaciones) {
        this.idDonaciones = idDonaciones;
    }

    public String getNombreConjuntoDatos() {
        return nombreConjuntoDatos;
    }

    public void setNombreConjuntoDatos(String nombreConjuntoDatos) {
        this.nombreConjuntoDatos = nombreConjuntoDatos;
    }

    public String getTipoDatos() {
        return tipoDatos;
    }

    public void setTipoDatos(String tipoDatos) {
        this.tipoDatos = tipoDatos;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    public String getTipoAtributo() {
        return tipoAtributo;
    }

    public void setTipoAtributo(String tipoAtributo) {
        this.tipoAtributo = tipoAtributo;
    }

    public String getNumeroInstancia() {
        return numeroInstancia;
    }

    public void setNumeroInstancia(String numeroInstancia) {
        this.numeroInstancia = numeroInstancia;
    }

    public String getNumeroAtributos() {
        return numeroAtributos;
    }

    public void setNumeroAtributos(String numeroAtributos) {
        this.numeroAtributos = numeroAtributos;
    }

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    void setObservacion(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
