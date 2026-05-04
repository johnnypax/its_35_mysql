const express = require('express');
const mongoose = require('mongoose');
const Studente = require('./models/Studente')
const Corso = require('./models/Corso')
require('dotenv').config();

const PORTA = process.env.PORTA || 4000;
const INDIRIZZO = process.env.INDIRIZZO || "localhost";
const DB = process.env.DB;

const app = express();
app.use(express.json());

app.listen(PORTA, INDIRIZZO, () => {
    console.log("Sono in ascolto");
});

app.get("/studenti/", async (req, res) => {
    const db = await mongoose.connect(DB);
    let elenco = await Studente.find({})
    db.disconnect();
    res.json(elenco);
});

app.get("/studenti/:id", async (req, res) => {
    try {
        const db = await mongoose.connect(DB);
        const id = req.params.id;
        let studente = await Studente.findById(id);
        db.disconnect();
        res.json(studente);
    } catch (error) {
        res.status(404).json({ message: "Studente non trovato" });
    }
});

app.post("/studenti/", async (req, res) => {
    if (req.body.nome === undefined || req.body.cognome === undefined || req.body.eta === undefined || req.body.corso === undefined) {
        return res.status(400).json({ message: "Dati mancanti" });
    }

    const db = await mongoose.connect(DB);
    const studente = new Studente(req.body);
    await studente.save();
    db.disconnect();
    res.json(studente);
});

app.delete("/studenti/:id", async (req, res) => {
    try {
        const db = await mongoose.connect(DB);
        const id = req.params.id;
        await Studente.findByIdAndDelete(id);
        db.disconnect();
        res.json({ message: "Studente eliminato" });
    } catch (error) {
        res.status(404).json({ message: "Studente non trovato" });
    }
});

app.put("/studenti/:id", async (req, res) => {
    try {
        const db = await mongoose.connect(DB);
        const id = req.params.id;
        const studenteAggiornato =
            await Studente.findByIdAndUpdate(id, req.body, { new: true });
        db.disconnect();
        res.json(studenteAggiornato);
    } catch (error) {
        res.status(404).json({ message: "Studente non trovato" });
    }
});

app.get("/corso", async (req, res) => {
    const db = await mongoose.connect(DB);
    let elenco = await Corso.find({})
    db.disconnect();
    res.json(elenco);
});

app.post("/corso", async (req, res) => {
    if (req.body.nome === undefined || req.body.descrizione === undefined || req.body.crediti === undefined) {
        return res.status(400).json({ message: "Dati mancanti" });
    }
    const db = await mongoose.connect(DB);
    const corso = new Corso(req.body);
    await corso.save();
    db.disconnect();
    res.json(corso);
});

app.get("/studenti/:id/corso", async (req, res) => {
    try {
        const db = await mongoose.connect(DB);
        const id = req.params.id;
        let studente = await Studente.findById(id).populate('corso');
        db.disconnect();
        res.json(studente);
    } catch (error) {
        res.status(404).json({ message: "Studente non trovato" });
    }   
});