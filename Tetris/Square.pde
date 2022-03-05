class Square extends block {

  Square(Board Cells) {
    blockColor = color(0,255,255);
    speed=1;
    board=Cells;
    InitBlock();
  }
  
  void InitBlock(){
    blockContainer[0][0] = blockColor;
    blockContainer[1][0] = blockColor;
    blockContainer[0][1] = blockColor;
    blockContainer[1][1] = blockColor;
  }

  void update() {
    board.cells[xCoord][yCoord] = blockColor;
    board.cells[xCoord + 1][yCoord] = blockColor;
    board.cells[xCoord][yCoord + 1] = blockColor;
    board.cells[xCoord + 1][yCoord + 1] = blockColor;
  }

  boolean canGoRight() {
    return xCoord + 3 < 11 && board.cells[xCoord + 2][yCoord + 1] == board.emptyCell  && board.cells[xCoord+2][yCoord] == board.emptyCell;
  }

  void right() {
    if (canGoRight()) { 
      xCoord += 1;
    }
  }

  boolean canGoLeft() {
    return xCoord > 0 && board.cells[xCoord - 1][yCoord + 1] == board.emptyCell && board.cells[xCoord-1][yCoord] == board.emptyCell;
  }

  void left() {
    if (canGoLeft()) { 
      xCoord -= 1;
    }
  }

  boolean stopped() {
    int bottom = yCoord +2;
    if (bottom >= board.cells[0].length) {
      return true;
    }
    return !(board.cells[xCoord][yCoord+2] == board.emptyCell && board.cells[xCoord+1][yCoord+2] == board.emptyCell);
  }

  void down() {
    if (!stopped()) { 
      yCoord += 1;
    }
    super.down();
  }
}
