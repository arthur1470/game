package br.com.projeto.game.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.projeto.game.modelo.Usuario;

@Repository
public class UsuarioDao implements IUsuarioDao{

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public boolean usuarioExisteLogin(Usuario usuario) {
		boolean verificado = false;
		
		Usuario encontrado = manager.find(Usuario.class, usuario.getLogin());
		
		if(encontrado != null) {
			if(encontrado.getSenha().equals(usuario.getSenha())) {
				verificado = true;
			}
		}
		
		return verificado;
	}
	
	@Override
	public boolean buscarUsuario(Usuario usuario) {
		boolean verificado = false;
		Usuario user = manager.find(Usuario.class, usuario.getLogin());
		if(user == null) {
			verificado = true;
		}
		return verificado;
	}


	@Override
	public void cadastrarUsuario(Usuario usuario) {
		manager.persist(usuario);		
	}

}
