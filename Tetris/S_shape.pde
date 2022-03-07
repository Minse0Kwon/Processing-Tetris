class sShape extends block {
  sShape(Board Cells){
    blockColor = color(255,255,0);
    speed=1;
    board=Cells;
    InitBlock();
  }
  
  void InitBlock(){
    blockContainer[1][0] = blockColor;
    blockContainer[2][0] = blockColor;
    blockContainer[1][1] = blockColor;
    blockContainer[0][1] = blockColor;
  }
  
  void update() {
    board.cells[xCoord + 1][yCoord] = blockColor;
    board.cells[xCoord + 2][yCoord] = blockColor;
    board.cells[xCoord + 1][yCoord + 1] = blockColor;
    board.cells[xCoord][yCoord + 1] = blockColor;
  }
  
  boolean canGoRight() {
    if(xCoord + 5 > 11){
      return false;
    }
    return board.cells[xCoord + 3][yCoord] == board.emptyCell && board.cells[xCoord + 3][yCoord] == board.emptyCell;
    
  }

  void right() {
    if (canGoRight()) { 
      xCoord += 1;
    }
  }

  boolean canGoLeft() {
    if(xCoord == 0){
      return false;
    }
    return true;
  }

  void left() {
    if (canGoLeft()) { 
      xCoord -= 1;
    }
  }
  
  
  boolean stopped() {
    int bottom = yCoord + 3;
    if (bottom >= board.cells[0].length) {
      return true;
    }
    return false;
  }

  void down() {
    if (!stopped()) { 
      yCoord += 1;
    }
    super.down();
  }
  
}
