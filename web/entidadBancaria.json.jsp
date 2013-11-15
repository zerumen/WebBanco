<%@page import="com.fpmislata.banco.modelo.EntidadBancaria"%><%@page import="com.fpmislata.banco.modelo.TipoentidadBancaria"%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%

    
    EntidadBancaria entidad=new EntidadBancaria(540,"98","Pepin","B55436",TipoentidadBancaria.COOPERATIVAS);
    ObjectMapper objectMapper=new ObjectMapper();
    String json=objectMapper.writeValueAsString(entidad);
    response.setContentType("application/json; charset=UTF-8");
    out.print(json);
%>