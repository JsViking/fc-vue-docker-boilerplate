const fs = require('fs')
const exec = require('child_process').exec
const express = require('express')
const bodyParser = require('body-parser')
const cookieParser = require('cookie-parser')
const helmet = require('helmet')
const path = require('path')

let appVersion = 'v.0.0.3'

var app = express()

app.use(helmet({
    frameguard: false
}))

function allowCrossDomain(req, res, next) {
    let originHost = req.headers.origin || req.headers.host
    res.header('Access-Control-Allow-Origin', originHost)
    res.header('Access-Control-Allow-Methods', '*')
    res.header('Access-Control-Allow-Headers', 'Content-Type')
    res.header('Access-Control-Allow-Credentials', 'true')
    next()
}

app.use(allowCrossDomain)
app.use(cookieParser())
app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));

app.use('/static', express.static('./frontend'))

let noCache = false
if (process.env.LOCATION_MODE == 'local') {
    noCache = true
}


// PAGES
app.get('/', async (req, res) => {
    try {
        res.send('API server is running!')
    } catch (err) {
        console.log('error', err)
    }
})

app.listen(process.env.PORT || 3333)
