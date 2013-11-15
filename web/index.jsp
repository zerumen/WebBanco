<%-- 
    Document   : index
    Created on : 07-oct-2013, 10:24:07
    Author     : alumno
--%>

<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate"%>
<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpJBDC"%>
<%@page import="java.util.List"%>
<%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%>
<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAO"%>
<%@page import="java.util.Date"%>
<% String nombre= request.getParameter("nombre");
    
    EntidadBancariaDAO entidadDAO= new EntidadBancariaDAOImpHibernate();
    List<EntidadBancaria> entidadesBancarias=entidadDAO.findByNombre(nombre);
    
    %>

<html>
    <head>
      <link href="css/bootstrap.css" rel="stylesheet" media="screen">
      <link href="css/bootstrap-responsive.css" rel="stylesheet" media="screen">
    </head>
    <body>
        <form  action="index.jsp">
            <b>Nombre sucursal:</b>
            <input  type="text" name="nombre"  class ="input-medium search-query">
            <input type="button" value="Buscar" class="btn-danger">
        </form>
        <a href="nuevo.jsp"><input type="button" value="Nuevo" class="btn-primary" src="nuevo.jsp"></a>      
               <table class="table">
            <tr class="alert-danger"><td><b>ID</b></td><td><b>CODIGO</b></td><td><b>NOMBRE</b></td><td><b>CIF</b></td><td><b>TIPO ENTIDAD</b></td><td><b>BORRAR</b></td><td><b>EDITAR</b></td></tr>
       <% for(EntidadBancaria entidad: entidadesBancarias){%>
       <tr class="success">
        <td><%=entidad.getIdEntidadBancaria()%></td>
        <td><%=entidad.getCodigoEntidad()%></td>
        <td><%=entidad.getNombre()%></td>
        <td><%=entidad.getCif()%></td>
        <td><%=entidad.getEntidad()%></td>
        <td><a href="borrar.jsp?idEntidadBancaria=<%=entidad.getIdEntidadBancaria()%>">Borrar Entidad</a></td>
        <td><a href="viewforupdate.jsp?idEntidadBancaria=<%=entidad.getIdEntidadBancaria()%>">Actualizar</a></td>
    </tr>        
     <%  }
        %>
        </table>
    </body>
    
    </head>
    
</html>
