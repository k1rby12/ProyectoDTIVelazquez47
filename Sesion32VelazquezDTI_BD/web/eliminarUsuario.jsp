<%-- 
    Document   : eliminarUsuario
    Created on : 11/07/2025, 11:51:16 AM
    Author     : irvin
--%>

<%@include file="conexion.jsp"%>
<%
int numeroCodigo=Integer.parseInt(request.getParameter("id_usuarios"));
PreparedStatement ps;
ps=conexion.prepareCall("DELETE from t_usuarios WHERE id_usuarios = '"+numeroCodigo+"'");
       ps.executeUpdate();
       response.sendRedirect("index.jsp");
%>