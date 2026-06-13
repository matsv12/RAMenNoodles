(async () => {
//je verwijst naar de juiste api hier zodat je js kan praten met database
    const API = "http://localhost/RAMenNoodles/public/api.php";

    async function fetchSQL(sql) {
        const res = await fetch(`${API}?sql=${encodeURIComponent(sql)}`);
        const json = await res.json();
        return json.data;
    }
    //je select alles dat je nodig hebt uit je database hier
    async function getProductDetail(id) {
        return fetchSQL(
            `SELECT id, name, price, image, categorie_ID, description, featured FROM producten WHERE id = ${id}`
        );
    }
    //hier zoek je de locatie waar je dingen moet halen
    const params = new URLSearchParams(window.location.search);
    const id = params.get("id");
    //als id niet bestaat geef je dit terug V
    if (!id) {
        document.body.innerHTML = "<h2>Geen product gevonden.</h2>";
        return;
    }
    //hier haal je 1 product terug dat je hebt aangeklikt in je producten lijst.
    const result = await getProductDetail(id);
    const product = result[0];
    //dit is voor je product knop en dat je producten in je cart kan steken
    const btn = document.getElementById("addToCartBtn");
    btn.addEventListener('click', () => {
    addToCart({
        id: parseInt(product.id),
        name: product.name,
        price: product.price,
        price: parseFloat(product.price),
        image: product.image,
        quantity: 1
    });
    alert("Item is toegevoegd aan je winkelwagen!");
});

    //als je product niet vindt dan toon je V
    if (!product) {
        document.body.innerHTML = "<h2>Product niet gevonden.</h2>";
        return;
    }

    //hier haal je alle id's uit je html

    //hier haal je alle id's uit je html en geef je ze content.
    document.getElementById("productTitle").textContent = product.name;
    document.getElementById("productName").textContent = product.name;

    document.getElementById("productImage").src = product.image;
    document.getElementById("productImage").alt = product.name;

    document.getElementById("productPrice").textContent = `Prijs: €${product.price}`;
    document.getElementById("productDescription").textContent = product.description || "Geen beschrijving beschikbaar.";
})();
