/*(async () => {
    const URL = 'https://ramennoodles.vercel.app/api';

    async function fetchJson(path) {
        const res = await fetch(`${URL}${path}`);
        if (!res.ok) throw new Error(`HTTP ${res.status} for ${path}`);
        return res.json();
    }

    
    const params = new URLSearchParams(window.location.search);
    const id = params.get("id");

    if (!id) {
        document.body.innerHTML = "<h2>Geen product gevonden.</h2>";
        return;
    }

    const products = await fetchJson(`/products`);

    const product = products.find(p => p.id == id);

    if (!product) {
        document.body.innerHTML = "<h2>Product niet gevonden.</h2>";
        return;
    }

    document.getElementById("productTitle").textContent = product.name;
    document.getElementById("productName").textContent = product.name;

    document.getElementById("productImage").src = product.image;
    document.getElementById("productImage").alt = product.name;

    document.getElementById("productPrice").textContent = `Prijs: €${product.price}`;
    document.getElementById("productDescription").textContent = product.description || "Geen beschrijving beschikbaar.";
    document.getElementById("productCategories").textContent = product.categories.join(", ");
})();*/


(async () => {

    const API = "http://localhost/RAMenNoodles/public/api.php";

    async function fetchSQL(sql) {
        const res = await fetch(`${API}?sql=${encodeURIComponent(sql)}`);
        const json = await res.json();
        return json.data;
    }

    async function getProductDetail(id) {
        return fetchSQL(
            `SELECT id, name, price, image, categorie_ID, description, featured FROM producten WHERE id = ${id}`
        );
    }

    const params = new URLSearchParams(window.location.search);
    const id = params.get("id");

    if (!id) {
        document.body.innerHTML = "<h2>Geen product gevonden.</h2>";
        return;
    }

    const result = await getProductDetail(id);
    const product = result[0];

    if (!product) {
        document.body.innerHTML = "<h2>Product niet gevonden.</h2>";
        return;
    }

    document.getElementById("productTitle").textContent = product.name;
    document.getElementById("productName").textContent = product.name;

    document.getElementById("productImage").src = product.image;
    document.getElementById("productImage").alt = product.name;

    document.getElementById("productPrice").textContent = `Prijs: €${product.price}`;
    document.getElementById("productDescription").textContent = product.description || "Geen beschrijving beschikbaar.";
})();
