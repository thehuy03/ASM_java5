package com.tinhocanhtrang.DAO;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tinhocanhtrang.entity.Image;

import jakarta.persistence.StoredProcedureParameter;

public interface ImageDAO extends JpaRepository<Image, String>{
	@Query("Select p From Image p Where p.product.id=?1")
	List<Image> findByIdproduct(String id);
}
