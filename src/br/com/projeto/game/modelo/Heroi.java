package br.com.projeto.game.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Heroi {
		
	@Id
	@GeneratedValue
	private int id;
	private String nome;
	private String log;
	private int gold;
	private int ataque;
	private int nivel;
	private String nomeAtaque;
	private int vida;
	private int kitCura;
	private int atacou;
	private int curou;
	private int porcentoVida;
	private boolean hardcore;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;
	
	
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public boolean isHardcore() {
		return hardcore;
	}
	public void setHardcore(boolean hardcore) {
		this.hardcore = hardcore;
	}
	public String getLog() {
		return log;
	}
	public void setLog(String log) {
		this.log = log;
	}
	public int getNivel() {
		return nivel;
	}
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
	public String getNomeAtaque() {
		return nomeAtaque;
	}
	public void setNomeAtaque(String nomeAtaque) {
		this.nomeAtaque = nomeAtaque;
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
	public int getKitCura() {
		return kitCura;
	}
	public void setKitCura(int kitCura) {
		this.kitCura = kitCura;
	}
	public int getAtacou() {
		return atacou;
	}
	public void setAtacou(int atacou) {
		this.atacou = atacou;
	}
	public int getCurou() {
		return curou;
	}
	public void setCurou(int curou) {
		this.curou = curou;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGold() {
		return gold;
	}
	public void setGold(int gold) {
		this.gold = gold;
	}
	public int getPorcentoVida() {
		return porcentoVida;
	}
	public void setPorcentoVida(int porcentoVida) {
		this.porcentoVida = porcentoVida;
	}
		
}
