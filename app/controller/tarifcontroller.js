const db = require('../config/db.config.js');
const config = require('../config/config.js');
const Tarif = db.tarif;

// const Op = db.Sequelize.Op;

// var jwt = require('jsonwebtoken');
// var bcrypt = require('bcryptjs');


exports.createTarif = (req, res) => {	
	// Save Tarif to Database
	console.log("Processing func -> createtarif");
	Tarif.create({
		name: req.body.name,
        description: req.body.description,
        amountday: req.body.amountday,
        amounthour: req.body.amounthour,
        nightcharge: req.body.nightcharge,
        cabtype: req.body.cabtype,
        status: req.body.status 
	})
	.then(() => {
		res.send("Tarif inserted successfully!");
    })		
	.catch(err => {
		res.status(500).send("Error -> " + err);
	})
}

exports.getAllTarif = (req, res) => {	
	
	Tarif.findAll()
	.then(tarif => {
		res.status(200).json({
			"description": "Tarif Content Page",
			"tarif": tarif
		});
	})	
	.catch(err => {
		res.status(500).send("Error -> " + err);
	})
}


exports.updateTarif = (req, res) => {
	console.log("Update Tarif");
	// console.log(req.params.userid);
	Tarif.update(
		{
			// title: req.body.title
            name: req.body.name,
            description: req.body.description,
            amountday: req.body.amountday,
            amounthour: req.body.amounthour,
            nightcharge: req.body.nightcharge,
            cabtype: req.body.cabtype,
            status: req.body.status  
		},
		{returning: true, where: {id: req.params.tarifid} }
	  )
	  .then(tarif => {
			// console.log(res.body)
			res.status(200).json({
				"description": "Tarif Updated succesfully",
				// "tarif": tarif
			});
		})	
		.catch(err => {
			res.status(500).send("Error -> " + err);
		})
}

exports.getTarifById = (req, res) => {
	// console.log("Update User");
	// console.log(req.params.userid);
	
	Tarif.findAll({
		where: {
			id: req.params.tarifid
		}
	}).then(tarif => {
		// console.log("User Details::",user)
		res.status(200).json({
			"description": "Tarif Content Page",
			"tarif": tarif
		});
		if (!tarif) {
			return res.status(404).json ( {reason: 'Tarif Not Found.'});
		}		
	}).catch(err => {
		res.status(500).json({reason:err});
	});

}

exports.getTarifByCabType = (req, res) => {
	// console.log("Update User");
	// console.log(req.params.userid);
	
	Tarif.findAll({
		where: {
			cabtype: req.params.cabtype
		}
	}).then(tarif => {
		// console.log("User Details::",user)
		res.status(200).json({
			"description": "Tarif Content Page",
			"tarif": tarif
		});
		if (!tarif) {
			return res.status(404).json ( {reason: 'Tarif Not Found.'});
		}		
	}).catch(err => {
		res.status(500).json({reason:err});
	});

}
