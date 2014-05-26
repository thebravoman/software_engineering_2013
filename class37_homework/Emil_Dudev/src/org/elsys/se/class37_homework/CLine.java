package org.elsys.se.class37_homework;

import org.eclipse.swt.graphics.Point;

public class CLine
{
	public Point mFirst;
	public Point mLast;

	public CLine( int tX, int tY )
	{
		this.mFirst = new Point( tX, tY );
		this.mLast = new Point( tX, tY );
	}
}
