package br.com.projeto.game.controller;

import java.lang.reflect.Method;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.projeto.game.modelo.Heroi;
import br.com.projeto.game.modelo.Usuario;
import br.com.projeto.game.modelo.Vilao;
import br.com.projeto.game.servico.JogoServico;

@Controller
public class JogoController {

	@Autowired
	JogoServico service;

	
	@RequestMapping("cadastroHeroi")
	public String cadastroHeroi() {
		return "paginas/cadastro-heroi";
	}
	
	@Transactional
	@RequestMapping("cadastrarHeroi")
	public String cadastrarHeroi(Heroi heroi, HttpSession session, BindingResult result) {		
		if(service.validarCamposHeroi(heroi)){
			service.cadastrarHeroi(heroi, session);
			return "redirect:inicio";
		}
		return "paginas/cadastro-heroi";
	}
	
	@Transactional
	@RequestMapping("escolherHeroi")
	public String escolherHeroi(Model model, HttpSession session) {
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		model.addAttribute("herois", service.listarHerois(usuario, session));
		return "paginas/escolher-heroi";
	}
	
	@Transactional
	@RequestMapping(value = "heroEscolhido")
	public String heroEscolhido(HttpSession session, Heroi heroi, Vilao vilao) {
		service.ativarHeroi(heroi, session);
		service.ativarVilao(vilao, session);
		return "paginas/jogo";
	}
	
	@Transactional
	@RequestMapping("atacar")
	public String atacar(Heroi heroi, Vilao vilao, HttpSession session) {
		service.atacar(heroi, vilao, session);
		return "redirect:heroEscolhido";
	}
	
	@Transactional
	@RequestMapping("curar")
	public String curar(Heroi heroi, Vilao vilao, HttpSession session) {
		service.curar(heroi, vilao, session);
		return "redirect:heroEscolhido";
	}
	
	@Transactional
	@RequestMapping(value="gameOver")
	public String gameOver(Heroi heroi, HttpSession session) {
		service.gameOver(heroi, session);
		return "redirect:inicio";
	}
	
	@Transactional
	@RequestMapping(value="deletar")
	public String delete(Heroi heroi) {
		service.removerHeroi(heroi);
		return "redirect:escolherHeroi";
	}
	
	@Transactional
	@RequestMapping("levelUp")
	public String levelUp(Heroi heroi, HttpSession session) {
		service.levelUp(heroi, session);
		return "redirect:escolherHeroi";
	}
	
	@RequestMapping("loja")
	public String loja(Heroi heroi, HttpSession session) {
		service.ativarHeroi(heroi, session);
		return "paginas/loja";
	}
	
	@Transactional
	@RequestMapping("comprarItem")
	public String comprarItem(Heroi heroi, int idItem,HttpSession session) {
		if(service.comprarItem(heroi, idItem, session)) {
			return "redirect:loja";
		}
		return "paginas/loja";
	}
}
