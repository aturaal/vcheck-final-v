const knex = require('knex');
const router = require('express').Router();
const bodyParser = require('body-parser');
const cors = require('cors')
router.use(cors())
const bcrypt = require('bcrypt'); 
router.use(bodyParser.json())
const cookieParser = require('cookie-parser')
router.use(cookieParser())
const path = require('path')

const jwt = require('jsonwebtoken');
const { response } = require('express');




const getTokenFromHeader = (res) => {
   console.log(res.body)
    const authHeader = res.headers['authorization']
   if(!authHeader) {
      throw new Error('missing authorization header')
   }
    const [, token] = authHeader.split(' ')
    return token;
}



const verifyjwt = function(req , res , next) {


        const token = getTokenFromHeader(res)
const decodedToken = jwt.verify(token, "twojejmatki")
next();
}


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


router.post("/register", (req, res, next) => {
    bcrypt.hash(req.body.password, 10)
    .then(hashedPassword => {
       return database("admins1").insert({
          mail: req.body.mail,
          password: hashedPassword
       })
       .then(registeredUserData => {
          res.json("Successfully Registered!")
       })
       .catch(error => next(error))
    })
 })



const SECRET = "twojejmatki"

router.get('/login' , (req, res) => {
   res.sendFile('login.html', { root: __dirname });
})


router.post("/login", (req, res, next) => {
    database("admins1")
    .where({mail: req.body.mail})
    .first()
    .then(mail => {
       if(!mail){
         res.status(401).json({
             error: "Wrong credentails"
          })
       }else{
          return bcrypt
          .compare(req.body.password, mail.password)
          .then(isAuthenticated => {
             if(!isAuthenticated){
                res.status(401).json({
                   error: "Unauthorized User!"
                })
             }else{
                 jwt.sign(mail, SECRET, (error, token) => {
                 return  res.status(200).json({token})
                   
                })
             }
          })
       }
    })
 })

 module.exports = {  router , verifyjwt }



