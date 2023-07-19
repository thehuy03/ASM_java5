package com.tinhocanhtrang.DAO;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Spec;

public interface SpecDAO extends JpaRepository<Spec, Serializable>{

}
