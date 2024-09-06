
class SnakeSkin {
    
    private int r1, g1, b1;
    private int r2, g2, b2;
    
    public SnakeSkin(int r1, int g1, int b1, int r2, int g2, int b2) {
        
        this.r1 = r1;
        this.g1 = g1;
        this.b1 = b1;
        this.r2 = r2;
        this.g2 = g2;
        this.b2 = b2;
        
    }
    
    public color getBodyColor() {
        
        int r = round(random(r1, r2));
        int g = round(random(g1, g2));
        int b = round(random(b1, b2));
        
        color c = color(r, g, b);
        
        return c;
        
    }
    
    public color getHeadColor() {
        return color(r1, g1, b1);   
    }
    
}
