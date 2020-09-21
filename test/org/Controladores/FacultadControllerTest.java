/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Controladores;

import java.util.ArrayList;
import org.Object.Facultad;
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
public class FacultadControllerTest {
    
    public FacultadControllerTest() {
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
     * Test of getFacultades method, of class FacultadController.
     */
//    @Test
//    public void testGetFacultades_String() {
//        System.out.println("getFacultades");
//        String nombre = "";
//        FacultadController instance = new FacultadController();
//        ArrayList<Facultad> expResult = null;
//        ArrayList<Facultad> result = instance.getFacultades(nombre);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        if(result != expResult){
//            fail("The test case is a prototype.");
//        }
//        
//    }
//
//    /**
//     * Test of getFacultades method, of class FacultadController.
//     */
//    @Test
//    public void testGetFacultades_0args() {
//        System.out.println("getFacultades");
//        FacultadController instance = new FacultadController();
//        ArrayList<Facultad> expResult = null;
//        ArrayList<Facultad> result = instance.getFacultades();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of insertFacultad method, of class FacultadController.
     */
    @Test
    public void testInsertFacultad() {
        System.out.println("Test funcion insertFacultad()");
        String facultad = "";
        FacultadController instance = new FacultadController();
        String expResult = "Valor de ingreso vacio o nulo";
        String result = instance.insertFacultad(facultad);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        if(result != expResult){
            fail("The test case is a prototype error.");
        } else {
            System.out.println("Test funcion insertFacultad() valido");
        }
    }
    
}
