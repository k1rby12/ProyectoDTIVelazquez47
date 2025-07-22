<%-- 
    Document   : guardar
    Created on : 21/07/2025, 06:58:47 PM
    Author     : irvin
--%>

<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection) application.getAttribute("conexion");

    String numeroEmpleado = request.getParameter("numeroEmpleado");
    String nombre = request.getParameter("nombre");
    String puesto = request.getParameter("puesto");
    int diasTrabajados = Integer.parseInt(request.getParameter("diasTrabajados"));
    double sueldoDiario = Double.parseDouble(request.getParameter("sueldoDiario"));
    double sueldoTotal = diasTrabajados * sueldoDiario;

    String sql = "INSERT INTO empleados (numeroEmpleado, nombre, puesto, diasTrabajados, sueldoDiario, sueldoTotal) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement ps = conexion.prepareStatement(sql);
    ps.setString(1, numeroEmpleado);
    ps.setString(2, nombre);
    ps.setString(3, puesto);
    ps.setInt(4, diasTrabajados);
    ps.setDouble(5, sueldoDiario);
    ps.setDouble(6, sueldoTotal);

    int resultado = ps.executeUpdate();

    if (resultado > 0) {
%>
    <script>
        alert("Empleado guardado correctamente");
        window.location = "consulta.jsp";
    </script>
<%
    } else {
%>
    <script>
        alert("Error al guardar");
        window.location = "index.jsp";
    </script>
<%
    }
%>