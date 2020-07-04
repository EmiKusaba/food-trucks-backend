const express = require("express");
const router = express.Router();
const controller = require("../controllers/trucks");

router.get("/", controller.getTrucks);
router.get("/:id", controller.getTruckById);
router.get("/:id/entrees", controller.getEntreesByTruckId);
router.get("/:id/drinks", controller.getDrinksByTruckId);
router.get("/:id/reviews", controller.getReviewsByTruckId);
router.put("/:id/reviews", controller.addReviewByTruckId);

module.exports = router;