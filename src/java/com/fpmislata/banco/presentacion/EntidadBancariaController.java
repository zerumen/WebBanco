/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.banco.presentacion;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fpmislata.banco.datos.EntidadBancariaDAO;
import com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate;
import com.fpmislata.banco.modelo.EntidadBancaria;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 *
 * @author alumno
 */
@Controller
public class EntidadBancariaController {
    @Autowired
    EntidadBancariaDAO entidadDao;
    
  @RequestMapping(value = {"/EntidadBancaria/{idEntidadBancaria}"}, method = RequestMethod.GET)
    public void read(HttpServletRequest httpRequest, HttpServletResponse httpServletResponse, @PathVariable("idEntidadBancaria") int idEntidadBancaria) {
      try {
        
          EntidadBancaria entidad=entidadDao.read(idEntidadBancaria);
          httpServletResponse.setContentType("application/json; charset=UTF-8");
          httpServletResponse.setStatus(HttpServletResponse.SC_OK);
          ObjectMapper objectMapper=new ObjectMapper();
          
          String json = objectMapper.writeValueAsString(entidad);
          httpServletResponse.getWriter().println(json);
         
            } catch (Exception ex) {
          httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
          httpServletResponse.setContentType("text/plain; charset=UTF-8");
          try {
              ex.printStackTrace(httpServletResponse.getWriter());
          } catch (IOException ex1) {
              Logger.getLogger(EntidadBancariaController.class.getName()).log(Level.SEVERE, null, ex1);
          }
      }
    }
  
  @RequestMapping(value = {"/EntidadBancaria/{idEntidadBancaria}"}, method = RequestMethod.DELETE)
    public void delete(HttpServletRequest httpRequest, HttpServletResponse httpServletResponse, @PathVariable("idEntidadBancaria") int idEntidadBancaria){
      try{
             
          entidadDao.delete(idEntidadBancaria);
          httpServletResponse.setStatus(HttpServletResponse.SC_NO_CONTENT);
          

      }catch (Exception ex){
        httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        httpServletResponse.setContentType("text/plain; charset=UTF-8");
          try {
              ex.printStackTrace(httpServletResponse.getWriter());
          } catch (IOException ex1) {
              Logger.getLogger(EntidadBancariaController.class.getName()).log(Level.SEVERE, null, ex1);
          }
      }
      
  }
  
  @RequestMapping(value={"/EntidadBancaria"},method= RequestMethod.GET)
  public void find(HttpServletRequest httpRequest, HttpServletResponse httpServletResponse){
     try{
      List<EntidadBancaria> entidad=entidadDao.findAll();
      httpServletResponse.setContentType("application/json; charset=UTF-8");
      httpServletResponse.setStatus(HttpServletResponse.SC_OK);
      ObjectMapper objectMapper=new ObjectMapper();
      
      String json = objectMapper.writeValueAsString(entidad);
      httpServletResponse.getWriter().println(json);
      
          } catch (Exception ex) {
          httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
          httpServletResponse.setContentType("text/plain; charset=UTF-8");
          try {
              ex.printStackTrace(httpServletResponse.getWriter());
          } catch (IOException ex1) {
              Logger.getLogger(EntidadBancariaController.class.getName()).log(Level.SEVERE, null, ex1);
          }
      }
  }
  
  @RequestMapping(value={"/EntidadBancaria"},method= RequestMethod.POST)
    public void insert (HttpServletRequest httpRequest, HttpServletResponse httpServletResponse,@RequestBody String json){
    try{
      ObjectMapper objectMapper = new ObjectMapper();
     objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
     EntidadBancaria entidad=(EntidadBancaria)objectMapper.readValue(json, EntidadBancaria.class);
      entidadDao.insert(entidad);
      httpServletResponse.setContentType("application/json; charset=UTF-8");
       json = objectMapper.writeValueAsString(entidad);
       httpServletResponse.getWriter().println(json);
    }catch (Exception ex) {
          httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
          httpServletResponse.setContentType("text/plain; charset=UTF-8");
          try {
              ex.printStackTrace(httpServletResponse.getWriter());
          } catch (IOException ex1) {
              Logger.getLogger(EntidadBancariaController.class.getName()).log(Level.SEVERE, null, ex1);
          }
      }
  }
  @RequestMapping(value = {"/EntidadBancaria/{idEntidadBancaria}"}, method = RequestMethod.PUT)
  public void update (HttpServletRequest httpRequest, HttpServletResponse httpServletResponse, @PathVariable("idEntidadBancaria") int idEntidadBancaria,@RequestBody String json){
     try{
      EntidadBancaria entidad=entidadDao.read(idEntidadBancaria);
      ObjectMapper objectMapper=new ObjectMapper();
      objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
      EntidadBancaria newEntidad=(EntidadBancaria)objectMapper.readValue(json, EntidadBancaria.class);
      
      entidad.setCodigoEntidad(newEntidad.getCodigoEntidad());
      entidad.setNombre(newEntidad.getNombre());
      entidad.setCif(newEntidad.getCif());
      entidad.setEntidad(newEntidad.getEntidad());
      entidadDao.update(entidad);
      
      httpServletResponse.setContentType("application/json; charset=UTF-8");
      json = objectMapper.writeValueAsString(entidad);
      httpServletResponse.getWriter().println(json);
     }catch (Exception ex) {
          httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
          httpServletResponse.setContentType("text/plain; charset=UTF-8");
          try {
              ex.printStackTrace(httpServletResponse.getWriter());
          } catch (IOException ex1) {
              Logger.getLogger(EntidadBancariaController.class.getName()).log(Level.SEVERE, null, ex1);
          }
      }
  }
  
  
}



    

