package br.com.projeto.game.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Usuario {
	
	@Id
	private String login;
	private String senha;

	@OneToMany(mappedBy="usuario")
	private List<Heroi> herois = new ArrayList<Heroi>();
	
	public String getLogin() {
		return login;
	}
	
	public void setLogin(String login) {
		this.login = login;
	}
	
	public String getSenha() {
		return senha;
	}
	
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public List<Heroi> getHerois() {
		return herois;
	}

	public void setHerois(List<Heroi> herois) {
		this.herois = herois;
	}
}
