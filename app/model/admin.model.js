module.exports = (sequelize, Sequelize) => {
	const Admin = sequelize.define('admins', {
	    name: {
		  type: Sequelize.STRING
		},
		email: {
		  type: Sequelize.STRING
		},
		phone: {
		  type: Sequelize.STRING
	    },
	    password: {
		  type: Sequelize.STRING
		}
		
	});
	return Admin;
}