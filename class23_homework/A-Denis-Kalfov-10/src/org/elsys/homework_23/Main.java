package org.elsys.homework_23; 
import java.util.ArrayList;

public class Main {

  public static void main(String[] args) {
         int seat_num=0;
           int[] One_TwoTogether; 
           One_TwoTogether = new int[300];
           int index=1;
           
           int all=0;
              
           int info=0; 
           int alone=0;
           int SeatNum_alone_cp=0; 
           int placeOnlyFor_1=0; 
           int placeOnlyFor_1SeatNum=0; 
              
           for (;all<=162;){
        	   seat_num+=1;

        	   System.console().readLine();
                
               ArrayList<Integer> l = new ArrayList<Integer>();
               
               Peoples newPeoples = new Peoples();
               
               	int countOfPeoples=0; 
               	
		            if (newPeoples.peoples==2){
		                countOfPeoples+=2;
		                	l.add(newPeoples.peoples);
		                	l.add(newPeoples.peoples); 
					} else if (newPeoples.peoples==3){
		                countOfPeoples+=3;
							l.add(newPeoples.peoples);
							l.add(newPeoples.peoples); 
							l.add(newPeoples.peoples);
					} else if (newPeoples.peoples==1){
						countOfPeoples++;
							l.add(newPeoples.peoples);
					}
                      
                      if (countOfPeoples==3) {
                          System.out.println("seat N: "+(seat_num)+" "+(seat_num+1)+" "+(seat_num+2));
                          seat_num=seat_num+2;      
                          
                      }else if (countOfPeoples==2){
                          System.out.println("seat N: "+seat_num+" "+ (seat_num+1));
                          info++;  
                          
                          if (info>0){
                              index+=1;
                              One_TwoTogether[index]=seat_num+2;
                          }
                          seat_num=seat_num+2;  
                      
                      }else if (countOfPeoples==1){
                          if (alone==1){
                              System.out.println("seat N: "+(SeatNum_alone_cp+1)); 
                              alone=0;

                              placeOnlyFor_1++;
                              placeOnlyFor_1SeatNum=SeatNum_alone_cp+2;
                              seat_num-=1;

                          } else if (info==0 && placeOnlyFor_1!=1){
                               System.out.println("seat N: "+seat_num);
                               
                               SeatNum_alone_cp=seat_num;
                               alone++;
                               seat_num+=2;
                               
                           } else if (info>0){
                              System.out.println("seat N: "+One_TwoTogether[index]);
                                  index--;
                                  info--;
                              seat_num-=1;
                              
                          } else if (placeOnlyFor_1==1){
                             System.out.println("seat N: "+placeOnlyFor_1SeatNum);
                              placeOnlyFor_1--;
                              seat_num-=1;
                          }
                      }
			
                  System.out.println(l+"\n");

              if (seat_num>=162){
                  break;
              }
              
         }

    System.out.println("Free seats: "+((alone*2)+info+placeOnlyFor_1));
  
          
}   }
