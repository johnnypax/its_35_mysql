const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const CorsoSchema = new Schema({
    nome: {
        type: String,
        required: true
    },
    descrizione: {
        type: String,
        required: true
    },
    crediti: {
        type: Number,
        required: true,
        default: 6
    }
});

module.exports = mongoose.model('Corso', CorsoSchema);