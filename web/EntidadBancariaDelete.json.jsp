<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate"%><%@page import="java.util.List"%><%@page import="com.fpmislata.banco.datos.EntidadBancariaDAO"%><%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%><%@page import="com.fpmislata.banco.modelo.TipoentidadBancaria"%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
    EntidadBancariaDAO entidad=new EntidadBancariaDAOImpHibernate();
    int idEntidadBancaria=Integer.parseInt(request.getParameter("idEntidadBancaria"));
    entidad.delete(idEntidadBancaria);
    ObjectMapper objectMapper=new ObjectMapper();
    String json=objectMapper.writeValueAsString(null);
    response.setContentType("application/json; charset=UTF-8");
    out.print(json);
    %>