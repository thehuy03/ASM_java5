package com.tinhocanhtrang.DAO;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

import com.tinhocanhtrang.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Serializable>{
	
	
}
