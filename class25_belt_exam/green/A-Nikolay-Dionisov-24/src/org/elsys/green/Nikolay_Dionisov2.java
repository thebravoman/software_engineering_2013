package org.elsys.green;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.LinkedList;

public class Nikolay_Dionisov2 {
	public static int[] parseCmdLine(String input) {
		int[] ret = new int[3];
		String[] parts = input.split("[,]");
		if(parts == null || parts.length != 3) {
			return null;
		}
		
		for(int i = 0; i < 3; i++) {
			ret[i] = Integer.parseInt(parts[i]);
		}
		
		return ret;
	}
	public static void main(String[] args) {
		List<Chart> charts = new LinkedList<Chart> ();
		//get values
		try{
		    BufferedReader bufferRead = new BufferedReader(new InputStreamReader(System.in));
		    while(true) {
		    	String s = bufferRead.readLine();
	 
			    int[] ret = parseCmdLine(s);
			    if(ret == null)
			    {
			    	break;
			    }
			    
			    Chart chart;
			    if(charts.size() % 2 == 0) {
			    	chart = new PieChart();
			    }else{
			    	chart = new BarChart();
			    }
			    chart.setVal1(ret[0]);
			    chart.setVal2(ret[1]);
			    chart.setVal3(ret[2]);
			    charts.add(chart);
		    }
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		
	   for(Chart chart: charts){
           System.out.println(chart.getVal1());
           System.out.println(chart.getVal2());
           System.out.println(chart.getVal3());
       }
	   
	   for(Chart chart: charts){
           if(chart instanceof PieChart){
                   if(chart.getVal2() > 0){
                           ((NikolayDionisov2)chart).nikolay();
                   }
           }
	   }
	   
		
	   for(Chart chart: charts){
           System.out.println(chart.getVal1() + chart.getVal2() + chart.getVal3());
       }
	   
	}
};
