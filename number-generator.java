class Random{
    private final int m = 2147483647;  // 2^31 - 1; a prime constant
    private final int a = 16807;       // 7^5; a primitive root modulo; aka MINSTD

    private int min;                   // maintain previous order
    private int max;
    private long random;

    public Random(int min, int max, int seed){
        this.min = min;
        this.max = max;
        this.random = seed;            // random_0 = seed
    }

    public long getRandom(){
        this.random = (this.a * this.random) % this.m;

        return (this.random % (this.max - this.min)) + this.min;
    }
}


class Generator{ 
    public static void main(String [] args){
        int min = Integer.parseInt(args[0]);
        int max = Integer.parseInt(args[1]);
        int seed = Integer.parseInt(args[2]);

        Random r = new Random(min, max, seed);
        
        System.out.println(r.getRandom());
    }
}
