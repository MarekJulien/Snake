class Body {

    private int xPos;
    private int yPos;
    private color bodyColor;

    public Body(int xPos, int yPos, color bodyColor) {
        this.xPos = xPos;
        this.yPos = yPos;
        this.bodyColor = bodyColor;
    }

    public int getXPos() {
        return this.xPos;
    }

    public int getYPos() {
        return this.yPos;
    }
    
    public color getBodyColor() {
        return this.bodyColor;   
    }

    public void setXPos(int xPos) {
        this.xPos = xPos;
    }

    public void setYPos(int yPos) {
        this.yPos = yPos;
    }
}
