package com.tinhocanhtrang.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, String> {
	public boolean existsByCategoryId(String categoryId);

	public Page<Category> findByCategoryNameContainingOrCategoryIdContaining(String categoryName, String categoryId,
			Pageable pageable);
	
}
