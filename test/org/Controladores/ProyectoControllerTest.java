/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Controladores;

import java.util.ArrayList;
import org.Object.Proyecto;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author F
 */
public class ProyectoControllerTest {
    
    public ProyectoControllerTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getAllProyects method, of class ProyectoController.
     */
//    @Test
//    public void testGetAllProyects() {
//        System.out.println("getAllProyects");
//        ProyectoController instance = new ProyectoController();
//        ArrayList<Proyecto> expResult = null;
//        ArrayList<Proyecto> result = instance.getAllProyects();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of getForSemestres method, of class ProyectoController.
     */
//    @Test
//    public void testGetForSemestres() {
//        System.out.println("getForSemestres");
//        String semestre = "";
//        ProyectoController instance = new ProyectoController();
//        ArrayList<Proyecto> expResult = null;
//        ArrayList<Proyecto> result = instance.getForSemestres(semestre);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getForFacultad method, of class ProyectoController.
//     */
//    @Test
//    public void testGetForFacultad() {
//        System.out.println("getForFacultad");
//        String facultad = "";
//        ProyectoController instance = new ProyectoController();
//        ArrayList<Proyecto> expResult = null;
//        ArrayList<Proyecto> result = instance.getForFacultad(facultad);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getForCarrera method, of class ProyectoController.
//     */
//    @Test
//    public void testGetForCarrera() {
//        System.out.println("getForCarrera");
//        String carrera = "";
//        ProyectoController instance = new ProyectoController();
//        ArrayList<Proyecto> expResult = null;
//        ArrayList<Proyecto> result = instance.getForCarrera(carrera);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of isAv method, of class ProyectoController.
     */
//    @Test
//    public void testIsAv() {
//        System.out.println("isAv");
//        ProyectoController instance = new ProyectoController();
//        boolean expResult = false;
//        boolean result = instance.isAv();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of isReg method, of class ProyectoController.
     */
//    @Test
//    public void testIsReg() {
//        System.out.println("isReg");
//        ProyectoController instance = new ProyectoController();
//        boolean expResult = false;
//        boolean result = instance.isReg();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of getForManual method, of class ProyectoController.
     */
//    @Test
//    public void testGetForManual() {
//        System.out.println("getForManual");
//        String condiciones = "";
//        ProyectoController instance = new ProyectoController();
//        ArrayList<Proyecto> expResult = null;
//        ArrayList<Proyecto> result = instance.getForManual(condiciones);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getProyecto method, of class ProyectoController.
//     */
    @Test
    public void testGetProyecto() {
        System.out.println("Test function getProyecto() con parametro id=0");
        String id = "0";
        ProyectoController instance = new ProyectoController();
        Proyecto expResult = new Proyecto();
        Proyecto result = instance.getProyecto(id);
        assertEquals(expResult.getId(), result.getId());
        if(result.getId() == null){
            System.out.println("Test function getProyecto() valido (proyecto no econtrado)");
            System.out.println("Test function getProyecto() valido (el parametro debe ser >0)");
        } else {
            fail("The test case is a prototype is fail.");
        }
        System.out.println("Test function getProyecto() con parametro id=2 (proyecto existente)");
        id = "2";
        instance = new ProyectoController();
        expResult = new Proyecto(Integer.parseInt(id));
        result = instance.getProyecto(id);
        assertEquals(expResult.getId(), result.getId());
        if(result.getId() != null && result.getId() == 2){
            System.out.println("Test function getProyecto() valido (proyecto encontrado)");
        } else {
            fail("The test case is a prototype is fail.");
        }
    }

    /**
     * Test of insertProyectos method, of class ProyectoController.
     */
//    @Test
//    public void testInsertProyectos() {
//        System.out.println("Test funcion insertProyectos()");
//        Proyecto proyecto = null;
//        ProyectoController instance = new ProyectoController();
//        String expResult = "Proyecto a guardar esta vacio o nulo";
//        String result = instance.insertProyectos(proyecto);
//        assertEquals(expResult, result);
//        if(expResult != result){
//            fail("The test case is failed.");
//        } else {
//            System.out.println("Test funcion insertProyectos() valido");
//        }   
//    }
    
}
