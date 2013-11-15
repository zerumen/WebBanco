/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.banco.datos;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


  public class HibernateContextListenerAndFilter implements Filter,ServletContextListener {

    @Override
     public void contextInitialized(ServletContextEvent sce) {
        HibernateUtil.buildSessionFactory();
        System.out.println("Iniciando Aplicacion");
    }
    
  @Override
     public void contextDestroyed(ServletContextEvent sce) {
         HibernateUtil.closeSessionFactory();
         System.out.println("Cerrando Cerrando");
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
         //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
          try {
            HibernateUtil.openSessionAndBindToThread();
           filterChain.doFilter(servletRequest, servletResponse);
        } finally {
            HibernateUtil.closeSessionAndUnbindFromThread();
        }
    }

    @Override
    public void destroy() {
        //To change body of generated methods, choose Tools | Templates.
    }
}
