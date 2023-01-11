const express = require('express');
const app = express();
const path = require('node:path');
const multer = require('multer');
const fs = require('node:fs');
const { json } = require('express');
let results = [];
const upload = multer();
const papa = require('papaparse');
const csvFilePath = 'files/csvfile.csv';
const { emitWarning, nextTick } = require('node:process');
const knex = require('knex');
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const { createSecretKey } = require('node:crypto');
const { JsonWebTokenError } = require('jsonwebtoken');
const checkResults = [];
const jwt = require('jsonwebtoken');
const {verifyjwt , router} = require('./admin-panel/login.js');
const SECRET = "twojejmatki"



app.use(
  bodyParser.json({
    limit: '100MB',
  }),
);

app.use(router)

app.use(bodyParser.urlencoded({ extended: false }));

const server = require('node:http').createServer(app);

const database = knex({
  client: 'postgresql',
  connection: {
    host: 'localhost',
    user: 'postgres',
    password: 'annen12',
    database: 'postgres',
    port: '5432',
  },
  useNullAsDefault: true,
});

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

app.get('/api/v1/results', async (req, res) => {

  database('vouchers')
      .select('created_at', 'updated_at', 'email', 'voucher_Code')
      .whereIn('voucher_Code' , results.map(item => item.voucher_Code))
      .then((bulkVouchers) => {
        res.send(bulkVouchers);
  
      })
  });
app.get('/api/v1/:voucher_Code' , async (request, res) => {
  const { voucher_Code } = request.params;
  database('vouchers')
    .where({ voucher_Code: voucher_Code })
    .then((voucher) => {
      res.status(200).send(voucher);
    });
});

app.get('/' ,  (req, res) => {
console.log(req.body)
console.log(res.body)
 
  res.sendFile('html.html', { root: __dirname });
});

app.post('/upload', upload.any('files', 10), (request, res) => {
  const files = request.files;

  files.map((file, index) => {
    let csv = Buffer.from(files[0].buffer, 'base64').toString('ascii');
    fs.writeFile(
      'files/csvfile.csv',
      files[0].buffer,
      'utf8',
      function (error, files) {
        if (error) console.log('error', error);
        return res.json('lol')
      },
    );

    const content = file.buffer.toString('utf-8');

    papa.parse(content, {
      header: true,
      complete: async ({data}) => {
        results = data;
      }, 
    });
  });
});



app.get('/deneme' , (req, res) => {
  res.send(results);
});

app.listen(3000)