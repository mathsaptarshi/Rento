module.exports = (sequelize, Sequelize) => {
	const Booking = sequelize.define('bookings', {
    userid: {
		type: Sequelize.INTEGER
    },
    tarifid: {
		type: Sequelize.INTEGER
	},
	bookingcode: {
		type: Sequelize.STRING
    },
    bookingtype: {
		type: Sequelize.STRING
	},
	cabid: {
		type: Sequelize.INTEGER
	},
	crewid: {
		type: Sequelize.INTEGER
    },
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
	pickuplocation: {
		type: Sequelize.STRING
    },
    destination: {
        type: Sequelize.STRING
    },
    days: {
        type: Sequelize.INTEGER
    },
    hours: {
        type: Sequelize.INTEGER
    },
    bookingamount: {
        type: Sequelize.STRING
    },
    status: {
        type: Sequelize.STRING
    },
    ip: {
        type: Sequelize.STRING
    }
});	
return Booking;
}