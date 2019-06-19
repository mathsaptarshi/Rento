const db = require('../config/db.config.js');
const config = require('../config/config.js');
const Booking = db.booking;

// const Op = db.Sequelize.Op;

// var jwt = require('jsonwebtoken');
// var bcrypt = require('bcryptjs');


exports.createBooking = (req, res) => {	
	// Save Booking to Database
	console.log("Processing func -> createBooking");
	Booking.create({
		userid: req.body.userid,
    tarifid: req.body.tarifid,
		bookingcode: req.body.bookingcode,
		bookingtype: req.body.bookingtype,
    cabid: req.body.cabid,
    crewid: req.body.crewid,
    name: req.body.name,
		phone: req.body.phone,
		email: req.body.email,
		license: req.body.license,
    address: req.body.address,
    pickuplocation: req.body.pickuplocation,
		destination: req.body.destination,
		days:req.body.days,
    hours: req.body.hours,
    bookingamount: req.body.bookingamount,
		status: req.body.status,
		ip: req.body.ip    
	})
	.then(() => {
		res.send("Booking successful!");
    })		
	.catch(err => {
		res.status(500).send("Error -> " + err);
	})
}


exports.getAllBooking = (req, res) => {	
	Booking.findAll()
	.then(booking => {
		res.status(200).json({
			"description": "Booking Content Page",
			"booking": booking
		});
	})	
	.catch(err => {
		res.status(500).send("Error -> " + err);
	})
}


exports.updateBooking = (req, res) => {
	console.log("Update Booking");
	// console.log(req.params.userid);
	Booking.update(
		{
			// title: req.body.title
			userid: req.body.userid,
			tarifid: req.body.tarifid,
			bookingcode: req.body.bookingcode,
			bookingtype: req.body.bookingtype,
			cabid: req.body.cabid,
			crewid: req.body.crewid,
			name: req.body.name,
			phone: req.body.phone,
			email: req.body.email,
			license: req.body.license,
			address: req.body.address,
			pickuplocation: req.body.pickuplocation,
			destination: req.body.destination,
			days:req.body.days,
			hours: req.body.hours,
			bookingamount: req.body.bookingamount,
			status: req.body.status,
			ip: req.body.ip, 
		},
		{returning: true, where: {id: req.params.crewid} }
	  )
	  .then(booking => {
			// console.log(res.body)
			res.status(200).json({
				"description": "Booking Updated succesfully",
				// "cabs": res.body
			});
		})	
		.catch(err => {
			res.status(500).send("Error -> " + err);
		})
}

exports.getBookingById = (req, res) => {
	// console.log("Update User");
	// console.log(req.params.userid);
	
	Booking.findAll({
		where: {
			id: req.params.bookingid
		}
	}).then(booking => {
		// console.log("User Details::",user)
		res.status(200).json({
			"description": "Booking Content Page",
			"booking": booking
		});
		if (!booking) {
			return res.status(404).json ( {reason: 'User Not Found.'});
		}		
	}).catch(err => {
		res.status(500).json({reason:err});
	});

}