# MongoDB Cheatsheet (con spiegazioni)

Guida rapida alle **operazioni più comuni e avanzate di MongoDB** con
una breve descrizione di ogni funzione.

------------------------------------------------------------------------

# 1. Navigazione database

``` javascript
show dbs
```

Mostra tutti i database presenti nel server MongoDB.

``` javascript
use academy
```

Seleziona (o crea se non esiste) il database `academy`.

``` javascript
show collections
```

Mostra tutte le collection nel database corrente.

``` javascript
db
```

Mostra il nome del database attualmente selezionato.

------------------------------------------------------------------------

# 2. Inserimento documenti

``` javascript
db.studenti.insertOne({...})
```

Inserisce **un singolo documento** in una collection.

``` javascript
db.studenti.insertMany([...])
```

Inserisce **più documenti in un'unica operazione**, più efficiente per
grandi dataset.

Esempio:

``` javascript
db.studenti.insertOne({
 nome:"Giovanni",
 cognome:"Pace",
 corso:"MongoDB"
})
```

------------------------------------------------------------------------

# 3. Lettura documenti

``` javascript
db.studenti.find()
```

Recupera **tutti i documenti della collection**.

``` javascript
db.studenti.findOne({...})
```

Restituisce **solo il primo documento che soddisfa il filtro**.

``` javascript
db.studenti.find().pretty()
```

Mostra i risultati con **formattazione leggibile**.

------------------------------------------------------------------------

# 4. Filtri query

``` javascript
db.studenti.find({corso:"MongoDB"})
```

Filtra i documenti dove `corso` è uguale a MongoDB.

Operatori principali:

``` javascript
$gt
```

Greater Than → maggiore di.

``` javascript
$gte
```

Greater Than Equal → maggiore o uguale.

``` javascript
$lt
```

Less Than → minore di.

``` javascript
$lte
```

Less Than Equal → minore o uguale.

``` javascript
$ne
```

Not Equal → diverso da.

``` javascript
$in
```

Verifica se il valore è contenuto in una lista.

Esempio:

``` javascript
db.studenti.find({eta:{$gt:25}})
```

Trova tutti gli studenti con età maggiore di 25.

------------------------------------------------------------------------

# 5. Operatori logici

``` javascript
$and
```

Richiede che **tutte le condizioni siano vere**.

``` javascript
$or
```

Richiede che **almeno una condizione sia vera**.

Esempio:

``` javascript
db.studenti.find({
 $or:[
  {corso:"MongoDB"},
  {corso:"Docker"}
 ]
})
```

------------------------------------------------------------------------

# 6. Campi annidati

MongoDB supporta documenti JSON con oggetti annidati.

``` javascript
db.studenti.find({"indirizzo.citta":"Firenze"})
```

Serve per filtrare **campi dentro oggetti nested**.

------------------------------------------------------------------------

# 7. Array

MongoDB può salvare array direttamente nei documenti.

``` javascript
db.studenti.find({tags:"database"})
```

Trova documenti che contengono `database` nell'array.

``` javascript
$all
```

Verifica che l'array contenga **tutti i valori indicati**.

``` javascript
$size
```

Verifica **la dimensione dell'array**.

------------------------------------------------------------------------

# 8. Proiezione

``` javascript
db.studenti.find({}, {nome:1, corso:1, _id:0})
```

Serve a **mostrare solo alcuni campi del documento**.

-   `1` → includi campo
-   `0` → escludi campo

------------------------------------------------------------------------

# 9. Ordinamento

``` javascript
db.studenti.find().sort({eta:1})
```

Ordina i risultati.

-   `1` → crescente
-   `-1` → decrescente

------------------------------------------------------------------------

# 10. Limit e paginazione

``` javascript
limit()
```

Limita il numero di risultati.

``` javascript
skip()
```

Salta un certo numero di documenti (utile per paginazione).

Esempio:

``` javascript
db.studenti.find().skip(10).limit(10)
```

------------------------------------------------------------------------

# 11. Update documenti

``` javascript
updateOne()
```

Aggiorna **un solo documento**.

``` javascript
updateMany()
```

Aggiorna **tutti i documenti che soddisfano il filtro**.

Esempio:

``` javascript
db.studenti.updateOne(
 {nome:"Anna"},
 {$set:{voto:30}}
)
```

------------------------------------------------------------------------

# 12. Operator update

``` javascript
$set
```

Aggiorna o crea un campo.

``` javascript
$inc
```

Incrementa un valore numerico.

``` javascript
$unset
```

Rimuove un campo dal documento.

``` javascript
$rename
```

Rinomina un campo.

------------------------------------------------------------------------

# 13. Operazioni sugli array

``` javascript
$push
```

Aggiunge un elemento all'array.

``` javascript
$addToSet
```

Aggiunge un elemento **solo se non esiste già**.

``` javascript
$pull
```

Rimuove un valore dall'array.

------------------------------------------------------------------------

# 14. Upsert

``` javascript
{upsert:true}
```

Se il documento non esiste, MongoDB **lo crea automaticamente**.

------------------------------------------------------------------------

# 15. Delete

``` javascript
deleteOne()
```

Cancella **un documento**.

``` javascript
deleteMany()
```

Cancella **più documenti**.

------------------------------------------------------------------------

# 16. Conteggi

``` javascript
countDocuments()
```

Conta i documenti che soddisfano una query.

``` javascript
estimatedDocumentCount()
```

Conta rapidamente tutti i documenti (meno preciso ma più veloce).

------------------------------------------------------------------------

# AGGREGATION PIPELINE

MongoDB permette analisi avanzate con **pipeline di trasformazione dei
dati**.

Struttura:

``` javascript
db.collection.aggregate([
 { stage1 },
 { stage2 }
])
```

------------------------------------------------------------------------

# 17. Match

``` javascript
$match
```

Serve per **filtrare i documenti** nella pipeline (equivalente a WHERE).

------------------------------------------------------------------------

# 18. Project

``` javascript
$project
```

Serve per:

-   selezionare campi
-   creare nuovi campi
-   trasformare dati

Esempio:

``` javascript
{
 $project:{
  nome:1,
  prezzoIVA:{$multiply:["$prezzo",1.22]}
 }
}
```

------------------------------------------------------------------------

# 19. Group

``` javascript
$group
```

Serve per **aggregare dati** come GROUP BY in SQL.

Operatori principali:

    $sum
    $avg
    $max
    $min
    $count

Esempio:

``` javascript
{
 $group:{
  _id:"$cliente",
  totale:{$sum:"$prezzo"}
 }
}
```

------------------------------------------------------------------------

# 20. Sort

``` javascript
$sort
```

Ordina i risultati nella pipeline.

------------------------------------------------------------------------

# 21. Limit

``` javascript
$limit
```

Limita il numero di documenti nella pipeline.

------------------------------------------------------------------------

# 22. Unwind

``` javascript
$unwind
```

Serve a **espandere un array in più documenti**.

Se un ordine contiene 3 prodotti → diventeranno 3 documenti.

------------------------------------------------------------------------

# 23. Lookup (Join)

``` javascript
$lookup
```

Permette di fare **join tra due collection**.

Esempio:

``` javascript
{
 $lookup:{
  from:"clienti",
  localField:"clienteId",
  foreignField:"_id",
  as:"cliente"
 }
}
```

------------------------------------------------------------------------

# 24. Facet

``` javascript
$facet
```

Permette di eseguire **più aggregazioni contemporaneamente** sullo
stesso dataset.

Molto usato per **analytics e dashboard**.

------------------------------------------------------------------------

# 25. Count

``` javascript
$count
```

Conta i documenti nella pipeline.

------------------------------------------------------------------------

# SQL vs MongoDB

  SQL        MongoDB
---------- ---------
  SELECT     find
  WHERE      match
  GROUP BY   group
  JOIN       lookup
  ORDER BY   sort
  COUNT      count
  LIMIT      limit

------------------------------------------------------------------------

# Best Practices

-   Usa `$match` all'inizio della pipeline
-   Riduci i campi con `$project`
-   Indicizza i campi usati nelle query
-   Usa `$lookup` solo quando necessario
-   Evita `$unwind` su array molto grandi
