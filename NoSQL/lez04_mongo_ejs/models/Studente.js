const mongoose = require('mongoose')
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

module.exports = Studente;
