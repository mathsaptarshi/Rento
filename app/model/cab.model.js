module.exports = (sequelize, Sequelize) => {
	const Cab = sequelize.define('cabs', {
	regno: {
		type: Sequelize.STRING
    },
  company: {
		type: Sequelize.STRING
	},
	model: {
		type: Sequelize.STRING
	},
	type: {
		type: Sequelize.STRING
	},
	state: {
		type: Sequelize.STRING
  },
  district: {
    type: Sequelize.STRING
  },
  postalcode: {
    type: Sequelize.STRING
  },    
	});
	
	return Cab;
}