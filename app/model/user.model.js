module.exports = (sequelize, Sequelize) => {
	const User = sequelize.define('users', {
	  firstname: {
		  type: Sequelize.STRING
		},
		lastname: {
		  type: Sequelize.STRING
		},
		phone: {
		  type: Sequelize.STRING
	  },
	  email: {
		  type: Sequelize.STRING
	  },
	  password: {
		  type: Sequelize.STRING
		},
		state: {
		  type: Sequelize.STRING
		},
		city: {
		  type: Sequelize.STRING
		},
		pin: {
		  type: Sequelize.STRING
		},
		address: {
		  type: Sequelize.STRING
		},
		driving: {
		  type: Sequelize.STRING
		},
		license: {
		  type: Sequelize.STRING
		}
		
	});
	return User;
}