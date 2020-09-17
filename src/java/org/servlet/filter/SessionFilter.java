/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.servlet.filter;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author F
 */
public class SessionFilter implements Filter {

    ArrayList<String> pages;
    String contextPathDef = "/PII/";
    String containerPages = "pages/";

    public SessionFilter() {
        this.pages = new ArrayList<>();
        this.pages.add("repositorioDocentes.html");
        this.pages.add("repositorioProyectos.html");
        this.pages.add("registroUsuario.html");
        this.pages.add("anadircarreras.html");
        this.pages.add("anadirproyectos.html");
        this.pages.add("acuerdoDonacion.html");
        this.pages.add("misDonaciones.html");
        this.pages.add("generarDatos.html");
        this.pages.add("aprobacion.html");
        this.pages.add("detalleCD.html");
        this.pages.add("donar.html");
        this.pages.add("detalleProyecto.html");
        this.pages.add("descargarDG.html");
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Get init parameter 
        String testParam = filterConfig.getInitParameter("test-param");

        //Print the init parameter 
        System.out.println("Test Param: " + testParam);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String usuario = (String) req.getSession().getAttribute("usuario");
        String uri = req.getRequestURI();
        boolean isvalid = true;
        String newPage = "";
        for (int i = 0; i < pages.size(); i++) {
            String page = pages.get(i);
            if ((contextPathDef + containerPages + page).equals(uri)) {
                if (usuario == null) {
                    if (i >= 3) {
                        isvalid = false;
                    }
                }
                break;
            }
            if ((contextPathDef + page).equals(uri)) {
                isvalid = false;
                newPage = page;
                break;
            }
        }
        if (isvalid == true) {
            chain.doFilter(request, response);
        } else {
            if (newPage.length() > 0) {
                req.setAttribute("newPage", newPage);
            }
            resp.sendRedirect("index.html");
        }
    }

    @Override
    public void destroy() {

    }

}
