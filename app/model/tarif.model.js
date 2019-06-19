module.exports = (sequelize, Sequelize) => {
	const Tarif = sequelize.define('tarifs', {
        name: {
            type: Sequelize.STRING
        },
        description: {
            type: Sequelize.STRING
        },
        amountday: {
            type: Sequelize.STRING
        },
        amounthour: {
            type: Sequelize.STRING
        },
        nightcharge: {
            type: Sequelize.STRING
        },
        cabtype: {
            type: Sequelize.STRING
        },
        status: {
            type: Sequelize.STRING
        }   
	});
	
	return Tarif;
}