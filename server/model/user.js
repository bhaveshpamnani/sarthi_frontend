const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  phone: { type: String, required: true ,unique:true},
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
  coupons: [{
    code: { type: String, required: true },
    discount: { type: Number, required: true },  // Discount amount or percentage
    expiryDate: { type: Date, required: true },
    isRedeemed: { type: Boolean, default: false }  // To track if the coupon has been used
  }],
  orders: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Order' }],
  wishlist: { type: mongoose.Schema.Types.ObjectId, ref: 'Wishlist' },  // Reference to the Wishlist schema
}, { timestamps: true });


// Hash password before saving user
userSchema.pre('save', async function(next) {
  if (!this.isModified('password')) return next();
  const salt = await bcrypt.genSalt(10);
  this.password = await bcrypt.hash(this.password, salt);
  next();
});

module.exports = mongoose.model('User', userSchema);
