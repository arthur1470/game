package br.com.projeto.game.servico;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.projeto.game.dao.IUsuarioDao;
import br.com.projeto.game.modelo.Usuario;

@Service
public class UsuarioServico {

	@Autowired
	IUsuarioDao dao;

	public boolean usuarioExisteLogin(Usuario usuario) {
		boolean verificado = false;
		if (dao.usuarioExisteLogin(usuario)) {
			verificado = true;
		}		
		return verificado;
	}

	public boolean cadastrarUsuario(Usuario usuario) {
		boolean verificado = false;		
		if(dao.buscarUsuario(usuario)) {
			verificado = true;
			dao.cadastrarUsuario(usuario);
		}
		return verificado;
	}
}
