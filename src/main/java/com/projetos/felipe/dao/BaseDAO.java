package com.projetos.felipe.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public abstract class BaseDAO {

	@PersistenceContext
	protected EntityManager em;
	
	@Transactional(readOnly = true)
	public Object find(Long id, Class<?> classe) {
		return em.find(classe, id);
	}

	@Transactional()
	public void persist(Object object) {
		em.persist(object);
	}

	@Transactional()
	public void merge(Object object) {
		em.merge(object);
	}

	@Transactional()
	public void remove(Object object) {
		em.remove(object);
	}
	
	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Object> findByQuery(String query) {
		return em.createQuery(query).getResultList();
	}
}
