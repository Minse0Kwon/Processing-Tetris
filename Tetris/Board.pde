class Board {
  color[][] cells;
  color emptyCell = color(255, 255, 255); // white
  int size = 40;
  int x = 0;
  int y = 0;
  block current;
  Board() { // constructor
    createBlock(); // creates a new tetris piece
    cells = new color[11][19]; 
    for (int i = 0; i < 19; i++) { // assigning all background cells to white
      for (int j = 0; j < 11; j++) {
        cells[j][i] = emptyCell;
      }
    }
  }

  void createBlock() {
    int blockIndicator = round(random(0, 2)); // creates a new instance of a random shape
    if (blockIndicator == 0) {
      current = new Square(this); // setting current to this new instance
    } else if (blockIndicator == 1) {
      current = new TShape(this); // setting current to this new instance
    } else {
      current = new Line(this);
    }
  }

  void rendering() {
    renderBackground(); // drawing the background cells
    current.rendering(); // drawing the currently moving tetris block
  }

  void renderBackground() {
    y = 0;
    for (int i = 0; i < 19; i++) {
      for (int j = 0; j < 11; j++) {
        fill(cells[j][i]);
        x = j*size;
        square(x, y, size);
      }
      y += size;
    }
  }

  boolean rowIsFull(int row) {
    for (int i = 0; i < cells.length - 1; i++) {
      if ( cells[i][row] == emptyCell) {
        return false;
      }
    }
    return true;
  }

  void clearLine() {
    for (int rowNum = 0; rowNum < 19; rowNum++) { // check which row is full
      if (rowIsFull(rowNum)) {
        score++;
        for (int i = 0; i < cells.length - 1; i++) { // clear the row that is full
          cells[i][rowNum] = emptyCell;
        }

        for (int i = 0; i < cells.length - 1; i++) { // moving all cells above the row that is full down 1 cell;
          for (int j = rowNum - 1; j > 1; j--) {
            cells[i][j+1] = cells[i][j];
          }
        }
      }
    }
  }
  
}
