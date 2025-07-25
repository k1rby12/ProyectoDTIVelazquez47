<%-- 
    Document   : consulta
    Created on : 25/07/2025, 10:59:07 AM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/nav.jsp" />

<div class="container mt-4">
    <h2>Consulta de Ventas</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID Producto</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Total</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    PreparedStatement ps = conexion.prepareStatement("SELECT * FROM productos");
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
%>
        <tr>
            <td><%= rs.getString("id_producto") %></td>
            <td><%= rs.getString("nombre_producto") %></td>
            <td><%= rs.getDouble("precio") %></td>
            <td><%= rs.getInt("cantidad") %></td>
            <td><%= rs.getDouble("total_venta") %></td>
        </tr>
<% } %>
        </tbody>
    </table>
</div>
