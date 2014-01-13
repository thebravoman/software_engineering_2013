package hw21;

public class Ball {
        protected double capacity;
        
        public void setCapacity(double capacity)
		{
			this.capacity = capacity;
		}

		public Ball(int capacity) {
                this.capacity=capacity;
        }

        public double getCapacity() {
                return capacity;
        }

        public void setCapacity(int capacity) {
                this.capacity = capacity;
        }
}