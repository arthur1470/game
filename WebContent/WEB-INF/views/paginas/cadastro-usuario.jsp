<%-- 
    Document   : cadastro-usuario
    Created on : Oct 19, 2017, 10:31:56 PM
    Author     : Arthur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
    	<c:url value="/resources/css/estilo.css" var="estilo" />
        <link rel="stylesheet" href="${estilo}">
        <c:url value="/resources/css/bootstrap.min.css" var="mainCss" />
        <link rel="stylesheet" href="${mainCss}">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game desenvolvido por Arthur Marques</title>
    </head>
    <body class="container">
       <form action="cadastrar corpo" method="post">
            <div class="form-group">
                <label>Usuário: </label>
                <input type="text" name="login" class="form-control" placeholder="Login" />                
            </div>
            
            <div class="form-group">
                <label>Senha</label>
                <input type="password" name="senha" class="form-control"/>                
            </div>         

            <input type="submit" class="btn btn-primary" value="Cadastrar" />
            <a href="login"><button type="button" class="btn btn-primary">Voltar</button></a>
        </form>
    </body>
</html>
