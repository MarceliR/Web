<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:50
    Author     : Marcely
--%>

<%@page import="br.edu.ifsul.modelo.Condominio"%>
<%@page import="br.edu.ifsul.dao.CondominioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="condominioDAO" scope="session"
             type="CondominioDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de condominios</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Condominios</h2>
        <h2><%=condominioDAO.getMensagem()%></h2>
        <a href="ServletCondominio?acao=incluir">incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Endereço</th>
                    
                    <th>Numero</th>
                    <th>Cep</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            
          <tbody>
              <%
                  for(Condominio e:condominioDAO.getLista()){
               %>   
              <tr>
                  <td><%=e.getId()%></td>
                  <td><%=e.getNome()%></td>
                  <td><%=e.getEndereco() %></td>
                  <td><%=e.getNumero()  %></td>
                  <td><%=e.getCep() %></td>
                    
                  <td><a href="ServletCondominio?acao=alterar&id=<%=e.getId()%>">Alterar</a></td>
                  <td><a href="ServletCondominio?acao=excluir&id=<%=e.getId()%>">Excluir</a></td>
              </tr>>    
              <%      
                  }
              %>
          </tbody>   
        </table>  
        
        
    </body>
</html>
