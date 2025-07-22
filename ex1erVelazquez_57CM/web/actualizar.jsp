<%-- 
    Document   : actualizar
    Created on : 21/07/2025, 08:00:30 PM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");

    int id = Integer.parseInt(request.getParameter("id"));
    String numeroEmpleado = request.getParameter("numeroEmpleado");
    String nombre = request.getParameter("nombre");
    String puesto = request.getParameter("puesto");
    int diasTrabajados = Integer.parseInt(request.getParameter("diasTrabajados"));
    double sueldoDiario = Double.parseDouble(request.getParameter("sueldoDiario"));
    double sueldoTotal = diasTrabajados * sueldoDiario;

    PreparedStatement ps = conexion.prepareStatement(
        "UPDATE empleados SET numeroEmpleado=?, nombre=?, puesto=?, diasTrabajados=?, sueldoDiario=?, sueldoTotal=? WHERE id=?"
    );

    ps.setString(1, numeroEmpleado);
    ps.setString(2, nombre);
    ps.setString(3, puesto);
    ps.setInt(4, diasTrabajados);
    ps.setDouble(5, sueldoDiario);
    ps.setDouble(6, sueldoTotal);
    ps.setInt(7, id);

    ps.executeUpdate();

    response.sendRedirect("consulta.jsp");
%>
