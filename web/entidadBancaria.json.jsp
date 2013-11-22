

<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate"%><%@page import="com.fpmislata.banco.datos.EntidadBancariaDAO"%><%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%><%@page import="com.fpmislata.banco.modelo.TipoentidadBancaria"%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
    EntidadBancariaDAO entidadDAO=new EntidadBancariaDAOImpHibernate();
    Integer idEntidadBancaria=Integer.parseInt(request.getParameter("idEntidadBancaria"));
    
    EntidadBancaria entidad=entidadDAO.read(idEntidadBancaria);
    ObjectMapper objectMapper=new ObjectMapper();
    String json=objectMapper.writeValueAsString(entidad);
    response.setContentType("application/json; charset=UTF-8");
    out.print(json);
%>