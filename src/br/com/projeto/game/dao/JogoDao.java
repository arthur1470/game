package br.com.projeto.game.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.projeto.game.modelo.Heroi;
import br.com.projeto.game.modelo.Usuario;
import br.com.projeto.game.modelo.Vilao;

@Repository
public class JogoDao implements IJogoDao{

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public void cadastrarHeroi(Heroi heroi) {
		manager.persist(heroi);
	}

	@Override
	public Heroi buscarHeroi(Heroi heroi) {
		return manager.find(Heroi.class, heroi.getId());
	}

	@Override
	public Vilao buscarVilao(Vilao vilao) {
		return manager.find(Vilao.class, vilao.getIdVilao());
	}
	

	@Override
	public List<Heroi> listaHerois(Usuario usuario) {
		Query query =  manager.createQuery("select h from Heroi h where h.login = :paramLogin");
		query.setParameter("paramLogin", usuario.getLogin());
		return query.getResultList();		
	}

	@Override
	public void alterarHeroi(Heroi heroi) {
		manager.merge(heroi);
	}

	@Override
	public void alterarVilao(Vilao vilao) {
		manager.merge(vilao);
	}

	@Override
	public void removerHeroi(Heroi heroi) {		
		manager.remove(manager.contains(heroi)? heroi : manager.merge(heroi));	
	}
}
