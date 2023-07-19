package com.tinhocanhtrang.DAO;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Producer;

public interface ProducerDAO extends JpaRepository<Producer, Serializable>{

}
