<%-- 
    Document   : index
    Created on : 21/07/2025, 06:42:09 PM
    Author     : irvin
--%>
<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>

<div class="container mt-4">
    <h2>Alta de Empleado</h2>
    <form method="post" action="index.jsp">
        <div class="mb-3">
            <label>Número de Empleado</label>
            <input type="text" name="numeroEmpleado" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Nombre</label>
            <input type="text" name="nombre" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Puesto</label>
            <input type="text" name="puesto" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Días Trabajados</label>
            <input type="number" name="diasTrabajados" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Sueldo Diario</label>
            <input type="number" step="0.01" name="sueldoDiario" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>

<%
    if(request.getMethod().equals("POST")) {
        Connection conexion = (Connection)application.getAttribute("conexion");

        String numeroEmpleado = request.getParameter("numeroEmpleado");
        String nombre = request.getParameter("nombre");
        String puesto = request.getParameter("puesto");
        int diasTrabajados = Integer.parseInt(request.getParameter("diasTrabajados"));
        double sueldoDiario = Double.parseDouble(request.getParameter("sueldoDiario"));
        double sueldoTotal = diasTrabajados * sueldoDiario;

        PreparedStatement ps = conexion.prepareStatement("INSERT INTO empleados (numeroEmpleado, nombre, puesto, diasTrabajados, sueldoDiario, sueldoTotal) VALUES (?, ?, ?, ?, ?, ?)");
        ps.setString(1, numeroEmpleado);
        ps.setString(2, nombre);
        ps.setString(3, puesto);
        ps.setInt(4, diasTrabajados);
        ps.setDouble(5, sueldoDiario);
        ps.setDouble(6, sueldoTotal);

        int resultado = ps.executeUpdate();
        if (resultado > 0) {
%>
            <script>alert("Empleado guardado con éxito.");</script>
<%      } else { %>
            <script>alert("Error al guardar.");</script>
<%      }
    }
%>
</div>
</body>
</html>