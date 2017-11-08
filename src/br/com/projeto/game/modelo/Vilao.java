package br.com.projeto.game.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Vilao {
	
	@Id @GeneratedValue
	private int idVilao;
	private String nome;
	private int ataque;
	private int vida;
	

	public int getIdVilao() {
		return idVilao;
	}
	public void setIdVilao(int idVilao) {
		this.idVilao = idVilao;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getAtaque() {
		return ataque;
	}
	public void setAtaque(int ataque) {
		this.ataque = ataque;
	}
	public int getVida() {
		return vida;
	}
	public void setVida(int vida) {
		this.vida = vida;
	}	
}
