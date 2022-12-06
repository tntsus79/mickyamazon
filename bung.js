const http = require('http');
const url = require('url');
const express = require('express');
const multer  = require('multer');
const mysql = require('mysql2');
const { check,checkSchema ,validationResult } = require('express-validator');
const { request } = require('http');
const { response } = require('express');



const app = express();
const upload = multer()
const port = 80 //Default port to http server
const connection = mysql.createConnection({
    host: "bsu-gimm260-fall-2021.cwtgn0g8zxfm.us-west-2.rds.amazonaws.com",
    user: "MylesHolley",
    password: "UCK2sEht0Hry8vqIsa7nnODQ58f012KOCx7",
    database: 'MylesHolley'
});

app.post('/filters/', upload.none(), (request,response)=>{
    const getParameters = url.parse(request.url, true).query;
    let selectsql = 'SELECT * FROM `alexa_character`';
    console.log(selectsql);
connection.query(selectsql, (error, result,)=> {


  //Return response
  if (error)  {
    console.log(error);
    return response
        .status(500) //Error code when something goes wrong with the server
        .setHeader('Access-Control-Allow-Origin', '*') //Prevent CORS error
        .json({message: 'Something went wrong with the server.'});
} else {
    //Default response object
    response
        .setHeader('Access-Control-Allow-Origin', '*') //Prevent CORS error
        .json({message: 'Form submission was succesful!',
              data: result
            });
  }})
} )
app.listen(port, () => {
    console.log(`Application listening at http://localhost:${port}`);
  });
  
  