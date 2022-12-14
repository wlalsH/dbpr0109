package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Cart;
import model.Item;
import model.dao.CartDAO;
import model.dao.CustomerDAO;

public class CartManager {
	private static CartManager cartMan = new CartManager();
	private CartDAO cartDAO;

	private CartManager() {
		try {
			cartDAO = new CartDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static CartManager getInstance() {
		return cartMan;
	}
	
	public List<Cart> findCartItems(String customerId)
			throws SQLException, CustomerNotFoundException {
		List<Cart> cartItems = cartDAO.findCartItems(customerId);
		for(Cart cartItem : cartItems) {
			cartDAO.findItemInfo(cartItem);
		}
		return cartItems;
	}
	
	public void createCartItem(String productId, String customerId) throws SQLException {
		cartDAO.createCartItem(productId, customerId);
		return;
	}
	
	public void deleteCartItem(String cartId) throws SQLException {
		cartDAO.deleteCartItem(cartId);
		return;
	}
	
	public void updateQuantity(String cartId, int quantity) {
		cartDAO.updateQuantity(cartId, quantity);
		return;
	}
}
