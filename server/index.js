const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");

const productRoutes = require("./routes/productRoutes");

const app = express();
const PORT = 3000;
const uri = "mongodb+srv://bhaveshpamnani100:bhavesh1A@sarthi.kkna6.mongodb.net/?retryWrites=true&w=majority&appName=sarthi";

// Middleware to parse JSON
app.use(bodyParser.json());

// Connect to MongoDB
mongoose
  .connect(uri)
  .then(() => console.log("MongoDB Connected"))
  .catch((err) => console.error("MongoDB Connection Error: " + err));

// Routes
app.use("/api/products", productRoutes);

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
