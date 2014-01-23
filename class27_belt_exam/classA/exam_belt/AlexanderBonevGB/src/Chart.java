
public class Chart {
	int value1;
    int value2;
    int value3;


    Chart(int value1, int value2, int value3) {
            this.value1 = value1;
            this.value2 = value2;
            this.value3 = value3;
    }

    public int getValue1() {
            return value1;
    }
    
    public void setValue1(){
    		this.value1 = getValue1();
    }
    
    public int getValue2() {
            return value2;
    }
    public void setValue2(int value2) {
            this.value2 = value2;
    }

    public void print() {
            System.out.println(this.getValue1());
            System.out.println(this.getValue2());
                }
}