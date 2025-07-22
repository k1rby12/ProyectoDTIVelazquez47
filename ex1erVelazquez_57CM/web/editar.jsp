<%-- 
    Document   : editar
    Created on : 21/07/2025, 07:46:19 PM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/nav.jsp" />

<%
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);

    Connection conexion = (Connection)application.getAttribute("conexion");
    PreparedStatement ps = conexion.prepareStatement("SELECT * FROM empleados WHERE id = ?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>

<div class="container">
    <h2>Editar Empleado</h2>
    <form action="actualizar.jsp" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>"/>
        <div class="mb-3">
            <label>Número de Empleado:</label>
            <input type="text" name="numeroEmpleado" class="form-control" value="<%= rs.getString("numeroEmpleado") %>" required/>
        </div>
        <div class="mb-3">
            <label>Nombre:</label>
            <input type="text" name="nombre" class="form-control" value="<%= rs.getString("nombre") %>" required/>
        </div>
        <div class="mb-3">
            <label>Puesto:</label>
            <input type="text" name="puesto" class="form-control" value="<%= rs.getString("puesto") %>" required/>
        </div>
        <div class="mb-3">
            <label>Días Trabajados:</label>
            <input type="number" name="diasTrabajados" class="form-control" value="<%= rs.getInt("diasTrabajados") %>" required/>
        </div>
        <div class="mb-3">
            <label>Sueldo Diario:</label>
            <input type="number" step="0.01" name="sueldoDiario" class="form-control" value="<%= rs.getDouble("sueldoDiario") %>" required/>
        </div>
        <button type="submit" class="btn btn-success">Actualizar</button>
        <a href="consulta.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

</body>
</html>