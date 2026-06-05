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

  const btn = document.getElementById('addToCartBtn');
  if (btn) {
    btn.addEventListener('click', () => {
      addToCart(123, 1);
    });
  }


  function renderCart() {
  const cart = getCart();
  const container = document.getElementById('cartContainer');

  if (cart.length === 0) {
    container.innerHTML = "<p>Je winkelwagen is leeg.</p>";
    return;
  }

  container.innerHTML = cart.map(item => `
    <div class="cart-item">
      <p>Product ID: ${item.productId}</p>
      <p>Aantal: ${item.quantity}</p>
      <button onclick="removeItem(${item.productId})">Verwijderen</button>
    </div>
  `).join('');
}

function removeItem(productId) {
  const cart = getCart().filter(item => item.productId != productId);
  localStorage.setItem(CART_KEY, JSON.stringify(cart));
  renderCart();
}

document.addEventListener("DOMContentLoaded", renderCart);
