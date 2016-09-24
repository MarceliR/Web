<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:50
    Author     : Marcely
--%>

<%@page import="br.edu.ifsul.modelo.Recurso"%>
<%@page import="br.edu.ifsul.dao.RecursoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="recursoDAO" scope="session"
             type="RecursoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de recursos</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Recursos</h2>
        <h2><%=recursoDAO.getMensagem()%></h2>
        <a href="ServletRecurso?acao=incluir">incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Dercricao</th>
                  
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            
          <tbody>
              <%
                  for(Recurso e:recursoDAO.getLista()){
               %>   
              <tr>
                  <td><%=e.getId()%></td>
                  <td><%=e.getDescricao() %></td>
                 
                    
                  <td><a href="ServletRecurso?acao=alterar&id=<%=e.getId()%>">Alterar</a></td>
                  <td><a href="ServletRecurso?acao=excluir&id=<%=e.getId()%>">Excluir</a></td>
              </tr>>    
              <%      
                  }
              %>
          </tbody>   
        </table>  
        
        
    </body>
</html>
