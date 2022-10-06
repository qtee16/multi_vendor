import 'package:multi_vendor/constants.dart';

Map<String, String> categoryMap = {
  Constants.men_category : 'Men',
  Constants.women_category: 'Women',
  Constants.electronics_category: 'Electronics',
  Constants.accessories_category: 'Accessories',
  Constants.shoes_category: 'Shoes',
  Constants.home_garden_category: 'Home & Garden',
  Constants.beauty_category: 'Beauty',
  Constants.kids_category: 'Kids',
  Constants.bags_category: 'Bags',
};

List<String> categoryList = [
  Constants.men_category,
  Constants.women_category,
  Constants.electronics_category,
  Constants.accessories_category,
  Constants.shoes_category,
  Constants.home_garden_category,
  Constants.beauty_category,
  Constants.kids_category,
  Constants.bags_category,
];

Map<String, List<String>> subCategoryMap = {
  Constants.men_category: men,
  Constants.women_category: women,
  Constants.electronics_category: electronics,
  Constants.accessories_category: accessories,
  Constants.shoes_category: shoes,
  Constants.home_garden_category: homeandgarden,
  Constants.beauty_category: beauty,
  Constants.kids_category: kids,
  Constants.bags_category: bags,
};

List<String> men = [
  'Shirt',
  'T-shirt',
  'Jacket',
  'Vest',
  'Coat',
  'Jeans',
  'Shorts',
  'Suit',
  'Other',
];
List<String> women = [
  'Dress',
  '2pcs sets',
  'T-shirt',
  'Top',
  'Skirt',
  'Jeans',
  'Pants',
  'Coat',
  'Jacket',
  'Other'
];
List<String> electronics = [
  'Phone',
  'Computer',
  'Laptop',
  'Smart TV',
  'Phone holder',
  'Charger',
  'USB cables',
  'Head phone',
  'Smart watch',
  'Tablet',
  'Mouse',
  'Keyboard',
  'Gaming',
  'Other'
];
List<String> shoes = [
  'Men slippers',
  'Men classic',
  'Men casual',
  'Men boots',
  'Men canvas',
  'Men sport',
  'Men snadals',
  'Home slippers',
  'Women slippers',
  'Women boots',
  'Women heels',
  'Women sport',
  'Women snadals',
  'Other'
];
List<String> homeandgarden = [
  'Living room',
  'Bed room',
  'Dinning room',
  'Kitchen tools',
  'Bath access.',
  'Furniture',
  'Decoration',
  'Lighting',
  'Garden',
  'Other'
];
List<String> beauty = [
  'Body care',
  'Hair care',
  'Men perfume',
  'Women perfume',
  'Make up',
  'Other'
];
List<String> accessories = [
  'Hat',
  'Men sunglass',
  'W sunglass',
  'Classic watch',
  'Gloves',
  'Belt waist',
  'Ring',
  'Necklace',
  'Scarf set',
  'Anklet',
  'Other'
];
List<String> kids = [
  'Girls sets',
  'Girls dress',
  'Girls top',
  'Girls pants',
  'Jacket',
  'Sweatshirts',
  'Boys sets',
  'Boys top',
  'Boys pants',
  'Home wear',
  'Boys suits',
  'Baby shoes',
  'Other'
];
List<String> bags = [
  'Wallet',
  'Clutch',
  'Chest bag',
  'Back pack',
  'Business bags',
  'Laptop bags',
  'Women bags',
  'Other'
];
