const mongoose = require('mongoose')
const Schema = mongoose.Schema;

const StudenteSchema = new Schema(
    {
        nome: {
            type: String,
            required: true
        },
        cognome: {
            type: String,
            required: true
        },
        eta: {
            type: Number,
            required: true
        },
        
        corso: {
            type: Schema.Types.ObjectId,
            ref: 'Corso',
            required: true
        }
    }
);
                             //Nome dei doc
const Studente = mongoose.model('Studente', StudenteSchema);

module.exports = Studente;