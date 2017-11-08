<%-- 
    Document   : jogo
    Created on : Oct 16, 2017, 4:25:17 PM
    Author     : Arthur
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:url value="/resources/css/bootstrap.min.css" var="mainCss" />
        <c:url value="/resources/css/estilo.css" var="estilo" />
        <c:url value="/resources/img/" var="img" />
        <link rel="stylesheet" href="${estilo}">
        <link rel="stylesheet" href="${mainCss}">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game desenvolvido por Arthur Marques</title>
    </head>
    <!-- alternativa
        <c:set var = "evilVida" scope = "session" value = "${evil.vida}"/>
        <c:set var = "heroiVida" scope = "session" value = "${hero.vida}"/>
    -->
    <body class="container">
    
        <table class="table">
            <thead>
                <tr>
                    <th></th>
                    <th>Nome</th>
                    <th>Vida</th>
                    <th>Poder de ataque</th>
                    <th>Kits de cura</th>
                </tr>
            </thead>

            <tbody>              
                <tr>
                    <th scope="row">Heroi: </th>
                    <td><span name="nome">${hero.nome}</span></td>
                    <td>${hero.vida}</td>
                    <td>${hero.ataque}</td>
                    <td>${hero.kitCura}</td>
                </tr>
                <tr>
                    <th scope="row">Vilão: </th>
                    <td>${evil.nome}</td>
                    <td>${evil.vida}</td>
                    <td>(1 ~ 125)</td>
                    <td>0</td>
                </tr>    
                <tr>
                    <c:if test="${hero.vida > 0 && evil.vida > 0}">
                        <td></td>
                        <td colspan="2">
                            <a href="atacar?id=${hero.id}&idVilao=${hero.nivel}"><input type="button" class="botao btn btn-primary" value="ATACAR"></a>
                        </td>
                        <td colspan="2">
                            <a href="curar?id=${hero.id}&idVilao=${hero.nivel}"><input type="button" class="botao btn btn-primary" value="USAR KIT CURA"></a>
                        </td>
                    </c:if>
                    <c:if test="${hero.vida <= 0 && evil.vida > 0}">
                        <td colspan="2">
                            Você foi Derrotado!
                        </td>
                        <td colspan="2">
                            <a href="gameOver?id=${hero.id}"><input type="button" class="botao btn btn-primary" value="GAME OVER"/></a>
                        </td>
                    </c:if>
                        
                    <c:if test="${hero.vida > 0 && evil.vida <= 0 && hero.nivel < 10}">
                        <td colspan="2">
                            Parabéns, vc venceu!
                        </td>
                        <td colspan="3">
                            <a href="levelUp?id=${hero.id}"><input type="button" class="botao btn btn-primary" value="Upar"></a>
                        </td>
                    </c:if>
                        
                    <c:if test="${hero.vida < 0 && evil.vida < 0}">
                        <td colspan="2">
                            Caramba, houve um empate!
                        </td>
                        <td colspan="2">
                            <a href="gameOver?id=${hero.id}"><input type="button" class="botao btn btn-primary" value="GAME OVER"/></a>
                        </td>
                    </c:if>
                  	<c:if test="${hero.vida > 0 && evil.vida <= 0 && hero.nivel >= 10}">
                        <td colspan="2">
                            Parabéns, você zerou o jogo!
                        </td>
                        <td colspan="2">
                            <a href="gameOver?id=${hero.id}"><input type="button" class="botao btn btn-primary" value="GAME OVER"/></a>
                        </td>
                    </c:if>
                </tr>
            </tbody>
        </table>
        <div class="container espaco">
            <table class="heroi">
                <tr>
                    <td>LOG Herói</td>
                </tr>
                <tr>
                    <td>Herói</td>                                
                </tr>
                <tr>
                    <td>Atacou: </td>                                
                    <td>${hero.atacou}</td>                                
                </tr>
                <tr>
                    <td>Curou: </td>                                
                    <td>${hero.curou}</td>                                
                </tr>
                <tr>
                    <td>MSG: </td>                                
                    <td>${hero.log}</td>                                
                </tr>
            </table>

            <table class="vilao">
                <tr>
                    <td>LOG VILÃO</td>
                </tr>
                <tr>
                    <td>VILÃO:</td>                                
                </tr>
                <tr>
                    <td>Atacou: </td>                                
                    <td>${evil.ataque}</td>                                
                </tr>
            </table>
        </div>
    </body>
</html>
