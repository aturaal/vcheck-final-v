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
const database = require('../database');
const env = require('dotenv')
env.config();



const SECRET = process.env.JWT



const verifyjwt = function(req , res , next) {
   if(req.headers.cookie){
     if(req.headers.cookie.split("=")[1]){
        const [,token] = req.headers.cookie.split('=')
        try {
           const decodedToken = jwt.verify(token, process.env.JWT)
           next();
        } catch (error) {
           res.status(401).json({error: "Unauthorized User!"})
        } 
     }else{
         res.status(401).json({error: "Unauthorized User!"})
     }
   }else{
         res.status(401).json({error: "Unauthorized User!"})
   }
   
 }



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
                jwt.sign(mail, SECRET, { expiresIn: '7d' }, (error, token) => {
                   res.cookie('token', token, { httpOnly: true , sameSite: 'strict' });
                   return  res.status(200).json({token})
               
               })

            }
         })
      }
   })
})

 module.exports = {  router , verifyjwt }



