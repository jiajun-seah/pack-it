const gameLevels = <GameLevel>[
  (
    id: 1,
    // nRows: 2,
    // nCols: 2,
    foods: ['curry', 'rice'],
    difficulty: 0,
  ),
  (
    id: 2,
    // nRows: 2,
    // nCols: 2,
    foods: ['sandwich_tl', 'sandwich_tr', 'sandwich_bl', 'sandwich_br'],
    difficulty: 0,
  ),
  (
    id: 3,
    // nRows: 3,
    // nCols: 3,
    foods: ['orange_l', 'orange_r', 'blueberry', 'banana'],
    difficulty: 0,
  ),
  (
    id: 4,
    // nRows: 3,
    // nCols: 3,
    foods: ['stick', 'olive', 'lettuce', 'rice', 'mushroom'],
    difficulty: 0,
  ),
  (
    id: 5,
    // nRows: 3,
    // nCols: 4,
    foods: ['grape_swiss', 'lime_swiss', 'orange_swiss', 'chocolate_swiss'],
    difficulty: 0,
  ),
  (
    id: 6,
    // nRows: 4,
    // nCols: 4,
    foods: ['sushi_1', 'sushi_2', 'sushi_3', 'sushi_4', 'sushi_5', 'sushi_6', 'maki_1', 'maki_2', 'maki_3'],
    difficulty: 0,
  ),
  (
    id: 7,
    // nRows: 4,
    // nCols: 5,
    foods: ['vanilla_glazed', 'chocolate_sprinkle', 'chocolate_swirl', 'strawberry_glazed', 'strawberry_sprinkle', 'strawberry_swirl'],
    difficulty: 0,
  ),
  (
    id: 8,
    // nRows: 4,
    // nCols: 5,
    foods: ['cranberry', 'strawberry', 'watermelon', 'grape', 'kiwi', 'mango', 'blueberry', 'blackcurrent', 'plum'],
    difficulty: 0,
  ),
];

typedef GameLevel = ({
  int id,
  // int nRows,
  // int nCols,
  List<String> foods,
  int difficulty,
});