const express = require('express')

const PORTA = 4000;
const INDIRIZZO = 'localhost';

const app = express();
app.use(express.static('public'))
app.set('view engine', 'ejs')

app.listen(PORTA, INDIRIZZO, () => {
    console.log("Sono in ascolto");
})

app.get("/", (req, res) => {
    res.render("home")
})

app.get("/chi-siamo", (req, res) => {
    res.render("chi-siamo")
})

app.get("/contatti", (req, res) => {
    res.render("contatti")
})

app.get("/lista", (req, res) => {
    let elenco = ["Farina", "Acqua", "Lievito", "Sale"]

    res.render("lista", {
        ele: elenco
    })
})