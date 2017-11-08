<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:url value="/resources/css/estilo.css" var="estilo" />
<link rel="stylesheet" href="${estilo}">
<c:url value="/resources/css/bootstrap.min.css" var="mainCss" />
<link rel="stylesheet" href="${mainCss}">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Game desenvolvido por Arthur Marques</title>
</head>
<body class="container corpo">
	<h1>Bem vindo à Loja ${hero.nome}</h1>
	<table class="table">
		<thead>
			<tr>
				<th>ITEM</th>
				<th>DESCRIÇÃO</th>
				<th>PREÇO</th>
				<th>SEU GOLD: ${hero.gold}</th>				
			</tr>
		</thead>

		<tbody>
			<tr>
				<form action="comprarItem" method="POST">
					<input type="hidden" name="idItem" value="1">
					<th scope="row">Espada Sanguinária</th>
					<td>Aumenta o poder de ataque do herói em 10 pontos</td>
					<td>20</td>
					<td><input type="submit" value="COMPRAR" class="btn btn-primary" /></td>
				</form>
			</tr>
			<tr>
				<form action="comprarItem" method="POST">
					<input type="hidden" name="idItem" value="2">
					<th scope="row">Pedra da Vida</th>
					<td>Aumenta a vida do herói em 16 pontos</td>
					<td>15</td>
					<td><input type="submit" value="COMPRAR" class="btn btn-primary" /></td>				
				</form>
			</tr>
			<tr>
				<form action="comprarItem" method="POST">
					<input type="hidden" name="idItem" value="3">
					<th scope="row">Kit de Cura</th>
					<td>Aumenta a quantidade de kit de cura em 2</td>
					<td>5</td>
					<td><input type="submit" value="COMPRAR" class="btn btn-primary" /></td>
				</form>
			</tr>
		</tbody>
	</table>
	<a href="escolherHeroi"><button type="button" class="botao btn btn-primary">Voltar</button></a>
</body>
</html>