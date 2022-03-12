class block {

  int speed=0;
  int xCoord=4;
  int yCoord=0;
  int rotate = 0;
  color[][] blockContainer = new color[4][4]; // used to store the tetris block patterns, since the largest shape is 4cells a 4x4 array allows me to "rotate" or change the cells within this array
  Board board;
  color blockColor;

  boolean stopped() {
    return false;
  }

  int idxToPixel(int a) {
    return a*board.size;
  }

  void update() {
  }

  void rendering() {
    int x = 0;
    int y = 0;
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        fill(blockContainer[j][i]);
        if (blockContainer[j][i] == blockColor) {
          x = (j+xCoord)*board.size;
          y = (i+yCoord)*board.size;
          square(x, y, board.size);
        }
      }
    }
  }

  void down() {
    if (stopped()) {
      if (yCoord <1) {
        println("Your final score is: " + round(score*10) +"!");
        exit();
      } else {
        update();
        delay(10);
        game.clearLine();
        board.createBlock();
      }
    }
  }

  boolean canRotate() {
    return true;
  }

  void Rotate() {
    if (canRotate()) {
      rotate += 1;
      rotate = rotate % 4;
    }
  }

  void right() {
    xCoord += 1;
  }

  void left() {
    yCoord -= 1;
  }
}
