const express = require('express');
const {gzip, ungzip} = require('node-gzip');
const fileUpload = require('express-fileupload')

const app = express();
const router = express.Router();
app.use(express.json());
app.use(fileUpload());


router.post('/upload', async (req, res)=>  {
    const {  zip } = req.body;
    console.log(zip);
    res.send(zip);
    const decompressed = await ungzip(zip);
    res.send(decompressed);
});

router.post('/uploadfile', async (req, res)=>  {
    let imag = req.files.file
});


app.use(router);
app.listen(3000, ()=>{
    console.log('Server Connection');
});