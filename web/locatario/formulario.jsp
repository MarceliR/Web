<%-- 
    Document   : formulario
    Created on : 14/09/2016, 21:32:15
    Author     : Marcely
--%>

<%@page import="br.edu.ifsul.dao.LocatarioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="locatarioDAO" scope="session"
             type="LocatarioDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Locatarios</title>
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
        <h2>Edição de Locatarios</h2>
        <h2><%=locatarioDAO.getMensagem()%></h2>
        
        <form name="form" id="form" action="ServletLocatario" method="POST">
            Nome: <input type="text" name="nome" id="nome"
                         value="<%=locatarioDAO.getObjetoSelecionado().getNome()==null
                           ? "" : locatarioDAO.getObjetoSelecionado().getNome() %>"
                           size="6"  /><br/>
            Cpf: <input type="text" name="cpf" id="cpf"
                         value="<%=locatarioDAO.getObjetoSelecionado().getCpf() ==null
                           ? "" : locatarioDAO.getObjetoSelecionado().getCpf() %>"
                           size="6"  /><br/>
            Telefone: <input type="text" name="telefone" id="telefone"
                         value="<%=locatarioDAO.getObjetoSelecionado().getTelefone() ==null
                           ? "" : locatarioDAO.getObjetoSelecionado().getTelefone() %>"
                           size="6"  /><br/>
            
            Email: <input type="text" name="email" id="email"
                         value="<%=locatarioDAO.getObjetoSelecionado().getEmail() ==null
                           ? "" : locatarioDAO.getObjetoSelecionado().getEmail() %>"
                           size="6"  /><br/>
            Renda: <input type="text" name="renda" id="renda"
                           value="<%=locatarioDAO.getObjetoSelecionado().getRenda() ==null
                           ? "" : locatarioDAO.getObjetoSelecionado().getRenda() %>"
                           size="6" /><br/>
            Local de trabalho: <input type="text" name="localtrabalho" id="localtrabalho"
                         value="<%=locatarioDAO.getObjetoSelecionado().getLocalTrabalho() ==null
                           ? "" : locatarioDAO.getObjetoSelecionado().getLocalTrabalho() %>"
                           size="6"  /><br/>
            Telefone do trabalho: <input type="text" name="telefonetrabalho" id="telefonetrabalho"
                         value="<%=locatarioDAO.getObjetoSelecionado().getTelefoneTrabalho() ==null
                           ? "" : locatarioDAO.getObjetoSelecionado().getLocalTrabalho() %>"
                           size="6"  /><br/>
            
               <input type="hidden" name="id" id="id" value="<%=locatarioDAO.getObjetoSelecionado().getId()==null
                           ? "" : locatarioDAO.getObjetoSelecionado().getId() %>"/>          
            <input type="button" value="salvar" name="btnSalvar" onclick="doSalvar()"> </br>
            <input type="button" value="cancelar" name="btnCancelar" onclick="doCancelar()"> </br>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>    
        
    </body>
</html>
