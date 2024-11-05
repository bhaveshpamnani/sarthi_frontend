const product = require("../model/product");
const Wishlist = require("../model/wishlist");

///---=====Toggle the  Product in Wishlist---=====///
exports.toggleProduct = async (req, res) => {
  try {
    const { userId, productId } = req.body;
    // Find the user's wishlist
    let wishlist = await Wishlist.findOne({ user:userId });

    if (!wishlist) {
      // Create a new wishlist if it doesn't exist and add the product
      wishlist = new Wishlist({
        user: userId,
        items: [{ product: productId, isInWishlist: true }],
      });
      await wishlist.save();
      return res
        .status(201)
        .json({ message: "Product Add to wishlist ", wishlist });
    }

    // Find the index of the product in the wishlist
    const itemIndex = wishlist.items.findIndex(
      (item) => item.product.toString() === productId
    );

    if (itemIndex === -1) {
      ///If product is not in user wishlist then add it.
      wishlist.items.push({ product: productId, isInWishlist: true });
      await wishlist.save();
      return res
        .status(201)
        .json({ message: "Product Add to wishlist ", wishlist });
    } else {
      //If product in Users wishlist then toggle the product with (if product in wishlist then remove it).
      wishlist.items[itemIndex].isInWishlist =
        !wishlist.items[itemIndex].isInWishlist;

      // Optionally, remove the product if `isInWishlist` becomes false
      if (!wishlist.items[itemIndex].isInWishlist) {
        wishlist.items.splice(itemIndex, 1); // Remove item from wishlist
      }

      await wishlist.save();
      return res.status(200).json({ message: "Wishlist updated", wishlist });
    }
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ message: "Error adding product to wishlist" });
  }
};
