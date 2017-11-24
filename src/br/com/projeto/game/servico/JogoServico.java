package br.com.projeto.game.servico;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.projeto.game.dao.IJogoDao;
import br.com.projeto.game.modelo.Heroi;
import br.com.projeto.game.modelo.Usuario;
import br.com.projeto.game.modelo.Vilao;

@Service
public class JogoServico {

	@Autowired
	IJogoDao dao;

	public boolean validarCamposHeroi(Heroi heroi) {
		if (heroi.getNome().length() < 1 ||		 
			heroi.getNomeAtaque().length() < 2) {
			return false;
		}
		return true;
	}

	public void cadastrarHeroi(Heroi heroi, HttpSession session) {
		
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		heroi.setUsuario(usuario);
		heroi.setNivel(1);
		heroi.setAtaque(130);
		heroi.setVida(350);
		heroi.setKitCura(20);
		heroi.setAtacou(0);
		heroi.setCurou(0);
		heroi.setPorcentoVida(heroi.getVida());
		dao.cadastrarHeroi(heroi);

	}

	public List<Heroi> listarHerois(Usuario usuario, HttpSession session) {
		session.removeAttribute("hero");
		session.removeAttribute("evil");
		return dao.listaHerois(usuario);
	}

	public void ativarHeroi(Heroi heroi, HttpSession session) {
		if(session.getAttribute("hero") == null) {
			Heroi hero =  dao.buscarHeroi(heroi);
			session.setAttribute("hero", hero);
		}		
	}

	public void ativarVilao(Vilao vilao, HttpSession session) {
		if(session.getAttribute("evil") == null) {
			Vilao evil = dao.buscarVilao(vilao);
			session.setAttribute("evil", evil);
		}
	}
	
	public void removerHeroi(Heroi heroi) {
		dao.removerHeroi(heroi);
	}

	public void atacar(Heroi heroi, Vilao vilao, HttpSession session) {
		Random r = new Random();
		Vilao evil = (Vilao) session.getAttribute("evil");
		Heroi hero = (Heroi) session.getAttribute("hero");
		
		hero.setAtacou(hero.getAtaque());
		hero.setCurou(0);
		hero.setLog("Atacar! " + hero.getNomeAtaque());
		int lucky = r.nextInt(13)+1;
		
		if(lucky == 7) {
			hero.setAtacou(hero.getAtaque()*2);
			hero.setLog("Ataque crítico! "+hero.getNomeAtaque() + "!!");
		}

		evil.setAtaque(r.nextInt(124) + 1);
		evil.setPorcentoVida(evil.getPorcentoVida() - hero.getAtacou());
		hero.setPorcentoVida(hero.getPorcentoVida() - evil.getAtaque());

		session.setAttribute("hero", hero);
		session.setAttribute("evil", evil);
	}

	public void curar(Heroi heroi, Vilao vilao, HttpSession session) {
		Random r = new Random();

		Vilao evil = (Vilao) session.getAttribute("evil");
		Heroi hero = (Heroi) session.getAttribute("hero");

		if (hero.getKitCura() > 0) {

			evil.setAtaque(r.nextInt(100) + 1);
			hero.setAtacou(0);
			hero.setKitCura(hero.getKitCura() - 1);
			hero.setCurou(r.nextInt(70) + 50);
			hero.setLog("Usei kit de cura, agora eu tenho mais vida!");
			hero.setPorcentoVida(hero.getPorcentoVida() + hero.getCurou() - evil.getAtaque());

			session.setAttribute("hero", hero);
			session.setAttribute("evil", evil);

		} else {
			hero.setLog("Ferrou, estou sem kit de cura!");
		}
	}

	public void gameOver(Heroi heroi, HttpSession session) {
		heroi = (Heroi) session.getAttribute("hero");
		if(heroi.isHardcore()) {
			dao.removerHeroi(heroi);
		}
		session.removeAttribute("hero");
		session.removeAttribute("evil");
	}

	public void levelUp(Heroi heroi, HttpSession session) {
		session.removeAttribute("evil");
		Heroi hero = (Heroi) session.getAttribute("hero");
		Random r = new Random();
		Heroi h = dao.buscarHeroi(heroi);
		h.setAtaque(h.getAtaque() + ((r.nextInt(3) + 1) * h.getNivel()));
		h.setVida((350) +(r.nextInt(6) + 1 * h.getNivel()));
		h.setGold((r.nextInt(15)+5) * h.getNivel());
		h.setNivel(h.getNivel() + 1);		
		h.setKitCura(hero.getKitCura() + r.nextInt(2)+2);
		session.removeAttribute("hero");
		dao.alterarHeroi(h);
	}
	
	public boolean comprarItem(Heroi heroi, int idItem, HttpSession session) {
		heroi = (Heroi) session.getAttribute("hero");
		
		if(idItem == 1) {
			if(heroi.getGold() >= 20) {
				heroi.setGold(heroi.getGold() - 20);
				heroi.setAtaque(heroi.getAtaque() + 10);
				dao.alterarHeroi(heroi);
				return true;
			}
		}
		
		if(idItem == 2) {
			if(heroi.getGold() >= 15) {
				heroi.setGold(heroi.getGold() - 15);
				heroi.setVida(heroi.getVida() + 16);
				dao.alterarHeroi(heroi);
				return true;
			}
		}
		
		if(idItem == 3) {
			if(heroi.getGold() >= 5) {
				heroi.setGold(heroi.getGold() - 5);
				heroi.setKitCura(heroi.getKitCura() + 2);
				dao.alterarHeroi(heroi);				
				return true;
			}
		}
		
		return false;
	}
}
