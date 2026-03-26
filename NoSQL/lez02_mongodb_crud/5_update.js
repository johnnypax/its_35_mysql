import mongoose from "mongoose";
import Studente from "./models/Studente.js";

async function connessione() {
    const db = await mongoose.connect('mongodb://localhost:27017/its');
    console.log("Connesso");

    const risultato = await Studente.updateOne(
        {_id: "69c4fb49bdd7e85dbc4f70ee"},
        {
            nome: "Giovannani",
            cognome: "Pacetti"
        }
    )

    if(risultato.modifiedCount)
        console.log("Modificato con successo")
    else
        console.log("Errore")

    db.disconnect();
}

connessione();