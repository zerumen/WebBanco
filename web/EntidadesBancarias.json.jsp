<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate"%><%@page import="java.util.List"%><%@page import="com.fpmislata.banco.datos.EntidadBancariaDAO"%><%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%><%@page import="com.fpmislata.banco.modelo.TipoentidadBancaria"%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
    EntidadBancariaDAO entidades=new EntidadBancariaDAOImpHibernate();
     List<EntidadBancaria> entidadesBancarias=entidades.findAll();
    ObjectMapper objectMapper=new ObjectMapper();
    String json=objectMapper.writeValueAsString(entidadesBancarias);
    response.setContentType("application/json; charset=UTF-8");
    out.print(json);
%>
