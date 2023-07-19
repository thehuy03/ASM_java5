package com.tinhocanhtrang.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Category;
import com.tinhocanhtrang.entity.User;

public interface UserRepository extends JpaRepository<User, String> {
	public boolean existsByUserPhone(String userPhone);

	public boolean existsByUserPhoneAndUserPassword(String userPhone, String userPassword);

	public Page<User> findByUserNameContainingOrUserEmailContaining(String userName, String userEmail,
			Pageable pageable);
}
