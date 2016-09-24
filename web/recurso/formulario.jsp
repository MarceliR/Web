<%-- 
    Document   : formulario
    Created on : 14/09/2016, 21:32:15
    Author     : Marcely
--%>

<%@page import="br.edu.ifsul.dao.RecursoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="recursoDAO" scope="session"
             type="RecursoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Recursos</title>
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
        <h2>Edição de Recursos</h2>
        <h2><%=recursoDAO.getMensagem()%></h2>
        <form name="form" id="form" action="ServletRecurso" method="POST">
            Código: <input type="text" name="id" id="id"
                           value="<%=recursoDAO.getObjetoSelecionado().getId() ==null
                           ? "" : recursoDAO.getObjetoSelecionado().getId()%>"
                           size="6" readonly /><br/>
            Descrição: <input type="text" name="descricao" id="descricao"
                         value="<%=recursoDAO.getObjetoSelecionado().getDescricao()==null
                           ? "" : recursoDAO.getObjetoSelecionado().getDescricao() %>"
                           size="6"  /><br/>
           
           
                         
            <input type="button" value="salvar" name="btnSalvar" onclick="doSalvar()"> </br>
            <input type="button" value="cancelar" name="btnCancelar" onclick="doCancelar()"> </br>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>    
        
    </body>
</html>
