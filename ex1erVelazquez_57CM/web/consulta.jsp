<%-- 
    Document   : consulta
    Created on : 21/07/2025, 06:59:51 PM
    Author     : irvin
--%>
<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>

<div class="container mt-4">
    <h2>Consulta de Empleados</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Número</th>
                <th>Nombre</th>
                <th>Puesto</th>
                <th>Días</th>
                <th>Sueldo Diario</th>
                <th>Sueldo Total</th>
            </tr>
        </thead>
        <tbody>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    PreparedStatement ps = conexion.prepareStatement("SELECT * FROM empleados");
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
%>
        <tr>
            <td><%= rs.getString("numeroEmpleado") %></td>
            <td><%= rs.getString("nombre") %></td>
            <td><%= rs.getString("puesto") %></td>
            <td><%= rs.getInt("diasTrabajados") %></td>
            <td><%= rs.getDouble("sueldoDiario") %></td>
            <td><%= rs.getDouble("sueldoTotal") %></td>
            <td>
                    <a href="editar.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-warning">Editar</a>
                    <a href="eliminar.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger" onclick="return confirm('¿Estás seguro de eliminar este registro?')">Eliminar</a>
            </td>
        </tr> <% } %>
        </tbody>
    </table>
</div>
</body>
</html>