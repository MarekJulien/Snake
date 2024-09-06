class Snake {

    private int xPos;
    private int yPos;
    private int maxX;
    private int maxY;
    private Body[] bodys;
    private SnakeSkin skin;
    private int ateApples;
    private String direction;
    private String nextDirection;
    private boolean isAlive;

    private Apple apple;

    public Snake(int boardWidth, int boardHeight) {
        this.xPos = boardWidth/4;
        this.yPos = boardHeight/2;
        this.maxX = boardWidth - 1;
        this.maxY = boardHeight - 1;
        this.bodys = new Body[0];
        this.skin = new SnakeSkin(0, 200, 0, 50, 250, 50);
        this.ateApples = 0;
        this.direction = "R";
        this.nextDirection = this.direction;
        this.isAlive = true;

        this.apple = new Apple(this.maxX, this.maxY, this);
    }

    private void move() {

        // Update direction
        this.direction = this.nextDirection;
        
        // Move bodys
        Body newLastBody = null;
        if (this.ateApples > 0) {
            this.ateApples -= 1;
            Body currentLastBody = null;
            if (this.bodys.length > 0) {
                Body b = this.bodys[this.bodys.length-1];
                currentLastBody = new Body(b.getXPos(), b.getYPos(), this.skin.getBodyColor());
            } else {
                currentLastBody = new Body(this.xPos, this.yPos, this.skin.getBodyColor());
            }
            newLastBody = currentLastBody;
        }

        for (int i = this.bodys.length-1; i >= 1; i--) {
            Body cb1 = this.bodys[i];
            Body cb2 = this.bodys[i-1];
            cb1.setXPos(cb2.getXPos());
            cb1.setYPos(cb2.getYPos());
        }

        // Move first body
        if (this.bodys.length > 0) {
            Body cb = this.bodys[0];
            cb.setXPos(this.xPos);
            cb.setYPos(this.yPos);
        }

        // Move head
        switch(this.direction) {
        case "U":
            {
                this.yPos -= 1;
                break;
            }
        case "L":
            {
                this.xPos -= 1;
                break;
            }
        case "R":
            {
                this.xPos += 1;
                break;
            }
        case "D":
            {
                this.yPos += 1;
                break;
            }
        }

        // Wall Collision
        if (this.xPos < 0) {
            this.xPos = this.maxX;
        } else if (this.xPos > this.maxX) {
            this.xPos = 0;
        } else if (this.yPos < 0) {
            this.yPos = this.maxY;
        } else if (this.yPos > this.maxY) {
            this.yPos = 0;
        }

        // Append new body
        if (newLastBody != null) {

            Body[] newbodys = new Body[this.bodys.length + 1];
            for (int i = 0; i < this.bodys.length; i++) {
                newbodys[i] = this.bodys[i];
            }
            newbodys[newbodys.length-1] = newLastBody;

            this.bodys = newbodys;
        }

        // Apple
        this.tryToEatApple();

        // Check for GameOver
        if (check_for_gameover()) {
            this.die();
        }
    }

    private boolean check_for_gameover() {

        for (int i = 0; i < this.bodys.length; i++) {
            Body cb = this.bodys[i];
            int bx = cb.getXPos();
            int by = cb.getYPos();
            if (this.xPos == bx && this.yPos == by) {
                return true;
            }
        }
        return false;
    }

    private void tryToEatApple() {

        if (this.xPos == this.apple.getXPos() && this.yPos == this.apple.getYPos()) {

            this.apple.respawn(this);
            this.ateApples += this.apple.getFoodValue();
        }
    }

    public void setDirection(String direction) {

        String cd = this.direction;
        String nd = direction;
        
        // 180 Turn
        if ((cd == "U" && nd == "D") || (cd == "D" && nd == "U") || (cd == "L" && nd == "R") || (cd == "R" && nd == "L")) {
            return;
        }

        this.nextDirection = direction;
    }

    private void die() {
        this.isAlive = false;
    }

    public int getXPos() {
        return this.xPos;
    }

    public int getYPos() {
        return this.yPos;
    }

    public boolean isAlive() {
        return this.isAlive;
    }

    public Body[] getBodys() {

        return this.bodys;
    }
    
    public SnakeSkin getSkin() {
        return this.skin;
    }
    
    public boolean isBlockOnSnake(int x, int y) {
        
        // Head
        if(this.xPos == x && this.yPos == y) {
            return true;
        }
        
        // Body
        for (int i = 0; i < this.bodys.length; i++) {
            Body cb = this.bodys[i];
            int bx = cb.getXPos();
            int by = cb.getYPos();
            if (bx == x && by == y) {
                return true;
            }
        }
        return false;
        
    }

    public Apple getApple() {
        return this.apple;
    }
}
