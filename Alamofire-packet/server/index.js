const express = require('express');
const app = express();
app.use(express.static('upload/'));

// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// pg
const { Pool } = require('pg');
var pool = null;
function connectPool() {
    pool = new Pool({
        user: 'postgres',
        host: 'localhost',
        database: 'ios2210',
        password: '123',
        port: 5432,
    });
}

// multer
const multer = require('multer');
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'upload/')
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname)
    }
})
function fileFilter(req, file, cb) {

    // if (file.mimetype !== 'image/jpeg') {
    //     return cb(new Error('goes wrong on the mimetype'), false);
    // } else {
    //     return cb(null, true);
    // }

    if (file.mimetype !== 'image/jpeg') {
        req.fileValidationError = 'goes wrong on the mimetype';
        return cb(null, false);
    }
    cb(null, true)

}

const upload = multer({ storage: storage, fileFilter: fileFilter });

app.post('/single', upload.single('avatar'), function (req, res, next) {

    if (req.fileValidationError) {
        return res.end(req.fileValidationError);
    }
    res.json('OK');
    // const avatar = req.file;
    // connectPool();
    // pool.query(`insert into "Pictures" ("NAME") values ('${avatar.filename}')`, function (err, result) {
    //     console.log(result);
    //     res.json(result.rowCount);
    // });
    // pool.end();
});

app.post('/array', upload.array('photos', 10), function (req, res, next) {
    const photos = req.files;
    // connectPool();
    // photos.forEach(function (img) {
    //     img.filename;
        // pool.query(`insert into "Pictures" ("NAME") values ('${img.filename}')`, function (err, result) {
        //     console.log(result);
        //     res.json(result.rowCount);
        // });
    // });
    res.json({result: true, message: 'Tai len thanh cong', data: photos, code: res.statusCode});
    // pool.end();
});

var cpUpload = upload.fields([{ name: 'avatar', maxCount: 1 }, { name: 'gallery', maxCount: 8 }])
app.post('/object', cpUpload, function (req, res, next) {
    const object = req.files;
    res.json(object);
})

app.post('/test', function (req, res) {
    const name = req.body.name;
    res.json({ result: true, message: 'Done', data: name });
});

app.listen(3000);