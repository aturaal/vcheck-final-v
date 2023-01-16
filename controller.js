const express = require('express');
const controller = express.Router()
const knex = require('knex')
const path = require('node:path');
const { json } = require('express');
const multer = require('multer')
const upload = multer();
const fs = require('node:fs');
const papa = require('papaparse');
const csvFilePath = 'files/csvfile.csv';
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const database = require('./database');
const {verifyjwt} = require('./admin-panel/login')
controller.use(
    bodyParser.json({
      limit: '100MB',
    }),
  );


controller.get('/api/v1/results', verifyjwt , async (req, res) => {

    database('vouchers')
        .select('created_at', 'updated_at', 'email', 'voucher_Code')
        .whereIn('voucher_Code' , results.map(item => item.voucher_Code))
        .then((bulkVouchers) => {
          res.send(bulkVouchers);
        })
    });
    controller.get('/api/v1/:voucher_Code' , verifyjwt , async (request, res) => {
    const { voucher_Code } = request.params;
    data('vouchers')
      .where({ voucher_Code: voucher_Code })
      .then((voucher) => {
        res.status(200).send(voucher);
      });
  });
  
  controller.get('/' , verifyjwt, (req, res) => {
  console.log(req.body)
  console.log(res.body)
   
    res.sendFile('html.html', { root: __dirname });
  });
  
  controller.post('/upload', verifyjwt , upload.any('files', 10), (request, res) => {
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
  
  
  
  controller.get('/deneme' , (req, res) => {
    res.send(results);
  });

  module.exports = controller;