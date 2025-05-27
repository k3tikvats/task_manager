// we will have our own express router

import {Router}from "express";


const authRouter = Router();



authRouter.get("/", (req, res) => {
    res.send("holla, i'm speaking from auth!"); //when we go to the root url it will send this message as a response
});
//i will have to do localhost:8000/auth to see this message
export default authRouter;