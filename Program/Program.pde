
int xOffset;
int boardWidth = 800;
int boardHeight = 800;
int square_size = 40;

int score;
int highScore;

Snake snake;

void setup() {

    size(1400, 800);
    snake = new Snake(boardWidth / square_size, boardHeight / square_size);
    frameRate(8);
    xOffset = (width - boardWidth) / 2;

}

void draw() {

    // Move Snake
    if (snake.isAlive()) {
        snake.move();
    }

    // Background
    background(0);

    // Grid
    stroke(200, 200, 200);
    for (int x = 0; x <= boardWidth; x += square_size) {
        line(x + xOffset, 0, x + xOffset, boardHeight);
    }

    for (int y = 0; y < boardHeight; y += square_size) {
        line(0 + xOffset, y, width - xOffset, y);
    }

    // Draw Apple
    Apple a = snake.getApple();
    fill(220, 0, 0);
    rect(a.getXPos() * square_size + xOffset, a.getYPos() * square_size, square_size, square_size);

    // DrawSnake Body
    Body[] bodys = snake.getBodys();
    for (int i = 0; i < bodys.length; i++) {

        Body cb = bodys[i];
        fill(0, 230, 0);
        rect(cb.xPos * square_size + xOffset, cb.yPos * square_size, square_size, square_size);
    }
    // DrawSnake Head
    fill(0, 180, 0);
    rect(snake.getXPos() * square_size + xOffset, snake.getYPos() * square_size, square_size, square_size);

    // Draw GameOver
    if (!snake.isAlive()) {
        stroke(255, 255, 255);
        fill(255, 255, 255);
        textSize(boardWidth / 5);
        textAlign(CENTER, CENTER);
        text("GAME OVER", 0, 0, width, height);
    }
    
    // Update Score
    score = snake.getBodys().length;
    if(score > highScore) {
        highScore = score;   
    }
    
    // Draw Score
    stroke(255, 255, 255);
    fill(255, 255, 255);
    textSize(xOffset / 6);
    textAlign(CENTER, CENTER);
    noFill();
    text("Score: " + score, boardWidth + xOffset, 0, xOffset, 100);
    rect(boardWidth + xOffset, 0, xOffset, 100);
    text("Highscore: " + highScore, boardWidth + xOffset, 100, xOffset, 100);
    rect(boardWidth + xOffset, 100, xOffset, 100);
    
}

void keyPressed() {
    switch(keyCode) {
    case 87: // W
        {
            snake.setDirection("U");
            break;
        }
    case 65: // A
        {
            snake.setDirection("L");
            break;
        }
    case 83: // S
        {
            snake.setDirection("D");
            break;
        }
    case 68: // D
        {
            snake.setDirection("R");
            break;
        }
    case 32: // Space
        {
            if(!snake.isAlive()) {
                this.snake = new Snake(boardWidth / square_size, boardHeight / square_size);
            }
            break;
        }
    }
}
