const CART_KEY = 'cart';

  function getCart() {
    return JSON.parse(localStorage.getItem(CART_KEY) || '[]');
  }
  
  function saveCart(cart) {
    localStorage.setItem(CART_KEY, JSON.stringify(cart));
  }

  function addToCart(productId, quantity = 1) {
    const cart = getCart();
    const existing = cart.find(item => item.productId === productId);
    if (existing) {
      existing.quantity += quantity;
    } else {
      cart.push({ productId, quantity });
    }
    saveCart(cart);
  }

  function removeFromCart(productId) {
    const cart = getCart().filter(item => item.productId !== productId);
    saveCart(cart);
  }

  function clearCart() {
    localStorage.removeItem(CART_KEY);
  }