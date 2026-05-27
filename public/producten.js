(async() => {
    const URL = 'https://ramennoodles.vercel.app/api'

    async function fetchJson(path) {
    const res = await fetch(`${URL}${path}`);
    if (!res.ok) throw new Error(`HTTP ${res.status} for ${path}`);
    return res.json();
}

    async function getAllProducts() {
    return fetchJson('/products');
}
    console.log(window.location.search.split('=')[1]);

    const gewensteCategorie = decodeURIComponent(window.location.search.split('=')[1]);

    const products = await getAllProducts();
    const filteredProducts = [];
    for (let i = 0; i < products.length; i++) {
        if (products[i].categories.includes(gewensteCategorie)) {
            filteredProducts.push(products[i])
        }   
    }


    const container = document.getElementById("productsContainer");

    filteredProducts.forEach(product => {
        const card = document.createElement("a");
        card.href = `product.html?id=${product.id}`;
        card.classList.add("product-card");

        card.innerHTML = `
            <img src="${product.image}" alt="${product.name}" class="product-img">
            <h3 class="product-title">${product.name}</h3>
        `;

        container.appendChild(card);
    });
    const zoekterm = document.querySelector("#zoek");

    zoekterm.addEventListener("input", function () {
        let toetsaanslag = zoekterm.value.toLowerCase();
        let filter = [];

        
        if (toetsaanslag === "") {
            toonProducten(filteredProducts);
            return;
        }

        for (let i = 0; i < filteredProducts.length; i++) {
            if (filteredProducts[i].name.toLowerCase().includes(toetsaanslag)) {
                filter.push(filteredProducts[i]);
            }
        }

        toonProducten(filter);
    });
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
})()
    