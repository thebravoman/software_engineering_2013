package homework;

public class Airplane {
        int Rows = 27;
        int Seats = 3;
        int [][] row1 = new int [Rows][Seats];
        int [][] row2 = new int [Rows][Seats];
        boolean check = true;
		public Object accommodation;
        
        void printer(){
                for(int i = 0; i < Rows; i++){
                        System.out.print("| ");
                        for(int n = 0; n < Seats; n++){
                                System.out.print(row1[i][n]);
                        }
                        System.out.print(" ");
                        for(int n = 0; n < Seats; n++){
                                System.out.print(row2[i][n]);
                        }
                        System.out.print(" |");
                        System.out.println();
                }
        }
        

        void accommodation(int count){
                switch(count){
                case 1:
                        System.out.println("Accommodating one passenger!");
                        check = true;
                        plusone(row1);
                        if(check == true)
                                plusone(row2);
                        if(check == true)
                                System.out.println("Sorry, we have no seat for you");
                        else
                                System.out.println("Passenger successfully accommodated!");
                        break;
                case 2:
                        System.out.println("Accommodating two passengers!");
                        check = true;
                        plustwo(row1);
                        if(check == true)
                                plustwo(row2);
                        if(check == true)
                                System.out.println("Sorry, we have no seats for you");
                        else
                                System.out.println("Passengers successfully accommodated!");
                        break;
                case 3:
                        System.out.println("Accommodating three passengers!");
                        check = true;
                        plusthree(row1);
                        if(check == true)
                                plusthree(row2);
                        if(check == true)
                                System.out.println("Sorry, we have no seats for you");
                        else
                                System.out.println("Passengers successfully accommodated!");
                        break;
                }
                
        }
        
        private void plusone(int [][] row){
            for(int i = 0; i < Rows; i++){
                    for(int n = 0; n < Seats; n++){
                            if(row[i][n] == 0){
                                    row[i][n] = 1;
                                    check = false;
                                    break;
                            }
                    }
                    if (check == false)
                                    break;
            }        
    }
    
    private void plustwo(int[][] row){
            for(int i = 0; i < Rows; i++){
                    for(int n = 0; n < Seats-1; n++){
                            if(row[i][n] == 0 && row[i][n+1] == 0){
                                    row[i][n] = 2;
                                    row[i][n+1] = 2;
                                    check = false;
                                    break;
                            }
                    }
                    
                    if (check == false)
                            break;
            }        
    }
    
    private void plusthree(int[][] row){
            for(int i = 0; i < Rows; i++){
                    for(int n = 0; n < Seats-2; n++){
                            if(row[i][n] == 0 && row[i][n+1] == 0 && row[i][n+2] == 0){
                                    row[i][n] = 3;
                                    row[i][n+1] = 3;
                                    row[i][n+2] = 3;
                                    check = false;
                                    break;
                            }
                    }
                    if (check == false)
                            break;
            }
    }
}
