
const knex = require('knex')

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
  
  module.exports = database;