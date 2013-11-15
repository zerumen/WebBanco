/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.banco.datos;




import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.context.internal.ThreadLocalSessionContext;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author alumno
 */
public class HibernateUtil {

    private static  SessionFactory sessionFactory;
    
    public static synchronized void buildSessionFactory(){
      if (sessionFactory == null) {  
     Configuration configuration = new Configuration();
          configuration.configure();
           configuration.setProperty("hibernate.current_session_context_class", "thread");
          ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
          sessionFactory = configuration.buildSessionFactory(serviceRegistry);
      }
}
    
    public static SessionFactory getSessionFactory() {
      if (sessionFactory==null)  {
           buildSessionFactory();
        }
         return sessionFactory;
    }
    
    public static void closeSessionFactory() {
        if ((sessionFactory!=null) && (sessionFactory.isClosed()==false)) {
             sessionFactory.close();
        }
     }
      public static void openSessionAndBindToThread() {
        Session session = sessionFactory.openSession();
         ThreadLocalSessionContext.bind(session);
    }
      
     public static void closeSessionAndUnbindFromThread() {
         Session session = ThreadLocalSessionContext.unbind(sessionFactory);
        if (session!=null) {
            session.close();
         }
     }
}
