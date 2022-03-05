class TShape extends block{
  TShape(Board Cells) {
    blockColor = color(128,0,128);
    speed=1;
    board=Cells;
    InitBlock();
  }
  
  void Rotate(){
    super.Rotate();
    if(rotate == 1){ //90
      blockContainer[0][1]= game.emptyCell;
      blockContainer[1][0]= blockColor;
      blockContainer[1][1]= blockColor;//center
      blockContainer[2][1]= blockColor;
      blockContainer[1][2]= blockColor;
      
    }
    
    else if(rotate == 2){//180
      blockContainer[1][0]= game.emptyCell;
      blockContainer[2][1]= blockColor;
      blockContainer[1][1]= blockColor;
      blockContainer[1][2]= blockColor;
      blockContainer[0][1]= blockColor;
    }
    
    else if(rotate == 3){//270
      blockContainer[2][1]= game.emptyCell;
      blockContainer[1][0] = blockColor;
      blockContainer[1][1]= blockColor;
      blockContainer[0][1]= blockColor;
      blockContainer[1][2]= blockColor;
    }
    
    else{//360
      blockContainer[1][2]= game.emptyCell;
      blockContainer[1][0] = blockColor;
      blockContainer[1][1] = blockColor;
      blockContainer[0][1] = blockColor;
      blockContainer[2][1] = blockColor;
    }
    
  }
  
  
  void InitBlock(){
    blockContainer[1][0] = blockColor;
    blockContainer[1][1] = blockColor;
    blockContainer[0][1] = blockColor;
    blockContainer[2][1] = blockColor;
  }
  
  void update() {
    if(rotate == 1){ //90
      board.cells[xCoord+1][yCoord]= blockColor;
      board.cells[xCoord+1][yCoord+1]= blockColor;
      board.cells[xCoord+2][yCoord+1]= blockColor;
      board.cells[xCoord+1][yCoord+2]= blockColor;
      
    }
    
    else if(rotate == 2){//180
      board.cells[xCoord+2][yCoord+1]= blockColor;
      board.cells[xCoord+1][yCoord+1]= blockColor;
      board.cells[xCoord+1][yCoord+2]= blockColor;
      board.cells[xCoord][yCoord+1]= blockColor;
    }
    
    else if(rotate == 3){//270
      board.cells[xCoord+1][yCoord] = blockColor;
      board.cells[xCoord+1][yCoord+1]= blockColor;
      board.cells[xCoord][yCoord+1]= blockColor;
      board.cells[xCoord+1][yCoord+2]= blockColor;
    }
    
    else{//360
      board.cells[xCoord+1][yCoord] = blockColor;
      board.cells[xCoord+1][yCoord+1] = blockColor;
      board.cells[xCoord][yCoord+1] = blockColor;
      board.cells[xCoord+2][yCoord+1] = blockColor;
    }
  }
  
  boolean canGoRight() {
    if(rotate == 1){
      return xCoord + 4 < 11 && board.cells[xCoord+2][yCoord] == color(255,255,255) && board.cells[xCoord+3][yCoord + 1] == color(255,255,255) && board.cells[xCoord+2][yCoord + 2] == color(255,255,255);
    }
    else if(rotate == 2){
      return xCoord + 4 < 11 && board.cells[xCoord+3][yCoord+1] == color(255,255,255) && board.cells[xCoord +2][yCoord+2] == color(255,255,255);
    }
    else if(rotate == 3){
      return xCoord + 3 < 11 && board.cells[xCoord+2][yCoord] == color(255,255,255) && board.cells[xCoord +2][yCoord+1] == color(255,255,255) && board.cells[xCoord +2][yCoord+2] == color(255,255,255);
    }else{
      return xCoord + 4 < 11 && board.cells[xCoord+2][yCoord] == color(255,255,255) && board.cells[xCoord+3][yCoord + 1] == color(255,255,255);
    }
  }
  
  void right() {
    if (canGoRight()) { 
      xCoord += 1;
    }
  }
  
  boolean canGoLeft() {
    if(rotate == 1){
      return xCoord  >= 0 && board.cells[xCoord][yCoord] == color(255, 255, 255) && board.cells[xCoord][yCoord + 1] == color(255,255,255) && board.cells[xCoord][yCoord + 2] == color(255,255,255);
    }
    else if(rotate == 2){
      return xCoord  > 0 && board.cells[xCoord-1][yCoord+1] == color(255, 255, 255) && board.cells[xCoord][yCoord+2] == color(255,255,255);
    }
    else if(rotate == 3){
      return xCoord  > 0 && board.cells[xCoord][yCoord] == color(255, 255, 255) && board.cells[xCoord-1][yCoord+1] == color(255,255,255) && board.cells[xCoord][yCoord+2] == color(255,255,255);
    }else{
      return xCoord  > 0 && board.cells[xCoord - 1][yCoord + 1] == color(255, 255, 255) && board.cells[xCoord - 1][yCoord] == color(255,255,255);
    }
  }
  
  void left() {
    if (canGoLeft()) { 
      xCoord -= 1;
    }
  }
  
  boolean stopped(){
    if(rotate == 0){
      int bottom = yCoord +2;
    if(bottom >= board.cells[0].length){
      return true;
    }
    return !( board.cells[xCoord ][yCoord + 2] == color(255,255,255) && board.cells[xCoord + 1][yCoord + 2] == color(255,255,255) && board.cells[xCoord + 2][yCoord + 2] == color(255,255,255));
    }else if(rotate == 1){
      int bottom = yCoord +3;
      if(bottom >= board.cells[0].length){
        return true;
      }
      return !(board.cells[xCoord + 1][yCoord + 3] == color(255,255,255) && board.cells[xCoord + 2][yCoord + 2] == color(255,255,255));
    
    }else if(rotate == 2){
      int bottom = yCoord +3;
      if(bottom >= board.cells[0].length){
        return true;
      }
      return !(board.cells[xCoord + 1][yCoord + 3] == color(255,255,255) && board.cells[xCoord + 2][yCoord + 2] == color(255,255,255) && board.cells[xCoord][yCoord + 2] == color(255,255,255));
      
    }else{
      int bottom = yCoord +3;
      if(bottom >= board.cells[0].length){
        return true;
      }
      return !(board.cells[xCoord ][yCoord + 2] == color(255,255,255) && board.cells[xCoord + 1][yCoord + 3] == color(255,255,255));
    }
  }
  
  void down() {
    if (!stopped()) { 
      yCoord += 1;
    }
    super.down();
  }
  
}
