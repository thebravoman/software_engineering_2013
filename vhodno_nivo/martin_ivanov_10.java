import java.util.Scanner ;
import java.lang.Integer ;
 
  public class martin_ivanov_10 {
  
    public static void main(String args[]) {
    
      Scanner input = new Scanner(System.in) ; 
      String num ;
      int x=0,a,b,sum=0,i=0,count=0 ;
      int[] myarr = new int[10] ;
      
      do {
        System.out.println("Enter a number between 0 and 9") ;
        num = input.next() ;
        x = Integer.parseInt(num) ;
      
      } while ((x<=0)||(x>9)) ;
      
      for(i=1; count<10; i++) {
        for(a=1,b=1; a<=i;) {
          sum=a+b ;
          a=b ;
          b=a ;
          if ((a%x)==0) {
            myarr[count] = a ;
            System.out.println(myarr[count]) ;
            count+=1 ;
          }
        }
        
      }
      
    
    
    } 
  
  }
