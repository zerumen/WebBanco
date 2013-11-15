<%-- 
    Document   : viewforupdate
    Created on : 08-nov-2013, 9:46:57
    Author     : alumno
--%>

<%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%>
<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate"%>
<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <% Integer idEntidadBancaria=Integer.parseInt (request.getParameter("idEntidadBancaria"));
    
    EntidadBancariaDAO entidadDAO= new EntidadBancariaDAOImpHibernate();
    
    EntidadBancaria entidad=entidadDAO.read(idEntidadBancaria);
    
%>
<html>
   <link href="css/bootstrap.css" rel="stylesheet" media="screen">
      <link href="css/bootstrap-responsive.css" rel="stylesheet" media="screen">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDITAR</title>
    </head>
    <body>
       <form action="update.jsp">
            <b>Id Entidad:</b>
            <input  type="text" name="idEntidadBancaria"  class ="input-mini" value="<%=entidad.getIdEntidadBancaria()%>" readonly>
            <br>
            <b>Codigo Entidad:</b>
            <input  type="text" name="codigo"  class ="input-mini" value="<%=entidad.getCodigoEntidad()%>">
            <br>
            <b>Nombre sucursal:</b>
            <input  type="text" name="nombre"  class ="input-medium search-query" value="<%=entidad.getNombre()%>">
            <br>
            <b>CIF:</b>
            <input  type="text" name="cif"  class ="input-medium search-query" value="<%=entidad.getCif()%>">
            <br>
            <b>Tipo de Entidad Bancaria:</b>
            <select name="TipoEntidadBancaria">
                <option value="BANCO">BANCO</option>
                <option value="CAJADEAHORROS">CAJADEAHORROS</option>
                <option value="COOPERATIVAS">COOPERATIVAS</option>
                <option value="EFINANCIEROS">EFINANCIEROS</option>
            </select> 
            <br>
            
            <input type="submit" value="Editar" class="btn-danger">
        </form>
    </body>
</html>

