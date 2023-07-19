package com.tinhocanhtrang.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Bill;

public interface CartRepository extends JpaRepository<Bill,String>{
}
