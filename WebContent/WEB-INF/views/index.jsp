<%-- 
    Document   : index.jsp
    Created on : Oct 16, 2017, 10:13:17 AM
    Author     : Arthur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>     
    	<c:url value="/resources/css/estilo.css" var="estilo" />
        <link rel="stylesheet" href="${estilo}">   
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Game desenvolvido por Arthur Marques</title>

        <!-- Bootstrap core CSS -->

        <c:url value="/resources/css/bootstrap.min.css" var="mainCss" />
        <c:url value="/resources/css/signin.css" var="signinCss" />
        <link href="${signinCss}" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${mainCss}" rel="stylesheet">
    </head>

    <body>

        <div class="container">
            <form class="form-signin" action="logar" method="POST">
                <h2 class="form-signin-heading" ALIGN="CENTER">BEM-VINDO <br></h2>
                <label for="inputEmail" class="sr-only">LOGIN</label>
                <input type="text" id="inputEmail" name="login" class="form-control" placeholder="usuário" required autofocus>
                <label for="inputPassword" class="sr-only">SENHA</label>
                <input type="password" id="inputPassword" name="senha" class="form-control" placeholder="senha" required>
                <small class="form-text text-muted">Ainda não tem uma conta? <a href="cadastroUsuario">clique aqui</a></small>
                
                <button class="btn btn-lg btn-primary btn-block" type="submit">Logar</button>               
            </form>                    
        </div>
    </body>
</html>
