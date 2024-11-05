const express = require("express");
const {login,signup,getUserProfile,updateUserProfile} = require("../controller/userController");
const routes = express.Router();

//Login
routes.post("/login",login);

//signup
routes.post("/signup",signup);

//getUserProfile
routes.get("/getuserprofile/:id",getUserProfile);

//UpadateProfile
routes.put("/updateprofile/:id",updateUserProfile);

module.exports = routes;