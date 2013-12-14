package org.elsys.tp;

public interface Evaluator {

	/**
	* @param d
	*
	adds d as a parameter for the evaluation
	*/
	
	void add(double d);
	
	/**
	* @return the evaluated value
	*/
	Double evaluate();

}
