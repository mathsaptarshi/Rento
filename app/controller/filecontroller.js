const db = require('../config/db.config.js');
const config = require('../config/config.js');
const File = db.file;
multer = require('multer');
bodyParser=require("body-parser");
path=require("path");
var fs = require('fs');
// const Op = db.Sequelize.Op;

// var jwt = require('jsonwebtoken');
// var bcrypt = require('bcryptjs');



// exports.uploadFile1 = (req, res) => {
//     const DIR = './uploads';	
//     console.log("Processing func -> uploadFile");
//     console.log("Request data:::",req.formdata);
//     let file=req.image;
//     let storage = multer.diskStorage({
//         destination: function (req, file, callback) {
//           callback(null, DIR);
//         },
//         filename: function (req, file, cb) {
//           cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
//         }
//     });
     
//     let upload = multer({storage: storage});
//     if (!req.file) {
//         console.log("No file received");
//           message = "Error! in image upload."
//         res.send({message: message, status:'danger'});
    
//       } else {
//         console.log('file received');
//         console.log(req);
//         var sql = "INSERT INTO `file`(`name`, `type`, `size`) VALUES ('" + req.file.filename + "', '"+req.file.mimetype+"', '"+req.file.size+"')";
//                 var query = db.query(sql, function(err, result) {
//                    console.log('inserted data');
//                 });
//         message = "Successfully! uploaded";
//         res.send({message: message, status:'success'});

//       }


	// Crew.findAll()
	// .then(crew => {
	// 	res.status(200).json({
	// 		"description": "User Content Page",
	// 		"crew": crew
	// 	});
	// })	
	// .catch(err => {
	// 	res.status(500).send("Error -> " + err);
	// })
// }




exports.uploadFile = (req, res) => {	    
  const storage = multer.diskStorage({
    destination: (req, file, callback) => {
        callback(null, ('./uploads'));
    },
    filename: (req, file, callback) => {
        callback(null, Date.now() + '-' + file.originalname);
    }
  }); 
  const upload = multer({storage: storage}).any('file');        

  upload(req, res, (err) => {
      if (err) {
          return res.status(400).send({
              message: helper.getErrorMessage(err)
          });
      }
      else{
        res.status(200).json(results);
      }
      const results = req.files.map((file) => {
            res.status(200).json({results:"Image Upload Successful!"});
          return {
              mediaName: file.filename,
              origMediaName: file.originalname,
              // mediaSource: 'http://' + req.headers.host + config.const.path + file.filename
          }          
      });            
      // console.log(storage[0].origMediaName);            
      // console.log(results[0].mediaName);
      // console.log(results[0].origMediaName);
      res.status(200).json(results);
  });   
}


exports.createFile = (name,description,type,size,req, res) => {	
	// Save Booking to Database
	console.log("Processing func -> createFile");
	File.create({
		// name: req.body.name,
        // description: req.body.phone,
        // type: req.body.email,
        // size: req.body.license
        name: name,
        description: description,
        type: type,
        size: size
	})
	.then(() => {
		res.send("File submited successful!");
    })		
	.catch(err => {
		res.status(500).send("Error -> " + err);
	})
}
