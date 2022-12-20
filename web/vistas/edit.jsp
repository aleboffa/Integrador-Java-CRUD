<%-- 
    Document   : edit
    Created on : 13 dic 2022, 20:16:45
    Author     : miguel
--%>

<%@page import="modelo.Persona"%>
<%@page import="modeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            PersonaDAO dao = new PersonaDAO();
            int id = Integer.parseInt((String)request.getAttribute("idper"));
            Persona p = (Persona)dao.list(id);
        %>
        <h1>Modificar Persona</h1>
        <form action="Controlador">
            DNI:<br>
            <input type="text" name="txtDni" value="<%=p.getDni()%>"><br>
            Nombres:<br>
            <input type="text" name="txtNom" value="<%=p.getNom()%>"><br>
            <input type="hidden" name="txtId" value="<%=p.getId()%>"><br>
            <input type="submit" name="accion" value="Actualizar">
            <br>
            <a href="Controlador?accion=listar">Regresar</a>
        </form>
    </body>
</html>
