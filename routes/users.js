const express = require("express");
const router = express.Router();
const controller = require("../controllers/users");

router.get("/", controller.getUsers);
router.post("/login", controller.doLogin);

module.exports = router;