package com.tinhocanhtrang.service;

import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;



import com.tinhocanhtrang.DAO.ShoppingCartDAO;

import com.tinhocanhtrang.entity.Product;
import com.tinhocanhtrang.repository.CartRepository;
import com.tinhocanhtrang.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@SessionScope
@Service
public class ShoppingCartService implements ShoppingCartDAO {
	String nameClass = "ShoppingCartService";

	@Autowired
	SessionService service;
	CartRepository cartRepository;
	ProductRepository productRepository;

	@Override
	public Product add(String id) {
		if (service.get(String.valueOf(id)) != null) {
			Product item = service.get(String.valueOf(id));
			//item.setProductQuantity(item.getProductQuantity() + 1);
			return item;
		} else {
			Product newItem = productRepository.findById(id).get();
			//newItem.setProductQuantity(1);;
			service.set(String.valueOf(id), newItem);
			return newItem;
		}
	}

	@Override
	public void remove(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public Product update(Integer id, int qty) {
		if (service.get(String.valueOf(id)) != null) {
			Product item = service.get(String.valueOf(id));
			//item.setProductQuantity(qty);
			return item;
		}
		return null;
	}

	@Override
	public void clear() {
		service.setTimeOut(1);
	}

	@Override
	public Collection<Object> getItems() {
		return  service.getAll(nameClass);
	}

	@Override
	public int getCount() {
		int count = 0;
		for (Object item : service.getAll(nameClass)) {
			Product product = (Product) item;

			count += product.getProductQuantity();
		}
		return count;
	}

	@Override
	public double getAmount() {
		double amount = 0;
		// Object item = new Product();
		for (Object item : service.getAll(nameClass)) {
			Product product = (Product) item;
			amount += product.getProductPrice() *  product.getProductQuantity();
		}
		return amount;
	}
//	private Map<Integer, Item> map = new HashMap<>();
//	
//	@Override
//	public Item add(Integer id) {
//		if (map.containsKey(id)) {
//			Item item = map.get(id);
//			item.setQty(item.getQty() + 1);
//			return item;
//		} else {
//			Item newItem = DB.items.get(id);
//			newItem.setQty(1);
//			map.put(id, newItem);
//			return newItem;
//		}
//	}
//
//	@Override
//	public void remove(Integer id) {
//		map.remove(id);
//	}
//
//	@Override
//	public Item update(Integer id, int qty) {
//		if (map.containsKey(id)) {
//			Item item = map.get(id);
//			item.setQty(qty);
//			return item;
//		}
//		return null;
//	}
//
//	@Override
//	public void clear() {
//		map.clear();
//	}
//
//	@Override
//	public Collection<Item> getItems() {
//		return map.values();
//	}
//
//	@Override
//	public int getCount() {
//		int count = 0;
//		for (Item item : map.values()) {
//			count += item.getQty();
//		}
//		return count;
//	}
//
//	@Override
//	public double getAmount() {
//		double amount = 0;
//		for (Item item : map.values()) {
//			amount += item.getPrice() * item.getQty();
//		}
//		return amount;
//	}
}
