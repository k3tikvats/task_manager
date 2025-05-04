import express from  "express";

//in node we had to do this-
//const express = require('express'); and only then it would work
//but here we are using typescript so we can use import express from 'express';

const app = express(); //creating an instance of express(initializing express)this app is of the type typsescript

app.get("/", (req, res) => {
    res.send("Welcome to my app"); //when we go to the root url it will send this message as a response
}
); //this is a get request to the root url and when we go to this url it will send this message as a response

app.listen(8000, () => {
    console.log("Server started on port 8000.server start ho chuka h"); //listening to port 8000 and when the server starts it will print this message in the console
}); //listening to port 3000 and when the server starts it will print this message in the console
