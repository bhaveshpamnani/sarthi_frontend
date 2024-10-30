const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  phone: { type: String, required: true },
  addresses: [{
    building: String,
    street: String,
    landmark: String,
    city: String,
    state: String,
    postalCode: String,
    country: String,
    isDefault: { type: Boolean, default: false }
  }],
  orders: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Order' }],
  wishlist: { type: mongoose.Schema.Types.ObjectId, ref: 'Wishlist' },  // Reference to the Wishlist schema
}, { timestamps: true });

module.exports = mongoose.model('User', userSchema);
