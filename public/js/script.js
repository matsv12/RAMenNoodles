/* const URL = 'https://ramennoodles.vercel.app/api'

/**
 * @typedef {Object} ProductSummary
 * @property {number} id - Numeric product identifier.
 * @property {string} name - Product name.
 * @property {number} price - Product price.
 * @property {string|null} image - Image URL, or null if not set.
 * @property {string[]} tags - Tag names.
 * @property {string[]} categories - Category names.
 
/*
/**
 * @typedef {Object} ProductDetail
 * @property {number} id - Numeric product identifier.
 * @property {string} name - Product name.
 * @property {number} price - Product price.
 * @property {string|null} image - Image URL, or null if not set.
 * @property {string[]} tags - Tag names.
 * @property {string[]} categories - Category names.
 * @property {string} shortDescription - Plaintext short description (HTML stripped).
 * @property {string} description - Plaintext description (HTML stripped).
 
/*
/**
 * @typedef {Object} ProductCategory
 * @property {string} title - Category name
 * @property {string|null} image - Image URL, or null if not set.
 

async function fetchJson(path) {
    const res = await fetch(`${URL}${path}`);
    if (!res.ok) throw new Error(`HTTP ${res.status} for ${path}`);
    return res.json();
}
/*
/**
 * @returns {Promise<ProductSummary[]>}

async function getFeaturedProducts() {
    return fetchJson('/products?featured=true');
}
/*
/**
 * @returns {Promise<ProductSummary[]>}

async function getAllProducts() {
    return fetchJson('/products');
}
/*
/**
 * @param {number|string} productId - Numeric product identifier.
 * @returns {Promise<ProductDetail>}

async function getProductDetail(productId) {
    return fetchJson(`/products/${productId}`);
}
/*
/**
 * @returns {Promise<ProductCategory[]>}
async function getAllCategories() {
    return fetchJson('/categories');
}


    // const allCategories = [];
    // const categoryImages = [];
    // const allProducts = await getAllProducts();
    // for (i=0; i<allProducts.length; i++) {
    //     const product = allProducts[i];
    //     console.log(product);
    //     for (j=0; j<product.categories.length; j++) {
    //         const category = product.categories[j];
    //         if (!allCategories.includes(category)) {
    //             allCategories.push(category);
    //             categoryImages.push(product.image);
    //         }
    //     }
    // }
    // console.log(allCategories[3], categoryImages[3])


    

    // card.addEventListener("click", async () => {
    //     const gewensteCategorie = item.title;
    //     const products = await getAllProducts();
    //     const filteredProducts = [];
    //     for (let i = 0; i < products.length; i++) {
    //         if (products[i].categories.includes(gewensteCategorie)) {
    //             filteredProducts.push(products[i])
    //         }   
    //     }
    //     console.log(filteredProducts);

    // */

/* (async () => {
    let hardwareCategories = await getAllCategories();
    let featuredProducts = await getFeaturedProducts();

    const categorieContainer = document.getElementById("hardwareContainer");
    const featuredContainer = document.getElementById("featuredContainer");
    const zoekterm = document.querySelector("#zoek");

    function toonCategorieën(lijst) {
        categorieContainer.innerHTML = "";
        lijst.forEach(item => {
            const card = document.createElement("a");
            card.href = `producten.html?category=${encodeURIComponent(item.title)}`;
            card.classList.add("hardware-card");

            card.innerHTML = `
                <img src="${item.image}" alt="${item.title}" class="hardware-img">
                <h3 class="hardware-title">${item.title}</h3>
            `;

            categorieContainer.appendChild(card);
        });
    }

    toonCategorieën(hardwareCategories);

    function toonFeatured(lijst) {
        featuredContainer.innerHTML = "";
        lijst.forEach(item => {
            const card = document.createElement("a");
            card.href = `product.html?id=${encodeURIComponent(item.id)}`;
            card.classList.add("featured-card");

            card.innerHTML = `
                <img src="${item.image}" alt="${item.name}" class="featured-img">
                <h3 class="featured-title">${item.name}</h3>
            `;

            featuredContainer.appendChild(card);
        });
    }

    toonFeatured(featuredProducts);

    zoekterm.addEventListener("input", function () {
        let toetsaanslag = zoekterm.value.toLowerCase();
        let filter = []; 

        if (toetsaanslag === "") {
            toonFeatured(featuredProducts);
            return;
        }

        for (let i = 0; i < featuredProducts.length; i++) {
            if (featuredProducts[i].name.toLowerCase().includes(toetsaanslag)) {
                filter.push(featuredProducts[i]);
            }
        }

        toonFeatured(filter);
    });

})(); */



const API = "http://localhost/RAMenNoodles/public/api.php";


async function fetchSQL(sql) {
    const res = await fetch(`${API}?sql=${encodeURIComponent(sql)}`);
    const json = await res.json();
    return json.data;
}

//bij deze haal je alle producten uit de database waar featured = 1 / true is
async function getFeaturedProducts() {
    return fetchSQL(
        "SELECT id, name, price, image, categorie_ID, description, featured FROM producten WHERE featured = 1"
    );
}

//hier haal je alle producten uit de database
async function getAllProducts() {
    return fetchSQL(
        "SELECT id, name, price, image, categorie_ID, description, featured FROM producten"
    );
}
//hier haal je de productendetails uit de database dus specifiek 1 product
async function getProductDetail(id) {
    return fetchSQL(
        `SELECT id, name, price, image, categorie_ID, description, featured FROM producten WHERE id = ${id}`
    );
}
//hier haal je alle categorieën uit je database
async function getAllCategories() {
    return fetchSQL(
        "SELECT id, name, image, categorie_id FROM categories"
    );
}

//hier wacht javascript tot deze zijn ingeladen
(async () => {
    let hardwareCategories = await getAllCategories();
    let featuredProducts = await getFeaturedProducts();
//hier haal je alle nodige elementen uit je html
    const categorieContainer = document.getElementById("hardwareContainer");
    const featuredContainer = document.getElementById("featuredContainer");
    const zoekterm = document.querySelector("#zoek");
<<<<<<< HEAD
//hier toon je de categorieën op het scherm
=======
//hier toon je de categorieën op het scherm. zelfde principe als toonfeatured
>>>>>>> 7e9cd12 (crud pagina, winkelwagen)
    function toonCategorieën(lijst) {
        categorieContainer.innerHTML = "";
        lijst.forEach(item => {
            const card = document.createElement("a");
            card.href = `producten.html?category=${encodeURIComponent(item.name)}`;
            card.classList.add("hardware-card");

            card.innerHTML = `
                <img src="${item.image}" alt="${item.name}" class="hardware-img">
                <h3 class="hardware-title">${item.name}</h3>
            `;

            categorieContainer.appendChild(card);
        });
    }

    toonCategorieën(hardwareCategories);
<<<<<<< HEAD
//hier toon je de featured producten op je scherm
=======
//hier toon je de featured producten op je scherm voor elk product maak je een kaartje dat aanklikbaar is omdat je het element a eraan geeft. dan ga je naar de pagina product.html en zorg je ervoor dat de id veilig naar daar wordt over gebracht en dat is die unieke id die de gebruiker heeft aangeklikt. en dan steek je het in de class featured-card of je geeft het product deze class.
>>>>>>> 7e9cd12 (crud pagina, winkelwagen)
    function toonFeatured(lijst) {
        featuredContainer.innerHTML = "";
        lijst.forEach(item => {
            const card = document.createElement("a");
            card.href = `product.html?id=${encodeURIComponent(item.id)}`;
            card.classList.add("featured-card");

            card.innerHTML = `
                <img src="${item.image}" alt="${item.name}" class="featured-img">
                <h3 class="featured-title">${item.name}</h3>
            `;

            featuredContainer.appendChild(card);
        });
    }

    toonFeatured(featuredProducts);
<<<<<<< HEAD
//hierdoor werkt de zoekbalk en kan je specifieke producten zoeken op de naam.
=======
//hierdoor werkt de zoekbalk en kan je specifieke producten zoeken op de naam. je luistert naar de toetsaanslag van de gebruiker en dan filter je de featured products vervolgens toon je de gefilterde op het scherm als er iets wordt gezocht anders is het gewoon alle items.
>>>>>>> 7e9cd12 (crud pagina, winkelwagen)
    zoekterm.addEventListener("input", function () {
        let toetsaanslag = zoekterm.value.toLowerCase();
        let filter = []; 

        if (toetsaanslag === "") {
            toonFeatured(featuredProducts);
            return;
        }

        for (let i = 0; i < featuredProducts.length; i++) {
            if (featuredProducts[i].name.toLowerCase().includes(toetsaanslag)) {
                filter.push(featuredProducts[i]);
            }
        }

        toonFeatured(filter);
    });

})();


