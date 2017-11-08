package br.com.projeto.game.dao;

import br.com.projeto.game.modelo.Usuario;

public interface IUsuarioDao {
	boolean usuarioExisteLogin(Usuario usuario);
	void cadastrarUsuario(Usuario usuario);
	boolean buscarUsuario(Usuario usuario);
}
