package org.elsys.se.class37_homework;

import java.util.Collection;
import java.util.LinkedList;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.MouseListener;
import org.eclipse.swt.events.MouseMoveListener;
import org.eclipse.swt.events.PaintEvent;
import org.eclipse.swt.events.PaintListener;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Canvas;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

public class CMainClass
{
	private static Collection< CLine > sLines = new LinkedList< CLine >( );
	private static CLine sDrawingLine;
	private static CLine sMovingLine;
	private static Point sMovingPoint;
	
	public static void main( String []args )
	{
		Display tDisplay = new Display( );
		
		Shell tShell = new Shell( tDisplay );
		tShell.setLayout( new FillLayout( ) );
		
		Canvas tCanvas = new Canvas( tShell, SWT.NONE );
		tCanvas.setSize( 100, 100 );
		tCanvas.setBackground(
			Display.getCurrent( ).getSystemColor( SWT.COLOR_WHITE ) );
		
		createPaintListener( tCanvas );
		createMouseListener( tCanvas );
		createMoveListener( tCanvas );
		
		tShell.open( );
		
		while( !tShell.isDisposed( ) )
		{
			if( !tDisplay.readAndDispatch( ) )
				tDisplay.sleep( );
		}
		
		tDisplay.dispose();
	}

	private static void createMoveListener( final Canvas nCanvas )
	{
		nCanvas.addMouseMoveListener( new MouseMoveListener( ) {
			public void mouseMove( MouseEvent nEvent )
			{
				if( sDrawingLine != null )
				{
					sDrawingLine.mLast.x = nEvent.x;
					sDrawingLine.mLast.y = nEvent.y;
					
					nCanvas.redraw( );
				}
				
				if( sMovingLine != null )
				{
					sMovingLine.mFirst.x += nEvent.x - sMovingPoint.x;
					sMovingLine.mFirst.y += nEvent.y - sMovingPoint.y;

					sMovingLine.mLast.x += nEvent.x - sMovingPoint.x;
					sMovingLine.mLast.y += nEvent.y - sMovingPoint.y;
					
					sMovingPoint.x = nEvent.x;
					sMovingPoint.y = nEvent.y;
					
					nCanvas.redraw( );
				}
			}
		} );
	}

	private static void createMouseListener( final Canvas nCanvas )
	{
		nCanvas.addMouseListener( new MouseListener( ) {
			public void mouseDoubleClick( MouseEvent nEvent )
			{
			}

			public void mouseDown( MouseEvent nEvent )
			{
			}

			public void mouseUp( MouseEvent nEvent )
			{
				if( sDrawingLine != null )
					sDrawingLine = null;
				else if( sMovingLine != null )
					sMovingLine = null;
				else
				{
					// NOTE: apparently hardcoding the values
					// is the way SWT does this...
					if( nEvent.button == 1 )
					{
						sDrawingLine = new CLine( nEvent.x, nEvent.y );
						sLines.add( sDrawingLine );
					}
					else
					{
						sMovingPoint = new Point( nEvent.x, nEvent.y );
						int tMinD = Integer.MAX_VALUE;
						
						for( CLine tLine : sLines )
						{
							int tDx = tLine.mLast.x - tLine.mFirst.x;
							int tDy = tLine.mLast.y - tLine.mFirst.y;
							int tD = Math.abs(
								tDy*sMovingPoint.x - tDx*sMovingPoint.y -
								tLine.mFirst.x*tLine.mLast.y +
								tLine.mLast.x*tLine.mFirst.y
							);
							tD /= Math.sqrt( tDx*tDx + tDy*tDy );
							
							if( tD < tMinD )
							{
								tMinD = tD;
								sMovingLine = tLine;
							}
						}
					}
				}
			}
		} );
	}

	private static void createPaintListener( final Canvas nCanvas )
	{
		nCanvas.addPaintListener( new PaintListener( ) {
			public void paintControl( PaintEvent nEvent )
			{
				for( CLine tLine : sLines )
					nEvent.gc.drawLine( tLine.mFirst.x, tLine.mFirst.y,
						tLine.mLast.x, tLine.mLast.y );
			}
		} );
	}
}
