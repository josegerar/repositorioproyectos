/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author cris_
 */
public class DataR {

    private Conexion con;

    public DataR() throws SQLException, ClassNotFoundException {
        con = new Conexion(
                "localhost",
                "pivii",
                "root",
                "1234"
        );
    }

    public List<RepositorioD> getRepositorio(String campo, String filtro, String exten) throws SQLException {
        List<RepositorioD> lista = new ArrayList<>();
        String query ="";
         query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where "+campo+" like '%"+filtro+"%' and validacion = 'Aprobado';";
       
        if("Otros".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where idDonaciones not in (\n" +
            "select idDonaciones from pivii.donaciones \n" +
            "where tarea like '%Agrupacion%' or tarea like '%Regresion%' or tarea like '%Clasificacion%')  and validacion = 'Aprobado';";
        }
         if("Otros".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where idDonaciones not in (\n" +
            "select idDonaciones from pivii.donaciones \n" +
            "where tarea like '%Agrupacion%' or tarea like '%Regresion%' or tarea like '%Clasificacion%')  and validacion = 'Aprobado';";
        }
        if("OtrosD".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where idDonaciones not in (\n" +
"            select idDonaciones from pivii.donaciones \n" +
"            where tipoDatos like '%Multivariate%' or tipoDatos like '%Univariantes%' or tipoDatos like '%Serie Temporal%' or tipoDatos like '%Sequential%' or tipoDatos like '%Teoria del Dominio%'\n" +
"            or tipoDatos like '%Texto%' ) and validacion = 'Aprobado';";
        }
        if("IMe10".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where numeroInstancia  <=10 and validacion = 'Aprobado';";
        }
        if("IMa100".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where numeroInstancia  >=100 and validacion = 'Aprobado';";
        }
        if("Ien10100".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where numeroInstancia  >=10 and numeroInstancia<=100 and validacion = 'Aprobado';";
        }
        
        
        if("MMe10".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where numeroAtributos  <=10 and validacion = 'Aprobado';";
        }
        if("MMa100".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where numeroAtributos  >=100 and validacion = 'Aprobado';";
        }
        if("Men10100".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where numeroAtributos  >=10 and numeroAtributos<=100 and validacion = 'Aprobado';";
        }
         if("SinF".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where validacion = 'Aprobado';";
        }
          if("Buscar".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio,validacion from\n" +
"(select * from pivii.donaciones where nombreConjuntoDatos like '%"+filtro+"%' or\n" +
"tipoDatos like '%"+filtro+"%' or tarea like '%"+filtro+"%' or tipoAtributo like '%"+filtro+"%' or numeroInstancia like '%"+filtro+"%' or numeroAtributos like '%"+filtro+"%' or anio like '%"+filtro+"%' ) as Tabla where validacion = 'Aprobado'";
        }
          if("Aprovados".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where validacion = 'Aprovado' and Usuario_idUsuario ="+filtro+";";
        }
          
        ResultSet rs = con.ejecutarSelect(query);
        RepositorioD R;

        while (rs.next()) {

            R = new RepositorioD();

            R.setIdDonaciones(rs.getInt(1));
            R.setNombreConjuntoDatos(rs.getString(2));
            R.setTipoDatos(rs.getString(3));
            R.setTarea(rs.getString(4));
            R.setTipoAtributo(rs.getString(5));
            R.setNumeroInstancia(rs.getString(6));
            R.setNumeroAtributos(rs.getString(7));
            if("Aprovado".equals(campo)){
                R.setObservacion(8);
            }else{
                 R.setAnio(rs.getString(8));
            }
           
            
            lista.add(R);
        }
        con.desconectar();
        return lista;
    }
public List<RepositorioD> getRepositorioUser(String campo, String filtro, String exten) throws SQLException {
        List<RepositorioD> lista = new ArrayList<>();
        String query ="";
         query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where "+campo+" like '%"+filtro+"%' and validacion = 'Aprovado';";
       
        if("Otros".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where idDonaciones not in (\n" +
            "select idDonaciones from pivii.donaciones \n" +
            "where tarea like '%Agrupacion%' or tarea like '%Regresion%' or tarea like '%Clasificacion%')  and validacion = 'Aprovado';";
        }
        if("OtrosD".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, anio from pivii.donaciones where idDonaciones not in (\n" +
"            select idDonaciones from pivii.donaciones \n" +
"            where tipoDatos like '%Multivariate%' or tipoDatos like '%Univariantes%' or tipoDatos like '%Serie Temporal%' or tipoDatos like '%Sequential%' or tipoDatos like '%Teoria del Dominio%'\n" +
"            or tipoDatos like '%Texto%' ) and validacion = 'Aprovado';";
        }
          if("Aprovados".equals(campo)){
            query = "select idDonaciones, nombreConjuntoDatos, tipoDatos, tarea, tipoAtributo,numeroInstancia,numeroAtributos, observacion from pivii.donaciones where validacion = 'Aprovado' and Usuario_idUsuario ="+filtro+";";
        }      
        ResultSet rs = con.ejecutarSelect(query);
        RepositorioD R;

        while (rs.next()) {

            R = new RepositorioD();

            R.setIdDonaciones(rs.getInt(1));
            R.setNombreConjuntoDatos(rs.getString(2));
            R.setTipoDatos(rs.getString(3));
            R.setTarea(rs.getString(4));
            R.setTipoAtributo(rs.getString(5));
            R.setNumeroInstancia(rs.getString(6));
            R.setNumeroAtributos(rs.getString(7));
             R.setObservacion(rs.getString(8));
              R.setValidacion(rs.getString(9));
            lista.add(R);
        }
        con.desconectar();
        return lista;
    }
    public RepositorioD getReposito(String id) throws SQLException {
        RepositorioD R = null;

        ResultSet rs = con.ejecutarSelect("select * from pivii.donaciones where idDonaciones =" + id);
        if (rs.next()) {

            R = new RepositorioD();

            R.setIdDonaciones(rs.getInt(1));
            R.setNombreConjuntoDatos(rs.getString(2));
            R.setTipoDatos(rs.getString(3));
            R.setTarea(rs.getString(4));
            R.setTipoAtributo(rs.getString(5));
            R.setNumeroInstancia(rs.getString(6));
            R.setNumeroAtributos(rs.getString(7));
            R.setAnio(rs.getString(8));

            con.desconectar();

        }
        return R;

    }
}
