const getTrucks = require("./modules/trucks/getTrucks");
const getTruckById = require("./modules/trucks/getTruckById");
const getEntreesByTruckId = require("./modules/trucks/getEntreesByTruckId");
const getDrinksByTruckId = require("./modules/trucks/getDrinksByTruckId");


module.exports = {
  getTrucks,
  getTruckById,
  getEntreesByTruckId,
  getDrinksByTruckId,
}