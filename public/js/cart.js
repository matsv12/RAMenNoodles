const CART_KEY = 'cart';

function getCart() {
    return JSON.parse(localStorage.getItem(CART_KEY) || '[]');
}

function saveCart(cart) {
    localStorage.setItem(CART_KEY, JSON.stringify(cart));
}


//product in winkelwagen te zeten
function addToCart(product) {
    const cart = getCart();
    const existing = cart.find(item => item.id === product.id);

    if (existing) {
        existing.quantity += 1;
    } else {
        cart.push(product);
    }

    saveCart(cart);
}


// om alle items weg te doen.
function clearCart() {
    localStorage.removeItem(CART_KEY);
}

// om alles te laten zien op het scherm
function renderCart() {
    const cart = getCart();
    const left = document.getElementById('cartContainer');
    const right = document.getElementById('cartTotalBox');

    if (cart.length === 0) {
        left.innerHTML = "<p>Je winkelwagen is leeg.</p>";
        right.innerHTML = "";
        return;
    }

    // producten inhoud
    left.innerHTML = cart.map(item => `
        <div class="cart-item">
            <img src="${item.image}" width="100">
            <h3>${item.name}</h3>
            <p>Prijs: €${item.price}</p>
            <p>Aantal: ${item.quantity}</p>
            <button onclick="removeItem(${item.id})">Verwijderen</button>
        </div>
    `).join('');

    // totaalprijs berekenen
    const total = cart.reduce((sum, item) => sum + item.price * item.quantity, 0);

    right.innerHTML = `
        <div class="total-box">
            <h2>Totaal</h2>
            <p>€${total.toFixed(2)}</p>
        </div>
    `;
}

// om alles te laten zien op het scherm
function renderCart() {
    const cart = getCart();
        const left = document.getElementById("cartContainer");
        const right = document.getElementById("cartTotalBox");

    if (cart.length === 0) {
        left.innerHTML = "<p>Je winkelwagen is leeg.</p>";
        right.innerHTML = "";
        return;
    }

    // producten inhoud
    left.innerHTML = cart.map(item => `
        <div class="cart-item">
            <img src="${item.image}" width="100">
            <h3>${item.name}</h3>
            <p>Prijs: €${item.price}</p>
            <p>Aantal: ${item.quantity}</p>
            <button onclick="removeItem(${item.id})">Verwijderen</button>
        </div>
    `).join('');

    // totaalprijs berekenen
    const total = cart.reduce((sum, item) => sum + item.price * item.quantity, 0);

    right.innerHTML = `
    <div class="total-box">
        <h2>Totaal</h2>
        <p>€${total.toFixed(2)}</p>
        <button onclick="pay()">Betalen</button>
    </div>
`;
}



document.addEventListener("DOMContentLoaded", renderCart);

//item verwijderen uit winkelwagen
function removeItem(productId) {
    const cart = getCart();
    const item = cart.find(p => p.id === productId);
//als het item geen data heeft return
    if (!item) return;
//als de hoeveelheid meer als 1 is dan verwijder je er maar 1 per klik
    if (item.quantity > 1) {
        item.quantity -= 1;   // één stuk verwijderen
    } else {
        // ander als hoeveelheid 1 is → volledig verwijderen
        const index = cart.indexOf(item);
        cart.splice(index, 1);
    }

    saveCart(cart);
    renderCart();
}

function pay() {
    Swal.fire({
        title: "Betaling gelukt!",
        text: "Bedankt voor je aankoop",
        icon: "success",
        confirmButtonText: "OK!"
    });

    clearCart();
    renderCart();
}
