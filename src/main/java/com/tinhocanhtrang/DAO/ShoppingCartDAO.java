package com.tinhocanhtrang.DAO;

import java.util.Collection;

import com.tinhocanhtrang.entity.Bill;
import com.tinhocanhtrang.entity.Product;

public interface ShoppingCartDAO {

	Product add(String id);

	void remove(Integer id);

	Product update(Integer id, int qty);

	void clear();

	Collection<Object> getItems();

	int getCount();

	double getAmount();
}
