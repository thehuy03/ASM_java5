package com.tinhocanhtrang.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


import com.tinhocanhtrang.entity.Spec;

public interface SpecRepository extends JpaRepository<Spec, Integer> {
	public boolean existsBySpecIdOrSpecKeyLikeAndSpecValueLike(Integer specId, String specKey, String specValue);

	public Spec findBySpecKeyAndSpecValue(String specKey, String specValue);

	public Page<Spec> findBySpecKeyContainingOrSpecValueContaining(String specKey, String specValue, Pageable pageable);
	
	public Spec findBySpecId(Integer specId);

}
