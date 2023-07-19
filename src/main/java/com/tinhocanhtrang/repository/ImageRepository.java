package com.tinhocanhtrang.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Image;

public interface ImageRepository extends JpaRepository<Image, String>{
	
}
