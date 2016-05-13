# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products = [
  { name: "Flora Stone Maxi Dress", price: 35600, user_id: 1, description: "V-neck maxi in tropical print featuring adjustable spaghetti straps and center cutout with tie at bust", stock:20, photo_url: "https://s-media-cache-ak0.pinimg.com/736x/9f/dc/97/9fdc97ffb840b8fd044825ab096a40ec.jpg"  },

  { name: "Eyelet-Yoke Top", price: 4500, user_id: 1, description: "Sleeveless top in floral motif featuring crochet yoke and vertical insets at front and back", stock:20, photo_url: "http://assets.charmingshoppes.com/is/image/LaneBryant/pr_175047_1A?$product_main$&wid=354&hei=460"  },

  { name: "Tree of Life Pendant Necklace", price: 9130, user_id: 2, description: "Sterling silver necklace featuring polished pendant with gold-plated tree at center and diamond-studded leaves", stock:20, photo_url: "http://cdn-tp2.mozu.com/12282-17282/cms/17282/files/875fe66d-f433-4aa8-a94f-639df83c50f4?max=350"  },

  { name: "Bold Stainless Steel Bracelet Watch", price: 55000, user_id: 2, description: "Elegant brushed stainless steel watch featuring white sunray dial with signature dot at 12 o'clock", stock:20, photo_url: "https://www.passthewatch.com/media/catalog/product/cache/1/small_image/350x350/9df78eab33525d08d6e5fb8d27136e95/3/6/3600276_1.jpg"  },

  { name: "Cedar Street Bag", price: 28000, user_id: 3, description: "Colorful crocheted satchel featuring hardware feet and removable cross-body strap", stock:20, photo_url: "https://s-media-cache-ak0.pinimg.com/736x/29/8c/35/298c3550315e5146ec4b40ed2e324d55.jpg"  },

  { name: "Family Tree Personalized Names Necklace", price: 2900, user_id: 3, description: "Personalized family necklace with copper family tree charm in silver washer by DistinctlyIvy", stock:20, photo_url: "http://www.bodycandy.com/mas_assets/full/HC-3562.jpg"  },

  { name: "Ally Secret Trellis Long Silk Scarf", price: 15900 , user_id: 4, description: "Silk scarf in windowpane gingham with flowery ombre-tone border", stock:20, photo_url: "http://i00.i.aliimg.com/wsphoto/v7/619645742_1/2013-New-Arrival-Fashion-Satin-Big-Square-Scarf-Printed-For-Women-90-90cm-Ladies-s-Brand.jpg_350x350.jpg"  },

  { name: "Good Vibes Crinkle Wrap", price: 15900 , user_id: 4, description: "Lightweight orange scarf featuring delicate eyelash fringe and glittering ends", stock:20, photo_url: "http://s8.thisnext.com/media/largest_dimension/6B974A25.jpg" },

  { name: "Carrson Dress Sandal", price: 90000 , user_id: 5, description: "Ankle-strap sandal in rich leather featuring covered block heel and single toe", stock:20, photo_url: "https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2012/1/18/1326907445081/Paula-Deen-riding-a-stick-007.jpg?w=620&q=55&auto=format&usm=12&fit=max&s=acddaa78287bd521cdfb7aa108d86c05"  },

  { name: "Mirror Forget Me Not Scarf", price: 12000, user_id: 5, description: "Awash in blooms of every color and trimmed with graphic details, this scarf of pure silk adds a touch of opulent indulgence to any ensemble.", stock:20, photo_url: "http://i01.i.aliimg.com/wsphoto/v0/2039859167_1/Silk-language-lotus-authentic-women-s-short-winter-days-to-be-warm-wool-long-scarf-shawl.jpg_350x350.jpg"   },

  { name: "Belted Drape Front Coat", price: 24500, user_id: 1, description: "A shoulder-spanning collar caps off the chic and easy style of a belt-wrapped coat with a clean, minimalist look.", stock:20, photo_url: "http://gloimg.dresslily.com/L/2015/201510/goods-img/1444938150130-P-3261312.jpg?a=6"  },

  { name: "Bonnie Ocelot Archive Coat", price: 82000, user_id: 2, description: "Roomy patch pockets and a ballchain locker loop with a miniature hangtag charm add a touch of practicality to its dramatic silhouette. 100% printed goat fur with leather trim. 100% rayon lining", stock:20, photo_url: "https://s-media-cache-ak0.pinimg.com/736x/29/17/5c/29175c6ad4730ee3f58a3f5c474993bb.jpg" },

  { name: "'Orbit' Leather Moto Jacket", price: 45000, user_id: 3, description: "Clean trapunto stitching at the sleeves and exposed zip cuffs add to the cool, moto-inspired vibe of a cropped, asymmetrical jacket fashioned from washed black leather for an authentically worn finish.", stock:20, photo_url: " https://s-media-cache-ak0.pinimg.com/736x/a8/6a/e4/a86ae43b879061136b75bc670a0ef83c.jpg" },

  { name: "Floral Lace Crop Sweater", price: 12900, user_id: 3, description: "Slender straps, skin-baring cutaway shoulders and an abbreviated hem put a flirtatious twist on a pretty white tank sweetened with an overlay of floral lace.", stock:20, photo_url: " https://www.bauhaus.com.hk/image/cache/data/products/501216B598293201-350x350.jpg" },

  { name: "Retro 1950's Polka Dot Cat Eye Fashion Sunglasses", price: 15900 , user_id: 4, description: "A distinct mod version of 50s-inspired cat eye sunglasses with high pointed corners and adorable polka dots. You'll find they can work with many outfits, from the very modern to the utterly vintage. Made with an acetate based frame, metal hinges and gradient polycarbonate UV protected lenses.", stock:20, photo_url: "  https://ledchristmaslighting.com/images/FM73252.jpg"},
]

products.each do |product|
  Product.create product
end

categories = [
  {name: "Dress"},
  {name: "Blouse"},
  {name: "Jewelry"},
  {name: "Bag"},
  {name: "Scarf"},
  {name: "Shoes"},
  {name: "Clothing"},
  {name: "Jacket"},
  {name: "Accessories"},
  {name: "Sunglasses"}
]

categories.each do |category|
  Category.create category
end

def add_category(product, categories)
  categories.each do |category|
    product.categories << Category.find_by_name(category)
  end
end

p_one = Product.find(1)
add_category(p_one, ["Dress", "Clothing"])
p_two = Product.find(2)
add_category(p_two, ["Blouse", "Clothing"])
p_three = Product.find(3)
add_category(p_three, ["Jewelry", "Accessories"])
p_four = Product.find(4)
add_category(p_four, ["Jewelry", "Accessories"])
p_five = Product.find(5)
add_category(p_five,["Bag", "Accessories"])
p_six = Product.find(6)
add_category(p_six, ["Jewelry", "Accessories"])
p_seven = Product.find(7)
add_category(p_seven, ["Scarf", "Accessories"])
p_eight = Product.find(8)
add_category(p_eight, ["Clothing"])
p_nine = Product.find(9)
add_category(p_nine, ["Shoes"])
p_ten = Product.find(10)
add_category(p_ten, ["Scarf", "Accessories"])
p_eleven = Product.find(11)
add_category(p_eleven, ["Clothing"])
p_twelve = Product.find(12)
add_category(p_twelve, ["Clothing"])
p_thirteen = Product.find(13)
add_category(p_thirteen, ["Clothing", "Jacket"])
p_fourteen = Product.find(14)
add_category(p_fourteen, ["Clothing"])
p_fifteen = Product.find(15)
add_category(p_fifteen, ["Sunglasses", "Accessories"])


users = [
  { name: "Jillian",
    user_name: "jillian",
    email: "jillian@example.com",
    password: 'password' },
  { name: "Justine",
    user_name: "justine",
    email: "justine@example.com",
    password: 'password' },
  { name: "Melissa",
    user_name: "melissa",
    email: "melissa@example.com",
    password: 'password' },
  { name: "Lisa",
    user_name: "lisa",
    email: "lisa@example.com",
    password: 'password' },
  { name: "Jeremy",
    user_name: "jeremy",
    email: "jeremy@example.com",
    password: 'password' }
]

users.each do |user|
  User.create(user)
end

orders = [
{order_state: "pending", user_id: 1, total: 4399},
{order_state: "pending", user_id: 2, total: 110000},
{order_state: "paid", user_id: 3, total: 84000},
{order_state: "complete", user_id: 4, total: 63910},
{order_state: "canceled", user_id: 5, total: 71200},

{order_state: "paid", user_id: 1, total: 84000},
{order_state: "complete", user_id: 1, total: 63910},
{order_state: "canceled", user_id: 3, total: 71200},
{order_state: "pending", user_id: 4, total: 110000},
{order_state: "paid", user_id: 2, total: 110000},
{order_state: "paid", user_id: 3, total: 71200},
{order_state: "pending", user_id: 4, total: 110000},
{order_state: "paid", user_id: 2, total: 110000},
]
orders.each do |order|
  Order.create order
end


order_items = [
{product_id: 1, order_id: 5, quantity: 2},
{product_id: 3, order_id: 4, quantity: 7},
{product_id: 5, order_id: 3, quantity: 3},
{product_id: 4, order_id: 2, quantity: 2},
{product_id: 2, order_id: 1, quantity: 1},
{product_id: 5, order_id: 5, quantity: 2},
{product_id: 5, order_id: 4, quantity: 7},
{product_id: 5, order_id: 3, quantity: 3},
{product_id: 4, order_id: 2, quantity: 2},
{product_id: 2, order_id: 1, quantity: 1},
{product_id: 8, order_id: 6, quantity: 2},
{product_id: 9, order_id: 6, quantity: 2},
{product_id: 10, order_id: 6, quantity: 3},
{product_id: 9, order_id: 7, quantity: 2},
{product_id: 10, order_id: 7, quantity: 1},
{product_id: 1, order_id: 7, quantity: 2},
{product_id: 11, order_id: 7, quantity: 2},
{product_id: 10, order_id: 8, quantity: 7},
{product_id: 11, order_id: 8, quantity: 3},
{product_id: 12, order_id: 8, quantity: 2},
{product_id: 1, order_id: 8, quantity: 2},
{product_id: 2, order_id: 8, quantity: 2},
{product_id: 12, order_id: 9, quantity: 1},
{product_id: 14, order_id: 9, quantity: 4},
{product_id: 13, order_id: 10, quantity: 1},
{product_id: 12, order_id: 9, quantity: 1},
{product_id: 14, order_id: 9, quantity: 4},
{product_id: 13, order_id: 10, quantity: 1},
{product_id: 3, order_id: 11, quantity: 7},

]

order_items.each do |order_item|
  OrderItem.create order_item
end

reviews = [
 { product_id: 1, user_id: 5, review: "This dress was a splurge, but I love it! I wear it to my volunteer gig at Dolphin World all the time.", rating: 4 },
 { product_id: 2, user_id: 4, review: "So comfy! Also, one of my grandkids puked on it, and the stain came right out. 10/10 would recommend to a friend.", rating: 5 },
 { product_id: 3, user_id: 4, review: "Got this for my wife. She wore it only one time and one of the diamonds popped out. Very disappointed.", rating: 1 },
 { product_id: 4, user_id: 3, review: "I wore this on my cruise to the Bahamas and got so many compliments. Unfortunately I found out it wasn't waterproof.", rating: 3 },
 { product_id: 5, user_id: 2, review: "Well-made for faux-leather, easily holds a book, sweater, and farmer's market purchases.", rating: 4 },
 { product_id: 6, user_id: 5, review: "Cool stuff.", rating: 4 },
 { product_id: 7, user_id: 4, review: "Yay I liked it", rating: 5 },
 { product_id: 8, user_id: 4, review: "Boo, I hated it.", rating: 1 },
 { product_id: 9, user_id: 3, review: "It's okay.", rating: 3 },
 { product_id: 10, user_id: 2, review: "Really super!", rating: 4 }
 ]

reviews.each do |review|
  Review.create review
end
