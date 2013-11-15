<%-- 
    Document   : borrar
    Created on : 07-nov-2013, 9:20:51
    Author     : alumno
--%>

<%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%>
<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate"%>
<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Integer idEntidadBancaria=Integer.parseInt (request.getParameter("idEntidadBancaria"));
    
    EntidadBancariaDAO entidadDAO= new EntidadBancariaDAOImpHibernate();
    
    EntidadBancaria entidad=entidadDAO.read(idEntidadBancaria);
    
    entidadDAO.delete(idEntidadBancaria);
            
   
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrado </title>
    </head>
    <body>
        <h1>Borrado </h1>
        <h2>Codigo entidad: <%=entidad.getCodigoEntidad()%></h2>
        <h3>Nombre Entidad: <%=entidad.getNombre()%>
    </body>
</html>
