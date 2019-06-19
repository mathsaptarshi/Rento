module.exports = (sequelize, Sequelize) => {
	const Crew = sequelize.define('crew', {
	name: {
		type: Sequelize.STRING
    },
    phone: {
		type: Sequelize.STRING
	},
	email: {
		type: Sequelize.STRING
	},
	license: {
		type: Sequelize.STRING
	},
	address: {
		type: Sequelize.STRING
    },
    photo: {
        type: Sequelize.STRING
    },
    info: {
        type: Sequelize.STRING
    },
    experience: {
        type: Sequelize.INTEGER
    },          
	});
	
	return Crew;
}