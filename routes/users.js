const express = require("express");
const router = express.Router();
const controller = require("../controllers/users");

router.get("/", controller.getUsers);
router.get("/:id", controller.getUserById);
router.get("/name/:name", controller.getUserByName);
//router.post("/login", controller.login);

module.exports = router;