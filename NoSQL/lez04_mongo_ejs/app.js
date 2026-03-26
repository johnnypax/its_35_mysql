const express = require('express')
const mongoose = require('mongoose');
const Studente = require('./models/Studente')

const PORTA = 4000;
const INDIRIZZO = 'localhost';

const app = express();
app.use(express.static('public'))
app.set('view engine', 'ejs')

app.listen(PORTA, INDIRIZZO, () => {
    console.log("Sono in ascolto");
})

app.get("/", async (req, res) => {
    const db = await mongoose.connect('mongodb://localhost:27017/its');
    let elenco = await Studente.find({})
    db.disconnect();

    res.render("lista", {
        ele: elenco
    })
})

app.get("/inserisci", (req, res) => {
    res.render("inserimento")
})