<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<c:url value="/resources/css/bootstrap.min.css" var="mainCss" />
		<link rel="stylesheet" href="${mainCss}">
		<c:url value="/resources/css/estilo.css" var="estilo" />
		<link rel="stylesheet" href="${estilo}">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Game desenvolvido por Arthur Marques</title>
	</head>
	<body class="container corpo">
		<br>
		<h1>Bem-vindo ${usuarioLogado.login}</h1>
		<br>
		<br>
		<a href="cadastroHeroi"><input type="button" class="botao btn distanciade btn-primary" value="CADASTRAR HERÓI"></a>
		<a href="deslogar"><input type="button" class="botao btn distanciade btn-primary" value="DESLOGAR"></a>
		<a href="escolherHeroi"><input type="button" class="botao btn distanciade btn-primary" value="ESCOLHER HERÓI"></a>
	</body>
</html>