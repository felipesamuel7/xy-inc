package com.projetos.felipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.projetos.felipe.dao.PontoInteresseDAO;
import com.projetos.felipe.model.PontoInteresse;
import com.projetos.felipe.util.Constantes;

@Controller
public class XYIncController {

	@Autowired
	private PontoInteresseDAO piDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("home");
		model.addObject(Constantes.EMPRESA_NOME_KEY, Constantes.EMPRESA_NOME_VALUE);
		return model;
	}

	@RequestMapping(value = "/explorar", method = RequestMethod.GET)
	public ModelAndView explorar() {
		ModelAndView model = new ModelAndView("explorar");
		model.addObject(Constantes.EMPRESA_NOME_KEY, Constantes.EMPRESA_NOME_VALUE);
		return model;
	}

	@RequestMapping(value = "/gerenciar", method = RequestMethod.GET)
	public ModelAndView gerenciar() {
		ModelAndView model = new ModelAndView("gerenciar");
		model.addObject(Constantes.EMPRESA_NOME_KEY, Constantes.EMPRESA_NOME_VALUE);
		model.addObject("pontos", piDao.findAll());
		return model;
	}

	@RequestMapping(value = "/gerenciar/editar/{id}", method = RequestMethod.GET)
	public ModelAndView editarForm(@PathVariable long id) {
		PontoInteresse pontoInteresse = piDao.find(id);
		ModelAndView model = new ModelAndView("gerenciar_inserir");
		model.addObject(Constantes.EMPRESA_NOME_KEY, Constantes.EMPRESA_NOME_VALUE);
		model.addObject("ponto", pontoInteresse);
		return model;
	}

	@RequestMapping(value = "/gerenciar/inserir", method = RequestMethod.GET)
	public ModelAndView inserirForm() {
		ModelAndView model = new ModelAndView("gerenciar_inserir");
		model.addObject(Constantes.EMPRESA_NOME_KEY, Constantes.EMPRESA_NOME_VALUE);
		return model;
	}

	@RequestMapping(value = "/gerenciar/create", method = RequestMethod.POST)
	public ModelAndView create(@ModelAttribute("pontoInteresse") PontoInteresse pontoInteresse) {
		piDao.persist(pontoInteresse);
		ModelAndView model = new ModelAndView();
		model.setViewName(Constantes.REDIRECT_GERENCIAR);
		return model;
	}

	@RequestMapping(value = "/gerenciar/edit", method = RequestMethod.POST)
	public ModelAndView edit(@ModelAttribute("pontoInteresse") PontoInteresse pontoInteresse) {
		piDao.merge(pontoInteresse);
		ModelAndView model = new ModelAndView();
		model.setViewName(Constantes.REDIRECT_GERENCIAR);
		return model;
	}

	@RequestMapping(value = "/gerenciar/delete/{id}", method = RequestMethod.POST)
	public ModelAndView delete(@PathVariable long id) {
		piDao.removeById(id);
		ModelAndView model = new ModelAndView();
		model.setViewName(Constantes.REDIRECT_GERENCIAR);
		return model;
	}

	@RequestMapping(value = "/explorar/find", method = RequestMethod.POST)
	public ModelAndView find(@RequestParam("coordenadaX") int x, @RequestParam("coordenadaY") int y,
			@RequestParam("distancia") int distancia) {
		ModelAndView model = new ModelAndView("explorar");
		model.addObject("pontos", piDao.findByCoordenadas(x, y, distancia));
		model.addObject(Constantes.EMPRESA_NOME_KEY, Constantes.EMPRESA_NOME_VALUE);
		model.addObject("coordenadaX", x);
		model.addObject("coordenadaY", y);
		model.addObject("distancia", distancia);
		return model;
	}
}