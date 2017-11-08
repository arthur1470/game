package br.com.projeto.game.dao;

import java.util.List;

import br.com.projeto.game.modelo.Heroi;
import br.com.projeto.game.modelo.Usuario;
import br.com.projeto.game.modelo.Vilao;

public interface IJogoDao {
	void cadastrarHeroi(Heroi heroi);
	Heroi buscarHeroi(Heroi heroi);
	Vilao buscarVilao(Vilao vilao);
	List<Heroi> listaHerois(Usuario usuario);
	void alterarHeroi(Heroi heroi);
	void alterarVilao(Vilao vilao);
	void removerHeroi(Heroi heroi);
}
