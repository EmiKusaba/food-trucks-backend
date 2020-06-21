const getTrucks = require("./modules/trucks/getTrucks");
const getTruckById = require("./modules/trucks/getTruckById");
const getEntreesByTruckId = require("./modules/trucks/getEntreesByTruckId");
const getDrinksByTruckId = require("./modules/trucks/getDrinksByTruckId");
const getReviewsByTruckId = require("./modules/trucks/getReviewsByTruckId");
const addReviewByTruckId = require("./modules/trucks/addReviewByTruckId");


module.exports = {
  getTrucks,
  getTruckById,
  getEntreesByTruckId,
  getDrinksByTruckId,
  getReviewsByTruckId,
  addReviewByTruckId,
}