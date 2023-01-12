const express = require('express');
const app = express();
const { json } = require('express');
let results = [];
const { emitWarning, nextTick } = require('node:process');
const knex = require('knex');
const { Pool } = require('pg');
const bodyParser = require('body-parser');
const { createSecretKey } = require('node:crypto');
const { JsonWebTokenError } = require('jsonwebtoken');
const jwt = require('jsonwebtoken');
const {verifyjwt , router} = require('./admin-panel/login.js');
const controller = require('./controller')
app.use(controller)




app.use(router)
app.use(bodyParser.urlencoded({ extended: false }));

const server = require('node:http').createServer(app);


const allVoucher = (request, res) => {
  database
    .select('created_at', 'updated_at', 'email', 'voucher_Code')
    .from('vouchers')
    .then((data) => {
      res.send(data);
    })
    .catch((error) => {
      res.status(500).send({
        message: error.message || 'Some error occurred.',
      });
    });
};




app.listen(3000)

