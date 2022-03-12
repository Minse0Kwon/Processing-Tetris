int difficulty = 3; // increase this number to increase the difficulty between 1 and 40
float score = 0;

Board game = new Board(); // create a new Board called game
void setup() {
  size(400, 760);
}


int speed = 1;

void draw() {

  noStroke();
  frameRate(40);
  if (frameCount % (40  / (difficulty*speed) ) == 0) {
    game.current.down(); //calling "down()" on the current moving tetris block within the Board "game" which moves the block down 1 cell every 40/difficulty frames
  }
  game.rendering(); // drawing the base background and current moving tetris block within the Board "game"
  textAlign(CENTER);
  textSize(30);
  text("Score: " + round(score*10), 200, 50);
}


void keyPressed() {
  if (key == 'w' || keyCode == UP) {
    game.current.Rotate(); // calling "rotate()" on currently moving block which rotates the current block
  }
  if (key == 'd' || keyCode == RIGHT) {
    game.current.right(); // calling "right()" on currently moving block which moves the block right 1 cell
  }
  if (key == 'a' || keyCode == LEFT) {
    game.current.left(); // calling "left()" on currently moving block which moves the block left 1 cell
  }
  if (key == 's' || keyCode == DOWN) {
    speed = 5;
    score += 0.02; // extra points for making blocks go faster
  }
}

void keyReleased() {
  if (key == 's' || keyCode == DOWN) {
    speed = 1;
  }
}
