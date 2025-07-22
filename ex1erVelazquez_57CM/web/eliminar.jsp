<%-- 
    Document   : eliminar
    Created on : 21/07/2025, 07:46:51 PM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");

    String idStr = request.getParameter("id");
    if(idStr != null) {
        int id = Integer.parseInt(idStr);
        PreparedStatement ps = conexion.prepareStatement("DELETE FROM empleados WHERE id = ?");
        ps.setInt(1, id);
        ps.executeUpdate();
    }
    response.sendRedirect("consulta.jsp");
%>