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
public class Data {

    private Conexion con;

    public Data() throws SQLException, ClassNotFoundException {
        con = new Conexion(
                "localhost",
                "test_jquery",
                "root",
                "1234"
        );
    }

    public List<Jugador> getJugadores(String filtro) throws SQLException {
        List<Jugador> lista = new ArrayList<>();
        String query = "SELECT * FROM jugador "
                + "WHERE nombre LIKE '%" + filtro + "%' OR "
                + "pais LIKE '%" + filtro + "%' OR "
                + "posicion LIKE '%" + filtro + "%' OR "
                + "equipo LIKE '%" + filtro + "%' OR "
                + "dorsal LIKE '%" + filtro + "%';";
        ResultSet rs = con.ejecutarSelect(query);
        Jugador j;

        while (rs.next()) {

            j = new Jugador();

            j.setId(rs.getInt(1));
            j.setNombre(rs.getString(2));
            j.setPais(rs.getString(3));
            j.setPosicion(rs.getString(4));
            j.setEquipo(rs.getString(5));
            j.setDorsal(rs.getInt(6));

            lista.add(j);
        }
        con.desconectar();
        return lista;
    }

    public Jugador getJugador(String id) throws SQLException {
        Jugador j = null;

        ResultSet rs = con.ejecutarSelect("select * from jugador where id =" + id);
        if (rs.next()) {

            j = new Jugador();

            j.setId(rs.getInt(1));
            j.setNombre(rs.getString(2));
            j.setPais(rs.getString(3));
            j.setPosicion(rs.getString(4));
            j.setEquipo(rs.getString(5));
            j.setDorsal(rs.getInt(6));

            con.desconectar();

        }
        return j;

    }
}
