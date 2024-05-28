import express from 'express'
import mainRouter from './routes/main.js'
import apiRouter from './routes/api.js'

const app = express()


app.use(express.static('./public'))
app.set('views', 'views')
app.set('view engine', 'ejs')

// parse form data
app.use(express.urlencoded({ extended: false }))

// parse json
app.use(express.json())

app.use('/', mainRouter)
app.use('/api', apiRouter)




// Server in ascolto sulla porta 3000
app.listen(3000, () => {
    console.log('\x1b[32m[Server*] listening on port 3000');
});
