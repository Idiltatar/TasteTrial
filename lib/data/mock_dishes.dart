import '../data/mock_dishes.dart';
import '../models/dish.dart';

final Map<String, List<Dish>> mockCityDishes = {
  'Istanbul': [
    Dish(
      name: 'Menemen',
      description: 'Eggs with tomato and pepper',
      location: 'Istanbul',
      imageUrl: 'assets/images/menemen.jpg',
    ),
    Dish(
      name: 'Lahmacun',
      description: 'Thin dough with minced meat',
      location: 'Istanbul',
      imageUrl: 'assets/images/lahmacun.jpg',
    ),
    Dish(
      name: 'Baklava',
      description: 'Sweet pastry with pistachios',
      location: 'Istanbul',
      imageUrl: 'assets/images/baklava.jpg',
    ),
    Dish(
      name: 'Kebap',
      description: 'Grilled spicy meat',
      location: 'Istanbul',
      imageUrl: 'assets/images/kebab.jpg',
    ),
    Dish(
      name: 'Simit',
      description: 'Sesame-crusted bread ring',
      location: 'Istanbul',
      imageUrl: 'assets/images/simit.jpg',
    ),
  ],
  'Ankara': [
    Dish(
      name: 'Ankara Döneri',
      description: 'Famous meat wrap of Ankara',
      location: 'Ankara',
      imageUrl: 'assets/images/ankaradoner.jpg',
    ),
    Dish(
      name: 'Ankara Simidi',
      description: 'Crunchy sesame bread ring',
      location: 'Ankara',
      imageUrl: 'assets/images/ankarasimidi.jpg',
    ),
    Dish(
      name: 'Çılbır',
      description: 'Poached eggs with yogurt and garlic',
      location: 'Ankara',
      imageUrl: 'assets/images/cilbir.jpg',
    ),
    Dish(
      name: 'Kurufasulye',
      description: 'Stewed white beans',
      location: 'Ankara',
      imageUrl: 'assets/images/kurufasulye.jpg',
    ),
    Dish(
      name: 'Tava',
      description: 'Pan-cooked meat or vegetables',
      location: 'Ankara',
      imageUrl: 'assets/images/tava.jpg',
    ),
  ],
  'Gaziantep': [
    Dish(
      name: 'Fıstıklı Kebap',
      description: 'Pistachio minced meat skewer',
      location: 'Gaziantep',
      imageUrl: 'assets/images/fistiklikebap.jpg',
    ),
    Dish(
      name: 'Katmer',
      description: 'Sweet pastry with pistachios',
      location: 'Gaziantep',
      imageUrl: 'assets/images/katmer.jpg',
    ),
    Dish(
      name: 'Beyran',
      description: 'Spicy meat and rice soup',
      location: 'Gaziantep',
      imageUrl: 'assets/images/beyran.jpg',
    ),
    Dish(
      name: 'Yuvalama',
      description: 'Mini meatball yogurt stew',
      location: 'Gaziantep',
      imageUrl: 'assets/images/yuvalama.jpg',
    ),
    Dish(
      name: 'Baklava',
      description: 'Original version with lots of pistachios',
      location: 'Gaziantep',
      imageUrl: 'assets/images/baklava.jpg',
    ),
  ],
  'Izmir': [
    Dish(
      name: 'Boyoz',
      description: 'Flaky pastry usually with eggs',
      location: 'Izmir',
      imageUrl: 'assets/images/boyoz.jpg',
    ),
    Dish(
      name: 'Lokma',
      description: 'Fried sweet dough balls',
      location: 'Izmir',
      imageUrl: 'assets/images/lokma.jpg',
    ),
    Dish(
      name: 'İzmir Köfte',
      description: 'Baked meatballs with vegetables',
      location: 'Izmir',
      imageUrl: 'assets/images/izmirkofte.jpg',
    ),
    Dish(
      name: 'Kumru',
      description: 'Sandwich with sausage and cheese',
      location: 'Izmir',
      imageUrl: 'assets/images/kumru.jpg',
    ),
    Dish(
      name: 'Söğüş',
      description: 'Cold meat salad',
      location: 'Izmir',
      imageUrl: 'assets/images/sogus.jpg',
    ),
  ],
  'Bursa': [
    Dish(
      name: 'İskender',
      description: 'Sliced döner on pita with yogurt',
      location: 'Bursa',
      imageUrl: 'assets/images/iskender.jpg',
    ),
    Dish(
      name: 'Kestane Şekeri',
      description: 'Candied chestnuts',
      location: 'Bursa',
      imageUrl: 'assets/images/kestanesekeri.jpg',
    ),
    Dish(
      name: 'Cantık',
      description: 'Small flatbread with meat',
      location: 'Bursa',
      imageUrl: 'assets/images/cantik.jpg',
    ),
    Dish(
      name: 'Pideli Köfte',
      description: 'Meatballs on pita with sauce',
      location: 'Bursa',
      imageUrl: 'assets/images/pidelikofte.jpg',
    ),
    Dish(
      name: 'Cacık',
      description: 'Yogurt with cucumber and garlic',
      location: 'Bursa',
      imageUrl: 'assets/images/cacik.jpg',
    ),
  ],
  'Paris': [
    Dish(
      name: 'Baguette',
      description: 'Crispy French bread',
      location: 'Paris',
      imageUrl: 'assets/images/baguette.jpg',
    ),
    Dish(
      name: 'Croissant',
      description: 'Buttery crescent-shaped pastry',
      location: 'Paris',
      imageUrl: 'assets/images/croissant.jpg',
    ),
    Dish(
      name: 'Quiche',
      description: 'Savory egg tart',
      location: 'Paris',
      imageUrl: 'assets/images/quiche.jpg',
    ),
    Dish(
      name: 'Crème Brûlée',
      description: 'Custard dessert with caramelized top',
      location: 'Paris',
      imageUrl: 'assets/images/cremebrulee.jpg',
    ),
    Dish(
      name: 'Ratatouille',
      description: 'Vegetable stew',
      location: 'Paris',
      imageUrl: 'assets/images/ratatouille.jpg',
    ),
  ],
  'Tokyo': [
    Dish(
      name: 'Sushi',
      description: 'Vinegared rice with raw fish',
      location: 'Tokyo',
      imageUrl: 'assets/images/sushi.jpg',
    ),
    Dish(
      name: 'Ramen',
      description: 'Noodle soup with meat and vegetables',
      location: 'Tokyo',
      imageUrl: 'assets/images/ramen.jpg',
    ),
    Dish(
      name: 'Tempura',
      description: 'Battered and fried seafood or vegetables',
      location: 'Tokyo',
      imageUrl: 'assets/images/tempura.jpg',
    ),
    Dish(
      name: 'Okonomiyaki',
      description: 'Savoury pancake with various ingredients',
      location: 'Tokyo',
      imageUrl: 'assets/images/okonomiyaki.jpg',
    ),
    Dish(
      name: 'Mochi',
      description: 'Sticky rice cake',
      location: 'Tokyo',
      imageUrl: 'assets/images/mochi.jpg',
    ),
  ],
  'Rome': [
    Dish(
      name: 'Pizza',
      description: 'Flatbread with various toppings',
      location: 'Rome',
      imageUrl: 'assets/images/pizza.jpg',
    ),
    Dish(
      name: 'Pasta',
      description: 'Italian noodles with sauce',
      location: 'Rome',
      imageUrl: 'assets/images/pasta.jpg',
    ),
    Dish(
      name: 'Risotto',
      description: 'Creamy rice dish',
      location: 'Rome',
      imageUrl: 'assets/images/risotto.jpg',
    ),
    Dish(
      name: 'Tiramisu',
      description: 'Coffee-flavored dessert',
      location: 'Rome',
      imageUrl: 'assets/images/tiramisu.jpg',
    ),
    Dish(
      name: 'Gelato',
      description: 'Italian ice cream',
      location: 'Rome',
      imageUrl: 'assets/images/gelato.jpg',
    ),
  ],
  'Delhi': [
    Dish(
      name: 'Biryani',
      description: 'Spiced rice with meat or vegetables',
      location: 'Delhi',
      imageUrl: 'assets/images/biryani.jpg',
    ),
    Dish(
      name: 'Butter Chicken',
      description: 'Creamy tomato chicken curry',
      location: 'Delhi',
      imageUrl: 'assets/images/butterchicken.jpg',
    ),
    Dish(
      name: 'Chole Bhature',
      description: 'Chickpeas with fried bread',
      location: 'Delhi',
      imageUrl: 'assets/images/cholebhature.jpg',
    ),
    Dish(
      name: 'Dosa',
      description: 'Rice crepe filled with vegetables',
      location: 'Delhi',
      imageUrl: 'assets/images/dosa.jpg',
    ),
    Dish(
      name: 'Gulab Jamun',
      description: 'Sweet syrup-soaked balls',
      location: 'Delhi',
      imageUrl: 'assets/images/gulabjamun.jpg',
    ),
  ],
};
