const verifySignUp = require('./verifySignUp');
const authJwt = require('./verifyJwtToken');

module.exports = function(app) {

	const controller = require('../controller/controller.js');
	const cabcontroller = require('../controller/cabcontroller.js');
	const crewcontroller = require('../controller/crewcontroller.js');
	const filecontroller = require('../controller/filecontroller');
	const admincontroller = require('../controller/admincontroller');
	const tarifcontroller = require('../controller/tarifcontroller');
	const bookingcontroller = require('../controller/bookingcontroller');
	
	// uploadFile
	app.post('/api/file/upload',filecontroller.uploadFile);

	//User Authentication  
	// app.post('/api/auth/signup', [verifySignUp.checkDuplicateUserNameOrEmail, verifySignUp.checkRolesExisted], controller.signup);
	app.post('/api/auth/signup', [verifySignUp.checkDuplicateUserNameOrEmail], controller.signup);
	// app.post('/api/auth/signin',[authJwt.verifyToken] ,controller.signin);
	app.post('/api/auth/signin',controller.signin);
	app.put('/api/auth/userupdate/:userid',controller.updateUser);
	app.get('/api/auth/user/:userid',controller.getUserById);

	//admin
	app.post('/api/admin/signin',admincontroller.signin);
	app.post('/api/admin/signup', admincontroller.signup);
	
	// cab
	app.post('/api/cab/create', cabcontroller.createCab);
	app.get('/api/cab', cabcontroller.getAllCab);
	app.get('/api/cab/getcabbyid/:cabid', cabcontroller.getCabById);
	app.put('/api/cab/cabupdate/:cabid',cabcontroller.updateCab);
	
	//crew
	app.post('/api/crew/create', crewcontroller.createCrew);
	app.get('/api/crew', crewcontroller.getAllCrew);
	app.get('/api/crew/getcrewbyid/:crewid', crewcontroller.getCrewById);
	app.put('/api/crew/crewupdate/:crewid',crewcontroller.updateCrew);
	
	// tarif
	app.post('/api/tarif/create', tarifcontroller.createTarif);
	app.get('/api/tarif', tarifcontroller.getAllTarif);
	app.get('/api/tarif/gettarifbyid/:tarifid', tarifcontroller.getTarifById);
	app.put('/api/tarif/tarifupdate/:tarifid',tarifcontroller.updateTarif);
	app.get('/api/tarif/gettarifbycabtype/:cabtype', tarifcontroller.getTarifByCabType);


	// Booking
	app.post('/api/booking/create', bookingcontroller.createBooking);
	app.get('/api/booking', bookingcontroller.getAllBooking);
	// app.get('/api/booking/getbookingbyid/:bookingid', bookingcontroller.getBookingById);
	// app.put('/api/booking/bookingupdate/:bookingid',tarifcontroller.updateBooking);
	

	// app.get('/api/test/user', [authJwt.verifyToken], controller.userContent);
	app.get('/api/test/user', controller.userContent);
	
	app.get('/api/test/pm', [authJwt.verifyToken, authJwt.isPmOrAdmin], controller.managementBoard);
	
	app.get('/api/test/admin', [authJwt.verifyToken, authJwt.isAdmin], controller.adminBoard);
}