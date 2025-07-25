<%-- 
    Document   : alta
    Created on : 25/07/2025, 10:56:46 AM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/nav.jsp" />

<%
    if(request.getMethod().equals("POST")) {
        Connection conexion = (Connection)application.getAttribute("conexion");

        String id = request.getParameter("id_producto");
        String nombre = request.getParameter("nombre_producto");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        double total = precio * cantidad;

        PreparedStatement ps = conexion.prepareStatement(
            "INSERT INTO productos (id_producto, nombre_producto, precio, cantidad, total_venta) VALUES (?, ?, ?, ?, ?)"
        );
        ps.setString(1, id);
        ps.setString(2, nombre);
        ps.setDouble(3, precio);
        ps.setInt(4, cantidad);
        ps.setDouble(5, total);

        int resultado = ps.executeUpdate();
        if (resultado > 0) {
    response.sendRedirect("index.jsp");
} else {
%>
    <script>alert("Error al guardar el producto.");</script>
<%
}
    }
%>
