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
    <body class="corpo container">
        <table class="table">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Nome do ataque</th>
                    <th>Nível</th>
                    <th>Vida</th>
                    <th>Poder de ataque</th>
                    <th>Kits de cura</th>
                    <th>Gold $$</th>
                    <th colspan="3"><align="center">Escolher</align></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${herois}" var="heroi">
                    <tr>
                    	<form action="heroEscolhido" method="POST">
                    		<input type="hidden" name="id" value="${heroi.id}" />
                    		<input type="hidden" name="idVilao" value="${heroi.nivel}" />
	                        <th scope="row">${heroi.nome}</th>
	                        <td>${heroi.nomeAtaque}</td>
	                        <td>${heroi.nivel}</td>
	                        <td>${heroi.vida}</td>
	                        <td>${heroi.ataque}</td>
	                        <td>${heroi.kitCura}</td>
	                        <td>${heroi.gold}</td>
	                        <td><input type="submit" value="Jogar com ${heroi.nome}" class="btn btn-primary" /></td>         
	                    </form>
	                    <form action="loja" method="POST">
	                    	<input type="hidden" name="id" value="${heroi.id}" />
	                    	<td><input type="submit" value="LOJA" class="btn btn-primary" /></td>
	                    </form>
	                    <form action="deletar" method="POST">
	                    	<input type="hidden" name="id" value="${heroi.id}" />
	                    	<td><input type="submit" value="DELETAR" class="btn btn-primary" /></td>
	                    </form>
                    </tr>    
                </c:forEach>
            </tbody>
        </table>
        <a href="inicio"><button type="button" class="botao btn btn-primary">Voltar</button></a>
    </body>
</html>
