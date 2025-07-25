<%-- 
    Document   : conexion
    Created on : 25/07/2025, 10:47:14 AM
    Author     : irvin
--%>

<%@ page import="java.sql.*" %>
<%
    if (application.getAttribute("conexion") == null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/nomina", "root", "");
            application.setAttribute("conexion", conexion);
        } catch (Exception e) {
            out.println("Error de conexión: " + e.getMessage());
        }
    }
%>
