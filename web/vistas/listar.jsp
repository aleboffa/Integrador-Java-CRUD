<%-- 
    Document   : listar
    Created on : 13 dic 2022, 20:16:56
    Author     : miguel
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
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
        <h1>Personas</h1>        
        <a href="Controlador?accion=add">Agregar nuevo</a>       
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>DNI</th>
                    <th>NOMBRES</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <%
                PersonaDAO dao = new PersonaDAO();
                List <Persona> list = dao.listar();
                Iterator<Persona> iter = list.iterator();
                Persona per = null;
                
                while(iter.hasNext()){
                
                    per = iter.next();
                

                %>
            <tbody>
                <tr>
                    <td><%= per.getId() %></td>
                    <td><%= per.getDni() %></td>
                    <td><%= per.getNom() %></td>
                    <td>
                        <a href="Controlador?accion=editar&id=<%=per.getId()%>">EDITAR</a>
                        <a href="Controlador?accion=eliminar&id=<%=per.getId()%>">ELIMINAR</a>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>

    </body>
</html>
