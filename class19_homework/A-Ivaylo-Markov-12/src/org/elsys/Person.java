package org.elsys;
import java.util.ArrayList;

import org.elsys.util.ContactInfo;

public abstract class Person {
	private static int idCount = 0;
	protected int id;
	protected String name;
	
	ContactInfo contactInfo;
}
