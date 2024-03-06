import express, { Request, Response } from "express";

const app = express();
const port = 4000;

app.get("/",(req:Request, res:Response)=>{
    return res.json({
        status: "success",
        message: "its running.."
    })
})

app.listen(port, ()=>{
    console.log(`Server is listening on ${port}`);
});