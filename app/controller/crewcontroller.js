const db = require('../config/db.config.js');
const config = require('../config/config.js');
var Sequelize = require('sequelize');

const Crew = db.crew;

// const Op = db.Sequelize.Op;

// var jwt = require('jsonwebtoken');
// var bcrypt = require('bcryptjs');


exports.createCrew = (req, res) => {	
	// Save Crew to Database
	console.log("Processing func -> createcrew");
	Crew.create({
		name: req.body.name,
        phone: req.body.phone,
        email: req.body.email,
        license: req.body.license,
        address: req.body.address,
        photo: req.body.photo,
		info: req.body.info,
		experience: req.body.experience,  
	})
	.then(() => {
		res.send("Crew registered successfully!");
    })		
	.catch(err => {
		res.status(500).send("Error -> " + err);
	})
}

// exports.getAllCrew = (req, res) => {	
	
// 	Crew.findAll()
// 	.then(crew => {
// 		res.status(200).json({
// 			"description": "User Content Page",
// 			"crew": crew
// 		});
// 	})	
// 	.catch(err => {
// 		res.status(500).send("Error -> " + err);
// 	})
// }

exports.getAllCrew = (req, res) => {	
	
	db.sequelize.query("SELECT * FROM `crews`", { type: db.sequelize.QueryTypes.SELECT})
  .then(crew => {
				res.status(200).json({
					"description": "User Content Page",
					"crew": crew
				});
			})	
			.catch(err => {
				res.status(500).send("Error -> " + err);
			})
}

exports.updateCrew = (req, res) => {
	console.log("Update Crew");
	// console.log(req.params.userid);
	Crew.update(
		{
			// title: req.body.title
			name: req.body.name,
			phone: req.body.phone,
			email: req.body.email,
			license: req.body.license,
			address: req.body.address,
			photo: req.body.photo,
			info: req.body.info,
			experience: req.body.experience,  
		},
		{returning: true, where: {id: req.params.crewid} }
	  )
	  .then(crew => {
			// console.log(res.body)
			res.status(200).json({
				"description": "Crew Updated succesfully",
				// "cabs": res.body
			});
		})	
		.catch(err => {
			res.status(500).send("Error -> " + err);
		})
}

exports.getCrewById = (req, res) => {
	// console.log("Update User");
	// console.log(req.params.userid);
	
	Crew.findAll({
		where: {
			id: req.params.crewid
		}
	}).then(crew => {
		// console.log("User Details::",user)
		res.status(200).json({
			"description": "Crew Content Page",
			"crew": crew
		});
		if (!crew) {
			return res.status(404).json ( {reason: 'User Not Found.'});
		}		
	}).catch(err => {
		res.status(500).json({reason:err});
	});

}