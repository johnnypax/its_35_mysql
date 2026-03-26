import mongoose from "mongoose";
const Schema = mongoose.Schema;

const StudenteSchema = new Schema(
    {
        nome: String,
        cognome: String,
        eta: Number,
        corso: String
    }
);
                             //Nome dei doc
const Studente = mongoose.model('Studente', StudenteSchema);

export default Studente;
