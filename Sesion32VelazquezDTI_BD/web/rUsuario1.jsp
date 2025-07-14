<%-- 
    Document   : rUsuario1
    Created on : 11/07/2025, 11:31:34 AM
    Author     : irvin
--%>

<%@include file="conexion.jsp"%>   
               <%
    //int matr=Integer.parseInt(request.getParameter("Matricula"));
    String usuario=request.getParameter("usuario");
    String contrase=request.getParameter("contrase"); 
    //String fusURL=matr+".jpg"; //URL DE FOTO
    //String matriculaID=String.valueOf(matr);
    st=conexion.prepareStatement("INSERT INTO t_usuarios values (null,?,?)");
    //st.setInt(1, matr);
    st.setString(1, usuario);
    st.setString(2, contrase);
    st.execute();
    conexion.close();
    response.sendRedirect("index.jsp");
        
%>