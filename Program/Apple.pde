class Apple {

    private int maxX;
    private int maxY;
    private int xPos;
    private int yPos;
    private int foodValue;

    public Apple(int maxX, int maxY, Snake snake) {
        this.maxX = maxX;
        this.maxY = maxY;
        this.respawn(snake);
        this.foodValue = 3;
    }

    public void respawn(Snake snake) {

        int x;
        int y;

        do {
            x = round(random(0, maxX));
            y = round(random(0, maxY));
        } while (snake.isBlockOnSnake(x, y));

        this.xPos = x;
        this.yPos = y;
    }

    public int getXPos() {
        return this.xPos;
    }

    public int getYPos() {
        return this.yPos;
    }
    
    public int getFoodValue() {
        return this.foodValue;   
    }
}
