import mongoose from "mongoose";
import Studente from "./models/Studente.js";

async function connessione() {
    const db = await mongoose.connect('mongodb://localhost:27017/its');
    console.log("Connesso");

    let stud = await Studente.create(
        {
            nome: "Mario",
            cognome: "Rossi",
            corso: "Informatica",
            hobbies: ["Canto", "Programmazione"]
        }
    );

    console.log(stud);

}

connessione();