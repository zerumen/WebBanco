<%-- 
    Document   : insert
    Created on : 07-nov-2013, 10:56:52
    Author     : alumno
--%>

<%@page import="com.fpmislata.banco.modelo.TipoentidadBancaria"%>
<%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%>
<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate"%>
<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int idEntidadBancaria=Integer.parseInt(request.getParameter("idEntidadBancaria"));
    String codigoentidad=request.getParameter("codigo");
    String nombreentidad=request.getParameter("nombre");
    String cifentidad=request.getParameter("cif");
    TipoentidadBancaria tipoentidadbancaria=TipoentidadBancaria.valueOf(request.getParameter("TipoEntidadBancaria"));
    
    EntidadBancaria entidad=new EntidadBancaria();
        entidad.setIdEntidadBancaria(idEntidadBancaria);
        entidad.setCodigoEntidad(codigoentidad);
        entidad.setNombre(nombreentidad);
        entidad.setCif(cifentidad);
        entidad.setEntidad(tipoentidadbancaria);
    EntidadBancariaDAO entidadDAO= new EntidadBancariaDAOImpHibernate();
    entidadDAO.insert(entidad);
 
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertado</title>
    </head>
    <body>
        <h1>Insertado</h1>
        <a href="index.jsp">Volver a Listado</a>
    </body>
</html>
