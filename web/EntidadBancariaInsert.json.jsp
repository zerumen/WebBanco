<%@page import="com.fpmislata.banco.datos.EntidadBancariaDAOImpHibernate"%><%@page import="java.util.List"%><%@page import="com.fpmislata.banco.datos.EntidadBancariaDAO"%><%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%><%@page import="com.fpmislata.banco.modelo.TipoentidadBancaria"%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
    EntidadBancariaDAO entidadDAO=new EntidadBancariaDAOImpHibernate();
    int idEntidadBancaria=Integer.parseInt(request.getParameter("idEntidadBancaria"));
    String codigo=request.getParameter("codigo");
    String nombre=request.getParameter("nombre");
    String cif=request.getParameter("cif");
    TipoentidadBancaria tipoentidad=TipoentidadBancaria.valueOf(request.getParameter("TipoEntidadBancaria"));
    EntidadBancaria entidad=new EntidadBancaria(idEntidadBancaria,codigo,nombre,cif,tipoentidad);
    entidadDAO.insert(entidad);
    ObjectMapper objectMapper=new ObjectMapper();
    String json=objectMapper.writeValueAsString(null);
    response.setContentType("application/json; charset=UTF-8");
    out.print(json);
    %>
