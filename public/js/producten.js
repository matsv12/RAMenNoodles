/*(async () => {
    const URL = 'https://ramennoodles.vercel.app/api';

    async function fetchJson(path) {
        const res = await fetch(`${URL}${path}`);
        if (!res.ok) throw new Error(`HTTP ${res.status} for ${path}`);
        return res.json();
    }

    async function getAllProducts() {
        return fetchJson('/products');
    }

    const param = window.location.search.split('=')[1];
    const gewensteCategorie = param ? decodeURIComponent(param) : null;

    const products = await getAllProducts();
    let filteredProducts = [];

    if (!gewensteCategorie) {
        filteredProducts = products;
    } else {
        for (let i = 0; i < products.length; i++) {
            if (products[i].categories.includes(gewensteCategorie)) {
                filteredProducts.push(products[i]);
            }
        }
    }

    const container = document.getElementById("productsContainer");
    const zoekterm = document.querySelector("#zoek");

    function toonProducten(lijst) {
        container.innerHTML = "";
        lijst.forEach(product => {
            const card = document.createElement("a");
            card.href = `product.html?id=${product.id}`;
            card.classList.add("product-card");

            card.innerHTML = `
                <img src="${product.image}" alt="${product.name}" class="product-img">
                <h3 class="product-title">${product.name}</h3>
            `;

            container.appendChild(card);
        });
    }

    toonProducten(filteredProducts);

    zoekterm.addEventListener("input", function () {
        let toetsaanslag = zoekterm.value.toLowerCase();

        if (toetsaanslag === "") {
            toonProducten(filteredProducts);
            return;
        }

        let filter = [];
        for (let i = 0; i < filteredProducts.length; i++) {
            if (filteredProducts[i].name.toLowerCase().includes(toetsaanslag)) {
                filter.push(filteredProducts[i]);
            }
        }

        toonProducten(filter);
    });

})();*/

(async () => {

    const API = "http://localhost/RAMenNoodles/public/api.php";

    async function fetchSQL(sql) {
        const res = await fetch(`${API}?sql=${encodeURIComponent(sql)}`);
        const json = await res.json();
        return json.data;
    }

    async function getAllProducts() {
        return fetchSQL("SELECT id, name, price, image, categorie_ID, description, featured FROM producten");
    }

    async function getAllCategories() {
        return fetchSQL("SELECT id, name FROM categories");
    }

    const param = window.location.search.split('=')[1];
    const gewensteCategorieNaam = param ? decodeURIComponent(param) : null;

    const products = await getAllProducts();
    const categories = await getAllCategories();

    let gewensteCategorieID = null;

    if (gewensteCategorieNaam) {
        for (let i = 0; i < categories.length; i++) {
            if (categories[i].name.toLowerCase() === gewensteCategorieNaam.toLowerCase()) {
                gewensteCategorieID = categories[i].id;
            }
        }
    }

    let filteredProducts = [];

    if (!gewensteCategorieID) {
        filteredProducts = products;
    } else {
        for (let i = 0; i < products.length; i++) {
            if (products[i].categorie_ID == gewensteCategorieID) {
                filteredProducts.push(products[i]);
            }
        }
    }

    const container = document.getElementById("productsContainer");
    const zoekterm = document.querySelector("#zoek");

    function toonProducten(lijst) {
        container.innerHTML = "";
        lijst.forEach(product => {
            const card = document.createElement("a");
            card.href = `product.html?id=${product.id}`;
            card.classList.add("product-card");
            card.innerHTML = `
                <img src="${product.image}" alt="${product.name}" class="product-img">
                <h3 class="product-title">${product.name}</h3>
            `;
            container.appendChild(card);
        });
    }

    toonProducten(filteredProducts);

    zoekterm.addEventListener("input", function () {
        let toetsaanslag = zoekterm.value.toLowerCase();
        if (toetsaanslag === "") {
            toonProducten(filteredProducts);
            return;
        }
        let filter = [];
        for (let i = 0; i < filteredProducts.length; i++) {
            if (filteredProducts[i].name.toLowerCase().includes(toetsaanslag)) {
                filter.push(filteredProducts[i]);
            }
        }
        toonProducten(filter);
    });

})();
