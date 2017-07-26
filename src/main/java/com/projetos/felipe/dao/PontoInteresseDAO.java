package com.projetos.felipe.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.projetos.felipe.model.PontoInteresse;

@Component
public class PontoInteresseDAO extends BaseDAO{
	
	public PontoInteresse find(Long id) {
		return (PontoInteresse) super.find(id, PontoInteresse.class);
	}
	
	@Transactional()
	public void removeById(Long id) {
		PontoInteresse pontoInteresse = find(id);
		super.remove(pontoInteresse);
	}
	
	@Transactional(readOnly = true)
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<PontoInteresse> findAll() {
		return (List) super.findByQuery("SELECT p FROM PontoInteresse p");
	}
	
	@Transactional(readOnly = true)
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<PontoInteresse> findByCoordenadas(int x, int y, int distancia) {
		int distanciaXMin = x - distancia;
		int distanciaXMax = x + distancia;
		int distanciaYMin = y - distancia;
		int distanciaYMax = y + distancia;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT p FROM PontoInteresse p where");
		sb.append(" (p.coordenadaX between " + distanciaXMin + " and " + distanciaXMax + ") and");
		sb.append(" (p.coordenadaY between " + distanciaYMin + " and " + distanciaYMax + ")");
		return (List) super.findByQuery(sb.toString());
	}
}
