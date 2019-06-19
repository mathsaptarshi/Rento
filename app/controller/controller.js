const db = require('../config/db.config.js');
const config = require('../config/config.js');
const User = db.user;
const Role = db.role;

const Op = db.Sequelize.Op;

var jwt = require('jsonwebtoken');
var bcrypt = require('bcryptjs');

exports.signup = (req, res) => {
	// Save User to Database
	console.log("Processing func -> SignUp");
	
	User.create({
		firstname: req.body.firstname,
		lastname: req.body.lastname,
		phone: req.body.phone,
		email: req.body.email,
		password: bcrypt.hashSync(req.body.password, 8),
		state: req.body.state,
		city: req.body.city,
		pin: req.body.pin,
		address: req.body.address,
		driving: req.body.driving,
		license: req.body.license
	})
	.then(user => {
		Role.findAll({
		  where: {
			name: {
			  [Op.or]: req.body.roles
			}
		  }
		})
		.then(roles => {
			user.setRoles(roles).then(() => {
				res.send("User registered successfully!");
            });
		})
		.catch(err => {
			res.status(500).json({reason:err});
		});
	})
	.catch(err => {
		res.status(500).json({reason:err});
	})
}



exports.signin = (req, res) => {
	console.log("Processing func -> Sign-In");
	// console.log(req.body.email);
	
	User.findOne({
		where: {
			email: req.body.email
		}
	}).then(user => {
		if (!user) {
			return res.status(404).json ( {reason: 'User Not Found.'});
		}

		var passwordIsValid = bcrypt.compareSync(req.body.password, user.password);
		if (!passwordIsValid) {
			return res.status(401).json({ auth: "false", accessToken: "null", reason: "Invalid Password!" });
		}
		
		var token = jwt.sign({ user: user }, config.secret, {
		  expiresIn: 86400 // expires in 24 hours
		});
		// this.sentSMS();
		res.status(200).json({ auth: "true", accessToken: token });
		
	}).catch(err => {
		res.status(500).json({auth:"false",reason: err});
	});
}


exports.updateUser = (req, res) => {
	// console.log("Update User");
	// console.log(req.params.userid);
	
	// User.findAll({
	// 	where: {
	// 		id: req.params.userid
	// 	}
	// }).then(user => {
	// 	console.log("User Details::",user)
	// 	if (!user) {
	// 		return res.status(404).send ( {reason: 'User Not Found.'});
	// 	}		
	// }).catch(err => {
	// 	res.status(500).send('Error -> ' + err);
	// });

	User.update(
		{
			// title: req.body.title
			firstname: req.body.firstname,
			lastname: req.body.lastname,
			phone: req.body.phone,
			email: req.body.email,
			password: bcrypt.hashSync(req.body.password, 8),
			state: req.body.state,
			city: req.body.city,
			pin: req.body.pin,
			address: req.body.address,
			driving: req.body.driving,
			license: req.body.license
		},
		{returning: true, where: {id: req.params.userid} }
	  )
	  .then(function([ rowsUpdate, [updatedBook] ]) {
		res.json(updatedBook)
	  })
	  .catch(err => {
			res.status(500).json({reason: err});
		});
}


exports.getUserById = (req, res) => {
	// console.log("Update User");
	// console.log(req.params.userid);
	
	User.findAll({
		where: {
			id: req.params.userid
		}
	}).then(user => {
		// console.log("User Details::",user)
		res.status(200).json({
			"description": "User Content Page",
			"crew": user
		});
		if (!user) {
			return res.status(404).json ( {reason: 'User Not Found.'});
		}		
	}).catch(err => {
		res.status(500).json({reason:err});
	});

}




exports.userContent = (req, res) => {
	User.findOne({
		where: {id: req.userId},
		attributes: ['name', 'username', 'email'],
		include: [{
			model: Role,
			attributes: ['id', 'name'],
			through: {
				attributes: ['userId', 'roleId'],
			}
		}]
	}).then(user => {
		res.status(200).json({
			"description": "User Content Page",
			"user": user
		});
	}).catch(err => {
		res.status(500).json({
			"description": "Can not access User Page",
			"error": err
		});
	})
}

exports.adminBoard = (req, res) => {
	User.findOne({
		where: {id: req.userId},
		attributes: ['name', 'username', 'email'],
		include: [{
			model: Role,
			attributes: ['id', 'name'],
			through: {
				attributes: ['userId', 'roleId'],
			}
		}]
	}).then(user => {
		res.status(200).json({
			"description": "Admin Board",
			"user": user
		});
	}).catch(err => {
		res.status(500).json({
			"description": "Can not access Admin Board",
			"error": err
		});
	})
}

exports.managementBoard = (req, res) => {
	User.findOne({
		where: {id: req.userId},
		attributes: ['name', 'username', 'email'],
		include: [{
			model: Role,
			attributes: ['id', 'name'],
			through: {
				attributes: ['userId', 'roleId'],
			}
		}]
	}).then(user => {
		res.status(200).json({
			"description": "Management Board",
			"user": user
		});
	}).catch(err => {
		res.status(500).json({
			"description": "Can not access Management Board",
			"error": err
		});
	})
}

exports.sentSMS = () => {
	var http = require('http');
	var urlencode = require('urlencode');
	var msg = urlencode('hello js');
	var toNumber = '08926308294';
	var username = 'saptarshi707@gmail.com';
	var hash = 'Saptarshi707'; // The hash key could be found under Help->All Documentation->Your hash key. Alternatively you can use your Textlocal password in plain text.
	var sender = 'txtlcl';
	var data = 'username=' + username + '&hash=' + hash + '&sender=' + sender + '&numbers=' + toNumber + '&message=' + msg;
	// var data ='&hash=' + hash + '&sender=' + sender + '&numbers=' + toNumber + '&message=' + msg;
	console.log(data)
	var options = {
	host: 'api.textlocal.in', path: '/send?' + data
	};
	callback = function (response) {
	var str = '';//another chunk of data has been recieved, so append it to `str`
	response.on('data', function (chunk) {
		str += chunk;
	});//the whole response has been recieved, so we just print it out here
	response.on('end', function () {
		console.log(str);
	});
	}//console.log('hello js'))
	http.request(options, callback).end();//url encode instalation need to use $ npm install urlencode
}