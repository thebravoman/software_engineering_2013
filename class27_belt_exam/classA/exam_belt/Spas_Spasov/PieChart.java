public class PieChart extends Chart implements Spas_Spasov_2{
        public PieChart(int v1, int v2, int v3) {
                super(v1, v2, v3);
        }

        public void spas(){
                super.setValue2(super.getValue2()-super.getValue1());
        }

}