<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
    <body class="container corpo" >
        <form:errors path="Heroi.nome"></form:errors>
        <form action="cadastrarHeroi" method="post">
            <div class="form-group">
                <label for="nome">Nome do Herói</label>
                <input type="text" name="nome" class="form-control" id="nome" >                
            </div>
            
            <div class="form-group">
                <label for="nomeAtaque">Nome do Ataque</label>
                <input type="text" name="nomeAtaque" class="form-control" id="nomeAtaque" >                
            </div>
            <div class="form-check">
			    <label class="form-check-label">
			      <input type="checkbox" name="hardcore" id="hardcore" class="form-check-input">
			      Hardcore?
			    </label>
			 </div>
            <button type="submit" class="botao btn btn-primary">Cadastrar</button>
            <a href="inicio"><button type="button" class="botao btn btn-primary">Voltar</button></a>
        </form>
        
    </body>
</html>
