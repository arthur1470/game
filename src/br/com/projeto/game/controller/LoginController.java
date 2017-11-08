package br.com.projeto.game.controller;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.projeto.game.modelo.Usuario;
import br.com.projeto.game.servico.UsuarioServico;

@Controller
@Transactional
public class LoginController {

	@Autowired
	UsuarioServico service;
	
	@RequestMapping("login")
	public String login() {
		return "index";
	}
	
	@RequestMapping("inicio")
	public String inicio() {
		return "paginas/tela-logado";
	}
	
	@RequestMapping("cadastroUsuario")
	public String cadastroUsuario() {
		return "paginas/cadastro-usuario";
	}
	
	@RequestMapping("logar")
	public String logar(Usuario usuario, HttpSession session) {
		if(service.usuarioExisteLogin(usuario)) {
			session.setAttribute("usuarioLogado", usuario);
			return "paginas/tela-logado";
		}
		return "redirect:inicio";
	}
	
	@RequestMapping("cadastrar")
	public String cadastrar(Usuario usuario) {				
		if(service.cadastrarUsuario(usuario)) {
			return "redirect:login";
		}
		return "redirect:cadastroUsuario";
	}
	
	@RequestMapping("deslogar")
	public String deslogar(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
}
