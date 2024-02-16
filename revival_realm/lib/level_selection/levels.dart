const gameLevels = <GameLevel>[
  (
    id: 1,
    foods: ['curry', 'rice'],
    difficulty: 0,
  ),
  (
    id: 2,
    foods: ['sandwich_tl', 'sandwich_tr', 'sandwich_bl', 'sandwich_br'],
    difficulty: 0,
  ),
  (
    id: 3,
    foods: ['orange_l', 'orange_r', 'blueberry', 'banana'],
    difficulty: 0,
  ),
  (
    id: 4,
    foods: ['stick', 'lettuce', 'rice', 'mushroom'],
    difficulty: 0,
  ),
  (
    id: 5,
    foods: ['grape_swiss', 'lime_swiss', 'orange_swiss', 'chocolate_swiss'],
    difficulty: 0,
  ),
  (
    id: 6,
    foods: ['sushi_1', 'sushi_2', 'sushi_3', 'sushi_4', 'sushi_5', 'sushi_6', 'maki_1', 'maki_2', 'maki_3'],
    difficulty: 0,
  ),
  (
    id: 7,
    foods: ['vanilla_glazed', 'chocolate_sprinkle', 'chocolate_swirl', 'strawberry_glazed', 'strawberry_sprinkle', 'strawberry_swirl'],
    difficulty: 0,
  ),
  (
    id: 8,
    foods: ['strawberry', 'apple', 'grape', 'pear', 'blueberry', 'blackcurrent'],
    difficulty: 0,
  ),
];

typedef GameLevel = ({
  int id,
  List<String> foods,
  int difficulty,
});