<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<c:url value="/resources/css/bootstrap.min.css" var="mainCss" />
		<link rel="stylesheet" href="${mainCss}">
		<c:url var="img" value="/resources/img"></c:url>
		<c:url var="css" value="/resources/css/estilo.css"></c:url>
		<link href="${css}" rel="stylesheet" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Jogo Desenvolvido por Arthur</title>
	</head>
	<body>
		<div class="hero espaco">
	      ${hero.nome} <br>
	      <progress class="vida" value="${hero.porcentoVida}" max="${hero.vida}"></progress>
	      <br>
	      <img src="${img}/heroi.png" alt="heroi">
	      <br>
	      ${hero.ataque} <br>
	      ${hero.kitCura}
	    </div>
	
	    <div class="evil espaco">
	      ${evil.nome} <br>
	      <progress class="vida" value="${evil.porcentoVida}" max="${evil.vida}"></progress>
	      <br>
	      <img src="${img}/vilao.png" alt="vilao">
	      <br>
	      ${evil.ataque}      
	    </div>
	    
	    <div class="acoes">
	    	<c:if test="${hero.porcentoVida > 0 && evil.porcentoVida > 0}">
			    <a href="atacar?id=${hero.id}&idVilao=${hero.nivel}"><button type="button" class="acoes btn btn-primary">Atacar</button></a>			    
			    <a href="curar?id=${hero.id}&idVilao=${hero.nivel}"><button type="button" class="acoes btn btn-primary">Curar</button></a>
	      	</c:if>
	      	
	      	<c:if test="${hero.porcentoVida <= 0 && evil.porcentoVida > 0}">
				Você foi Derrotado!
				<a href="gameOver?id=${hero.id}">
					<input type="button" class="botao btn btn-primary" value="GAME OVER"/>
				</a>    
            </c:if>

            <c:if test="${hero.porcentoVida > 0 && evil.porcentoVida <= 0 && hero.nivel < 10}">
				Parabéns, vc venceu!
                <a href="levelUp?id=${hero.id}">
                    <input type="button" class="botao btn btn-primary" value="Upar">
                </a>
            </c:if>

            <c:if test="${hero.porcentoVida < 0 && evil.porcentoVida < 0}">
				Caramba, houve um empate!
				<a href="gameOver?id=${hero.id}">
					<input type="button" class="botao btn btn-primary" value="GAME OVER"/>
				</a>
            </c:if>
                    
            <c:if test="${hero.porcentoVida > 0 && evil.porcentoVida <= 0 && hero.nivel >= 10}">
                Parabéns, você zerou o jogo!
                <a href="gameOver?id=${hero.id}">
                	<input type="button" class="botao btn btn-primary" value="GAME OVER"/>
                </a>
            </c:if>
	    </div>
	
	    <div class="loghero">
	      LOG HERÓI <br>
	      Atacou: ${hero.atacou}<br>
	      Curou: ${hero.curou}<br>
	      MSG: ${hero.log}
	    </div>
	    
	    <div class="logvilao">
	      LOG VILAO <br>
	      Atacou: ${evil.ataque}<br>	      
	    </div>
	</body>
</html>