import mongoose from "mongoose";
import Studente from "./models/Studente.js";

async function connessione() {
    const db = await mongoose.connect('mongodb://localhost:27017/its');
    console.log("Connesso");

    let stu = await Studente.findById("69c4fbf9e08029499f95f96c");
    console.log(stu)
}

connessione();