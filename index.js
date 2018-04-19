var express = require('express');
var app = express();

var pg = require('pg');

var config = {
    user: 'postgres',
    database: 'QLHocSinh', 
    password: '1234', 
    port: 5432, 
    max: 10, // max number of connection can be open to database
    idleTimeoutMillis: 30000, // how long a client is allowed to remain idle before being closed
};

app.get('/', (req, res) => {
     res.sendfile(__dirname + '/dssv.html')
})

	
var pool = new pg.Pool(config);
app.get('/load', (req, res)=>{
    pool.connect(function(err,client,done) {
        if(err){
            console.log("not able to get connection "+ err);
            res.status(400).send(err);
        } 
        client.query(`SELECT h.mahs, h.hoten, h.diachi, l.tenlop 
                    FROM hocsinh h, lop l 
                    WHERE h.malop = l.malop
                    ORDER BY mahs ASC `
        ,function(err,result) {
           //call `done()` to release the client back to the pool
            done(); 
            if(err){
                res.end();
                console.log(err);
                res.status(400).send(err)

            }
            res.json(result.rows)
        });
     });
})

app.listen(3000, () => console.log("Success"))