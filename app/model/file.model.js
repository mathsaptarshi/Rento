module.exports = (sequelize, Sequelize) => {
	const File = sequelize.define('file', {
	name: {
		type: Sequelize.STRING
    },
    description: {
		type: Sequelize.STRING
	},
	type: {
		type: Sequelize.STRING
	},
	size: {
		type: Sequelize.STRING
	}    
	});	
	return File;
}