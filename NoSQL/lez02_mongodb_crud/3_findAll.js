import mongoose from "mongoose";
import Studente from "./models/Studente.js";

async function connessione() {
    const db = await mongoose.connect('mongodb://localhost:27017/its');
    console.log("Connesso");

    const elenco = await Studente.find({});
    console.log(elenco)
}

connessione();