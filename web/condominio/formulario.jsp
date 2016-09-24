<%-- 
    Document   : formulario
    Created on : 14/09/2016, 21:32:15
    Author     : Marcely
--%>

<%@page import="br.edu.ifsul.dao.CondominioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="condominioDAO" scope="session"
             type="CondominioDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Condominios</title>
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
        <h2>Edição de Condominios</h2>
        <h2><%=condominioDAO.getMensagem()%></h2>
        <form name="form" id="form" action="ServletCondominio" method="POST">
            Código: <input type="text" name="id" id="id"
                           value="<%=condominioDAO.getObjetoSelecionado().getId() ==null
                           ? "" : condominioDAO.getObjetoSelecionado().getId()%>"
                           size="6" readonly /><br/>
            Nome: <input type="text" name="nome" id="nome"
                         value="<%=condominioDAO.getObjetoSelecionado().getNome()==null
                           ? "" : condominioDAO.getObjetoSelecionado().getNome() %>"
                           size="6"  /><br/>
            Endereco: <input type="text" name="endereco" id="endereco"
                         value="<%=condominioDAO.getObjetoSelecionado().getEndereco() ==null
                           ? "" : condominioDAO.getObjetoSelecionado().getEndereco() %>"
                           size="6"  /><br/>
            Numero: <input type="text" name="numero" id="numero"
                         value="<%=condominioDAO.getObjetoSelecionado().getNumero() ==null
                           ? "" : condominioDAO.getObjetoSelecionado().getNumero() %>"
                           size="6"  /><br/>
            
            Cep: <input type="text" name="cep" id="cep"
                         value="<%=condominioDAO.getObjetoSelecionado().getCep() ==null
                           ? "" : condominioDAO.getObjetoSelecionado().getCep() %>"
                           size="6"  /><br/>
           
                         
            <input type="button" value="salvar" name="btnSalvar" onclick="doSalvar()"> </br>
            <input type="button" value="cancelar" name="btnCancelar" onclick="doCancelar()"> </br>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>    
        
    </body>
</html>
