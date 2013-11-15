<%-- 
    Document   : nuevo
    Created on : 07-nov-2013, 10:42:59
    Author     : alumno
--%>

<%@page import="com.fpmislata.banco.modelo.TipoentidadBancaria"%>
<%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%>
<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate"%>
<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%EntidadBancariaDAO entidadDAO= new EntidadBancariaDAOImpHibernate();

    EntidadBancaria entidad=new EntidadBancaria();
    
    String codigo=entidad.getCodigoEntidad();
    if(entidad.getCodigoEntidad()==null){
        codigo="";
    }
    String nombre=entidad.getNombre();
    if(entidad.getNombre()==null){
        nombre="";
    }
    
    String cif=entidad.getCif();
    if(entidad.getCif()==null){
        cif="";
    }
    
   
    
%>
<html>
    <head>
      <link href="css/bootstrap.css" rel="stylesheet" media="screen">
      <link href="css/bootstrap-responsive.css" rel="stylesheet" media="screen">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Entidad</title>
    </head>
    <body>
       <form action="insert.jsp">
            <b>Id Entidad:</b>
            <input  type="text" name="idEntidadBancaria"  class ="input-mini">
            <br>
            <b>Codigo Entidad:</b>
            <input  type="text" name="codigo"  class ="input-mini">
            <br>
            <b>Nombre sucursal:</b>
            <input  type="text" name="nombre"  class ="input-medium search-query" value="<%=entidad.getNombre()%>">
            <br>
            <b>CIF:</b>
            <input  type="text" name="cif"  class ="input-medium search-query">
            <br>
            <b>Tipo de Entidad Bancaria:</b>
            <select name="TipoEntidadBancaria">
                <option value="BANCO">BANCO</option>
                <option value="CAJADEAHORROS">CAJADEAHORROS</option>
                <option value="COOPERATIVAS">COOPERATIVAS</option>
                <option value="EFINANCIEROS">EFINANCIEROS</option>
            </select> 
            <br>
            
            <input type="submit" value="Insertar" class="btn-danger">
        </form>
    </body>
</html>
