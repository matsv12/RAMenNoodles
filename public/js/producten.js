/* (async () => {
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

})(); */



(async () => {
// hier roep je jou api aan zodat je js met je database kan praten
    const API = "http://localhost/RAMenNoodles/public/api.php";

    async function fetchSQL(sql) {
        const res = await fetch(`${API}?sql=${encodeURIComponent(sql)}`);
        const json = await res.json();
        return json.data;
    }
//hier roep je alle producten op uit je database
    async function getAllProducts() {
        return fetchSQL("SELECT id, name, price, image, categorie_ID, description, featured FROM producten");
    }
//hier roep je alle categorieën op uit je database
    async function getAllCategories() {
        return fetchSQL("SELECT id, name FROM categories");
    }
//hier zoek je naar de exacte plaats van je website op je browser
    const param = window.location.search.split('=')[1];
    const gewensteCategorieNaam = param ? decodeURIComponent(param) : null;
//hier wacht je weer tot alles is ingeladen.
    const products = await getAllProducts();
    const categories = await getAllCategories();
//hier zeg je dat de gewenstecategorieID gelijk is aan niks(geen waarden)
    let gewensteCategorieID = null;
//hier ga je door categorie array loopen als er een waarde zit in gewenstecategorienaam
//als de namen in kleine letters exact gelijk zijn aan elkaar dan Zet je gewensteCategorieID gelijk aan de id van die categorie.
    if (gewensteCategorieNaam) {
        for (let i = 0; i < categories.length; i++) {
            if (categories[i].name.toLowerCase() === gewensteCategorieNaam.toLowerCase()) {
                gewensteCategorieID = categories[i].id;
            }
        }
    }
//hier maak je een lege array waar je later gefilterde producten insteekt
    let filteredProducts = [];
//als gewenstecategorieID geen waarde heeft dan steek je alle producten in filteredproducts anders ga je door de array products en als je daar dan de categorie_ID vind die gelijk is aan gewenstecategorieID dan steek je die in filteredproducts array.
    if (!gewensteCategorieID) {
        filteredProducts = products;
    } else {
        for (let i = 0; i < products.length; i++) {
            if (products[i].categorie_ID == gewensteCategorieID) {
                filteredProducts.push(products[i]);
            }
        }
    }
//hier haal je deze elementen uit je html
    const container = document.getElementById("productsContainer");
    const zoekterm = document.querySelector("#zoek");
//hier toon je al je producten en maak je ze allemaal een a element zodat je erop kan klikken je maakt ook je kaartje hier
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
//hier toon je alle gefilterde producten voor als je zoekbalk gebruikt.
    toonProducten(filteredProducts);
//hier luistert die naar een toetsaanslag en zoekt die naar de value van wat de gebruiker zoekt. vervolgens kijkt die als het leeg is toon je alles  anders toon je de gefilterde
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

