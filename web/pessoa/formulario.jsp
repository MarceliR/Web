<%-- 
    Document   : formulario
    Created on : 14/09/2016, 21:32:15
    Author     : Marcely
--%>

<%@page import="br.edu.ifsul.dao.PessoaDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="pessoaDAO" scope="session"
             type="PessoaDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Pessoas</title>
        <script>
            function doSalvar(){
                document.getElementById("acao").value = 'salvar';
                document.getElementById("form").submit();
            }
            function doCancelar(){
                document.getElementById("acao").value = 'cancelar';
                document.getElementById("form").submit();
            }
        </script>
    </head>
    <body>
        <h2>Edição de Pessoas</h2>
        <h2><%=pessoaDAO.getMensagem()%></h2>
        <form name="form" id="form" action="ServletPessoa" method="POST">
            Código: <input type="text" name="id" id="id"
                           value="<%=pessoaDAO.getObjetoSelecionado().getId() ==null
                           ? "" : pessoaDAO.getObjetoSelecionado().getId()%>"
                           size="6" readonly /><br/>
            Nome: <input type="text" name="nome" id="nome"
                         value="<%=pessoaDAO.getObjetoSelecionado().getNome()==null
                           ? "" : pessoaDAO.getObjetoSelecionado().getNome() %>"
                           size="6"  /><br/>
            Cpf: <input type="text" name="cpf" id="cpf"
                         value="<%=pessoaDAO.getObjetoSelecionado().getCpf() ==null
                           ? "" : pessoaDAO.getObjetoSelecionado().getCpf() %>"
                           size="6"  /><br/>
            Telefone: <input type="text" name="telefone" id="telefone"
                         value="<%=pessoaDAO.getObjetoSelecionado().getTelefone() ==null
                           ? "" : pessoaDAO.getObjetoSelecionado().getTelefone() %>"
                           size="6"  /><br/>
            
            Email: <input type="text" name="email" id="email"
                         value="<%=pessoaDAO.getObjetoSelecionado().getEmail() ==null
                           ? "" : pessoaDAO.getObjetoSelecionado().getEmail() %>"
                           size="6"  /><br/>
           
                         
            <input type="button" value="salvar" name="btnSalvar" onclick="doSalvar()"> </br>
            <input type="button" value="cancelar" name="btnCancelar" onclick="doCancelar()"> </br>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>    
        
    </body>
</html>
