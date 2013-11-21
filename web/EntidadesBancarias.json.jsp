<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate"%><%@page import="java.util.List"%><%@page import="com.fpmislata.banco.datos.EntidadBancariaDAO"%><%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%><%@page import="com.fpmislata.banco.modelo.TipoentidadBancaria"%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
    EntidadBancariaDAO entidades=new EntidadBancariaDAOImpHibernate();
    String nombre=request.getParameter("nombre");
     List<EntidadBancaria> entidadesBancarias=entidades.findByNombre(nombre);
    ObjectMapper objectMapper=new ObjectMapper();
    String json=objectMapper.writeValueAsString(entidadesBancarias);
    response.setContentType("application/json; charset=UTF-8");
    out.print(json);
%>
