package elsys.Homework24;

public class Groups {
        private int passengers;
        
        public int randomGroup(int max) {
                this.passengers = 1 + (int)(Math.random() * max);
                return passengers;
        }
}
