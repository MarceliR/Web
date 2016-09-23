<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:50
    Author     : Marcely
--%>

<%@page import="br.edu.ifsul.modelo.Pessoa"%>
<%@page import="br.edu.ifsul.dao.PessoaDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="pessoaDAO" scope="session"
             type="PessoaDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de pessoas</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Pessoas</h2>
        <h2><%=pessoaDAO.getMensagem()%></h2>
        <a href="ServletPessoa?acao=incluir">incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Telefone</th>
                    <th>Email</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            
          <tbody>
              <%
                  for(Pessoa e:pessoaDAO.getLista()){
               %>   
              <tr>
                  <td><%=e.getId()%></td>
                  <td><%=e.getNome()%></td>
                  <td><%=e.getCpf()%></td>
                  <td><%=e.getEmail()  %></td>
                  <td><%=e.getTelefone() %></td>
                    
                  <td><a href="ServletPessoa?acao=alterar&id=<%=e.getId()%>">Alterar</a></td>
                  <td><a href="ServletPessoa?acao=excluir&id=<%=e.getId()%>">Excluir</a></td>
              </tr>>    
              <%      
                  }
              %>
          </tbody>   
        </table>  
        
        
    </body>
</html>
