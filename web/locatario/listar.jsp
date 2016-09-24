<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:50
    Author     : Marcely
--%>

<%@page import="br.edu.ifsul.modelo.Locatario"%>
<%@page import="br.edu.ifsul.dao.LocatarioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="locatarioDAO" scope="session"
             type="LocatarioDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de locatarios</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Locatarios</h2>
        <h2><%=locatarioDAO.getMensagem()%></h2>
        <a href="ServletLocatario?acao=incluir">incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Renda</th>
                    <th>Local de Trabalho</th>
                    <th>Telefone de Trabalho</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                   
                </tr>
            </thead>
            
          <tbody>
              <%
                  for(Locatario e:locatarioDAO.getLista()){
               %>   
              <tr>
                  <td><%=e.getRenda() %></td>
                  <td><%=e.getLocalTrabalho() %></td>
                  <td><%=e.getTelefoneTrabalho() %></td>
               
                    
                  <td><a href="ServletLocatario?acao=alterar&id=<%=e.getId()%>">Alterar</a></td>
                  <td><a href="ServletLocatario?acao=excluir&id=<%=e.getId()%>">Excluir</a></td>
              </tr>>    
              <%      
                  }
              %>
          </tbody>   
        </table>  
        
        
    </body>
</html>
