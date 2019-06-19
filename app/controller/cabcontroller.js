const db = require('../config/db.config.js');
const config = require('../config/config.js');
const Cab = db.cab;

// const Op = db.Sequelize.Op;

// var jwt = require('jsonwebtoken');
// var bcrypt = require('bcryptjs');

exports.createCab = (req, res) => {	
	// Save Cab Details to Database
	console.log("Processing func -> createcab");
	Cab.create({
				regno: req.body.regno,
        company: req.body.company,
        model: req.body.model,
        type: req.body.type,
        state: req.body.state,
        district: req.body.district,
        postalcode: req.body.postalcode,        
	})
	.then(() => {
		res.send("Cab registered successfully!");
    })		
	.catch(err => {
		res.status(500).send("Error -> " + err);
	})
}

exports.getAllCab = (req, res) => {	
	Cab.findAll()
	.then(cabs => {
		res.status(200).json({
			"description": "Cab Details Page",
			"cabs": cabs
		});
	})	
	.catch(err => {
		res.status(500).send("Error -> " + err);
	})
}

exports.getCabById = (req, res) => {
	// console.log("Update User");
	// console.log(req.params.userid);
	
	Cab.findAll({
		where: {
			id: req.params.cabid
		}
	}).then(cab => {
		// console.log("User Details::",user)
		res.status(200).json({
			"description": "User Content Page",
			"cabs": cab
		});
		if (!cab) {
			return res.status(404).json ( {reason: 'User Not Found.'});
		}		
	}).catch(err => {
		res.status(500).json({reason:err});
	});

}

exports.updateCab = (req, res) => {
	console.log("Update Cab");
	// console.log(req.params.userid);
	Cab.update(
		{
			// title: req.body.title
			regno: req.body.regno,
			company: req.body.company,
			model: req.body.model,
			type: req.body.type,
			state: req.body.state,
			district: req.body.district,
			postalcode: req.body.postalcode,  
		},
		{returning: true, where: {id: req.params.cabid} }
	  )
	  .then(cabs => {
			// console.log(res.body)
			res.status(200).json({
				"description": "Cab Updated succesfully",
				// "cabs": res.body
			});
		})	
		.catch(err => {
			res.status(500).send("Error -> " + err);
		})
}