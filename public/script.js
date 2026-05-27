const URL = 'https://ramennoodles.vercel.app/api'

/**
 * @typedef {Object} ProductSummary
 * @property {number} id - Numeric product identifier.
 * @property {string} name - Product name.
 * @property {number} price - Product price.
 * @property {string|null} image - Image URL, or null if not set.
 * @property {string[]} tags - Tag names.
 * @property {string[]} categories - Category names.
 */

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
 */

/**
 * @typedef {Object} ProductCategory
 * @property {string} title - Category name
 * @property {string|null} image - Image URL, or null if not set.
 */

async function fetchJson(path) {
    const res = await fetch(`${URL}${path}`);
    if (!res.ok) throw new Error(`HTTP ${res.status} for ${path}`);
    return res.json();
}

/**
 * @returns {Promise<ProductSummary[]>}
 */
async function getFeaturedProducts() {
    return fetchJson('/products?featured=true');
}

/**
 * @returns {Promise<ProductSummary[]>}
 */
async function getAllProducts() {
    return fetchJson('/products');
}

/**
 * @param {number|string} productId - Numeric product identifier.
 * @returns {Promise<ProductDetail>}
 */
async function getProductDetail(productId) {
    return fetchJson(`/products/${productId}`);
}

/**
 * @returns {Promise<ProductCategory[]>}
 */
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

    //

(async () => {
    let hardwareCategories = await getAllCategories();
    const container = document.getElementById("hardwareContainer");
    const zoekterm = document.querySelector("#zoek");

    function toonCategorieën(lijst) {
        container.innerHTML = "";
        lijst.forEach(item => {
            const card = document.createElement("a");
            card.href = `producten.html?category=${encodeURIComponent(item.title)}`;
            card.classList.add("hardware-card");

            card.innerHTML = `
                <img src="${item.image}" alt="${item.title}" class="hardware-img">
                <h3 class="hardware-title">${item.title}</h3>
            `;

            container.appendChild(card);
        });
    }

    toonCategorieën(hardwareCategories);

zoekterm.addEventListener("input", function () {
    let toetsaanslag = zoekterm.value.toLowerCase();
    let filter = [];

    if (toetsaanslag === "") {
        toonCategorieën(hardwareCategories);
        return;
    }

    for (let i = 0; i < hardwareCategories.length; i++) {
        if (hardwareCategories[i].title.toLowerCase().includes(toetsaanslag)) {
            filter.push(hardwareCategories[i]);
        }
    }

    toonCategorieën(filter);
});

})();


(async () => {
    let featuredProducts = await getFeaturedProducts();
    const container = document.getElementById("featuredContainer");

    function toonFeatured(lijst) {
        container.innerHTML = "";
        lijst.forEach(item => {
            const card = document.createElement("a");
            card.href = `product.html?id=${encodeURIComponent(item.id)}`;
            card.classList.add("featured-card");

            card.innerHTML = `
                <img src="${item.image}" alt="${item.title}" class="featured-img">
                <h3 class="featured-title">${item.title}</h3>
            `;

            container.appendChild(card);
        });
    }

    toonFeatured(featuredProducts);
})();

// api functie van featured products
async function getFeaturedProducts() {
    const res = await fetch("/api/products?featured=true");
    return await res.json();
}


