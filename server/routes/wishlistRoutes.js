const express = require("express");
const routes = express.Router();
const {toggleProduct} = require("../controller/wishlistController");

routes.post("/toggle",toggleProduct);

module.exports = routes;