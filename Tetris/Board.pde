class Board {
  color[][] cells;
  color emptyCell = color(255,255,255); // white
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
    int blockIndicator = round(random(0,1)); // creates a new instance of a random shape
    if(blockIndicator == 0){
      current = new Square(this); // setting current to this new instance
    }else if(blockIndicator==1){
      current = new TShape(this); // setting current to this new instance
    }
    //current = new sShape(this);
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
  
  boolean rowIsFull(){
    for(int i = 0; i < cells.length - 1; i++){
      if( cells[i][18] == emptyCell){
        return false;
      }
    }
    return true;
  }
  
  void clearLine(){
    if(rowIsFull()){
      print("lineClear!");
    }
    
  }
  
}
