/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.banco.datos;

import com.fpmislata.banco.modelo.EntidadBancaria;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author alumno
 */
public class EntidadBancariaDAOImpHibernate extends GenericDAOImpHibernate<EntidadBancaria, Integer>implements EntidadBancariaDAO {
    
 
   
   

 
 

  
   @Override
    public List<EntidadBancaria> findByCodigo(String codigo){
       Session session=sessionFactory.getCurrentSession();
       Query query = session.createQuery("SELECT eb FROM EntidadBancaria eb where codigoEntidad= ?");
       query.setString(0, codigo);
       List<EntidadBancaria> listaporCodigo = query.list();
        
       return listaporCodigo;
       
   }
   
   @Override
     public List<EntidadBancaria> findByNombre(String nombre){
       Session session=sessionFactory.getCurrentSession();
       Query query = session.createQuery("SELECT eb FROM EntidadBancaria eb where nombre like ?");
       query.setString(0,"%"+nombre+"%");
       List<EntidadBancaria> listaporNombre = query.list();
        if((nombre == null)||(nombre.trim().equals(""))){
           listaporNombre=findAll();
           
       }
       
       return listaporNombre;
       
   }
    
}
