<%-- 
    Document   : index
    Created on : 25/07/2025, 10:48:42 AM
    Author     : irvin
--%>


<%@ include file="conexion.jsp" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/nav.jsp" />
<body>
<div class="container mt-4">
    <h2>Alta de Producto</h2>
    <form method="post" action="alta.jsp">
        <div class="mb-3">
            <label>ID Producto</label>
            <input type="text" name="id_producto" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Nombre del Producto</label>
            <input type="text" name="nombre_producto" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Precio</label>
            <input type="number" step="0.01" name="precio" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Cantidad</label>
            <input type="number" name="cantidad" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>

