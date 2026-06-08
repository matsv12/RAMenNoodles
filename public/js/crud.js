// crud.js
// De CRUD-operaties voor producten: Create, Read, Update, Delete.
// Heeft app.js nodig (voor runQuery).
//
// LET OP: we plakken hier waarden rechtstreeks in de SQL-string.
// Dat is simpel om te leren, maar onveilig (SQL injection).
// In de echte cursus gebruik je hiervoor prepared statements.

// --- READ: alle producten tonen in de lijst ---
async function toonBeheerLijst() {
    const producten = await runQuery("SELECT id, name, price, image, categorie_id FROM producten");

    const lijst = document.getElementById("productenLijst");
    lijst.innerHTML = "";   // Eerst leegmaken

    for (const product of producten) {
        const item = document.createElement("li");

        // Tekst van het product
        const tekst = document.createTextNode(
            product.name + " - \u20ac" + product.price + " "
        );
        item.appendChild(tekst);

        // Knop: bewerken -> zet het product in het formulier
        const bewerkKnop = document.createElement("button");
        bewerkKnop.textContent = "Bewerken";
        bewerkKnop.addEventListener("click", function () {
            formulierVullen(product);
        });
        item.appendChild(bewerkKnop);

        // Knop: verwijderen
        const verwijderKnop = document.createElement("button");
        verwijderKnop.textContent = "Verwijderen";
        verwijderKnop.addEventListener("click", function () {
            productVerwijderen(product.id);
        });
        item.appendChild(verwijderKnop);

        lijst.appendChild(item);
    }
}

// --- Formulier vullen met een bestaand product (voor bewerken) ---
function formulierVullen(product) {
    document.getElementById("id").value = product.id;
    document.getElementById("name").value = product.name;
    document.getElementById("image").value = product.image
    document.getElementById("price").value = product.price;
    document.getElementById("categorie_ID").value = product.categorie_ID;
}

// --- Formulier leegmaken (na opslaan of bij annuleren) ---
function formulierLeegmaken() {
    document.getElementById("id").value = "";
    document.getElementById("name").value = "";
    document.getElementById("image").value= "";
    document.getElementById("price").value = "";
    document.getElementById("categorie_ID").value = "";
}

// --- CREATE of UPDATE: opslaan ---
// Is het verborgen id leeg -> nieuw product (INSERT).
// Staat er een id -> bestaand product (UPDATE).
async function productOpslaan() {
    const id = document.getElementById("id").value;
    const naam = document.getElementById("name").value;
    const prijs = document.getElementById("price").value;
    const afbeelding = document.getElementById("image").value;
    const categorieId = document.getElementById("categorie_ID").value;

    let sql;

    if (id === "") {
        // CREATE: nieuw product toevoegen
        sql = "INSERT INTO producten (name, price, categorie_Id) " +
              "VALUES ('" + naam + "', " + prijs + ", " + afbeelding +", " + categorieId   + ")";
    } else {
        // UPDATE: bestaand product wijzigen
        sql = "UPDATE producten SET " +
              "name = '" + naam + "', " +
              "price = " + prijs + ", " +
              "image = " + afbeelding + ", " + 
              "categorie_Id = " + categorie_ID + " " +
              "WHERE id = " + id;
    }

    await runQuery(sql);

    // Formulier leegmaken en lijst opnieuw laden
    formulierLeegmaken();
    toonBeheerLijst();
}

// --- DELETE: verwijderen ---
async function productVerwijderen(id) {
    // Vraag eerst om bevestiging
    const zeker = confirm("Weet je zeker dat je dit product wilt verwijderen?");
    if (!zeker) {
        return;
    }

    await runQuery("DELETE FROM producten WHERE id = " + id);

    // Lijst opnieuw laden
    toonBeheerLijst();
}
