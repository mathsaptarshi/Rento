const db = require('../config/db.config.js');
const config = require('../config/config.js');
const Admin = db.admin;
const Role = db.role;

const Op = db.Sequelize.Op;

var jwt = require('jsonwebtoken');
var bcrypt = require('bcryptjs');




exports.signin = (req, res) => {
	console.log("Processing func -> Admin Sign-In");
	// console.log(req.body.email);
	
	Admin.findOne({
		where: {
			email: req.body.email
		}
	}).then(admin => {
		if (!admin) {
			return res.status(404).json ( {reason: 'User Not Found.'});
		}

		var passwordIsValid = bcrypt.compareSync(req.body.password, admin.password);
		if (!passwordIsValid) {
			return res.status(401).json({ auth: "false", accessToken: "null", reason: "Invalid Password!" });
		}
		
		var token = jwt.sign({ admin: admin }, config.secret, {
		  expiresIn: 86400 // expires in 24 hours
		});
		// this.sentSMS();
		res.status(200).json({ auth: "true", accessToken: token });
		
	}).catch(err => {
		res.status(500).json({auth:"false1",reason: err});
	});
}



exports.signup = (req, res) => {
	// Save User to Database
	console.log("Processing func ->Admin SignUp");
	
	Admin.create({
		
		name: req.body.name,
		phone: req.body.phone,
		email: req.body.email,
		password: bcrypt.hashSync(req.body.password, 8)

	})
	.then(admin => {
		Role.findAll({
		  where: {
			name: {
			  [Op.or]: req.body.roles
			}
		  }
		})
		// .then(roles => {
		// 	user.setRoles(roles).then(() => {
		// 		res.send("Admin registered successfully!");
        //     });
		// })
		.catch(err => {
			res.status(500).json({status:"false",reason:err});
		});
	})
	.catch(err => {
		res.status(500).json({status:"false",reason:err});
	})
}
