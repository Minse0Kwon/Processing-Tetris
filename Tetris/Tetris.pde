int difficulty = 5; // increase this number to increase the difficulty between 1 and 40


Board game = new Board(); // create a new Board called game
void setup(){
  size(400,760);
}

void draw(){
  noStroke();
  frameRate(40);
  if(frameCount % (40 / difficulty) == 0){
    game.current.down(); //calling "down()" on the current moving tetris block within the Board "game" which moves the block down 1cell every 40/difficulty frames
  }
  game.rendering(); // drawing the base background and current moving tetris block within the Board "game"
}


void keyPressed(){
  if(key == 'w'){
    game.current.Rotate(); // calling "rotate()" on currently moving block which rotates the current block
  }
  if(key == 'd'){
    game.current.right(); // calling "right()" on currently moving block which moves the block right 1 cell
  }
  if(key == 'a'){
    game.current.left(); // calling "left()" on currently moving block which moves the block left 1 cell
  }
}
