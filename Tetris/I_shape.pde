class Line extends block {
  Line(Board Cells) {
    blockColor = color(0, 255, 0);
    speed=1;
    board=Cells;
    InitBlock();
  }

  void InitBlock() {
    blockContainer[0][0] = blockColor;
    blockContainer[0][1] = blockColor;
    blockContainer[0][2] = blockColor;
    blockContainer[0][3] = blockColor;
  }

  void update() {
    if (rotate % 2 == 1) {
      board.cells[xCoord][yCoord] = blockColor;
      board.cells[xCoord + 1][yCoord] = blockColor;
      board.cells[xCoord + 2][yCoord] = blockColor;
      board.cells[xCoord + 3][yCoord] = blockColor;
    } else {
      board.cells[xCoord][yCoord] = blockColor;
      board.cells[xCoord][yCoord + 1] = blockColor;
      board.cells[xCoord][yCoord + 2] = blockColor;
      board.cells[xCoord][yCoord + 3] = blockColor;
    }
  }

  boolean canRotate() {
    try {
      if (rotate % 2 == 1) {
        return board.cells[xCoord][yCoord] == board.emptyCell && board.cells[xCoord][yCoord + 1] == board.emptyCell && board.cells[xCoord][yCoord + 2] == board.emptyCell&& board.cells[xCoord][yCoord + 3] == board.emptyCell;
      } else {
        return board.cells[xCoord][yCoord] == board.emptyCell && board.cells[xCoord + 1][yCoord] == board.emptyCell && board.cells[xCoord + 2][yCoord] == board.emptyCell && board.cells[xCoord + 3][yCoord] == board.emptyCell;
      }
    }
    catch( IndexOutOfBoundsException e ) {
      return false;
    }
  }

  void Rotate() {
    if (canRotate()) {
      super.Rotate();
      if (rotate % 2 == 1) { //90
        blockContainer[0][0] = blockColor;
        blockContainer[1][0] = blockColor;
        blockContainer[2][0] = blockColor;
        blockContainer[3][0] = blockColor;

        blockContainer[0][1] = board.emptyCell;
        blockContainer[0][2] = board.emptyCell;
        blockContainer[0][3] = board.emptyCell;
      } else {
        blockContainer[0][0] = blockColor;
        blockContainer[0][1] = blockColor;
        blockContainer[0][2] = blockColor;
        blockContainer[0][3] = blockColor;

        blockContainer[1][0] = board.emptyCell;
        blockContainer[2][0] = board.emptyCell;
        blockContainer[3][0] = board.emptyCell;
      }
    }
  }

  boolean canGoRight() {
    if (rotate % 2 == 1) {
      return xCoord < 6 && board.cells[xCoord + 4][yCoord] == board.emptyCell;
    } else {
      return xCoord < 9 && board.cells[xCoord + 1][yCoord] == board.emptyCell && board.cells[xCoord + 1][yCoord + 1] == board.emptyCell && board.cells[xCoord + 1][yCoord + 2] == board.emptyCell && board.cells[xCoord + 1][yCoord + 3] == board.emptyCell;
    }
  }

  void right() {
    if (canGoRight()) { 
      xCoord += 1;
    }
  }

  boolean canGoLeft() {
    if (rotate % 2 == 1) {
      return xCoord > 0 && board.cells[xCoord - 1][yCoord] == board.emptyCell;
    } else {
      return xCoord > 0 && board.cells[xCoord - 1][yCoord] == board.emptyCell && board.cells[xCoord - 1][yCoord + 1] == board.emptyCell && board.cells[xCoord - 1][yCoord + 2] == board.emptyCell && board.cells[xCoord - 1][yCoord + 3] == board.emptyCell;
    }
  }

  void left() {
    if (canGoLeft()) { 
      xCoord -= 1;
    }
  }

  boolean stopped() {
    if (rotate % 2 == 1) {
      if (yCoord > 17) {
        return true;
      } else {
        return !(board.cells[xCoord][yCoord + 1] == board.emptyCell && board.cells[xCoord + 1][yCoord + 1] == board.emptyCell && board.cells[xCoord + 2][yCoord + 1] == board.emptyCell && board.cells[xCoord + 3][yCoord + 1] == board.emptyCell);
      }
    } else {
      int bottom = yCoord +4;
      if (bottom >= board.cells[0].length) {
        return true;
      }
      return !(board.cells[xCoord][yCoord + 4] == board.emptyCell);
    }
  }

  void down() {
    if (!stopped()) { 
      yCoord += 1;
    }
    super.down();
  }
}
