const form = document.getElementById("contactFormulier");

    form.addEventListener("submit", function () {

        const name = document.getElementById("name").value.trim();
        const email = document.getElementById("Email").value.trim();
        const message = document.getElementById("Message").value.trim();

        if (!name || !email || !message) {
            alert(" Vul alle velden in voordat je verzendt!");
            return;
        }

        alert(" Bedankt voor je bericht! We nemen snel contact met je op.");

        form.reset();
    });