const express = require("express");
const productController = require("../controller/productController");
const router = express.Router();

// Create Product
router.post('/add', productController.createProduct);

// Get All Products
router.get("/", productController.getAllProducts);

// Get Product by ID
router.get("/:id", productController.getProductById);

// Update Product
router.put("/:id", productController.updateProduct);

//Category wise Product
router.get('/categoryProduct/:id',productController.getProductsByCategory);

// Delete Product
router.delete("/:id", productController.deleteProduct);

module.exports = router;
