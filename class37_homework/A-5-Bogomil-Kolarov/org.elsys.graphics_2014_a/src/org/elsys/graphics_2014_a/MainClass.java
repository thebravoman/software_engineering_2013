package org.elsys.graphics_2014_a;

import java.util.ArrayList;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.MouseListener;
import org.eclipse.swt.events.MouseMoveListener;
import org.eclipse.swt.events.PaintEvent;
import org.eclipse.swt.events.PaintListener;
import org.eclipse.swt.graphics.GC;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Canvas;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

public class MainClass implements MouseListener {
	
	private static Point fp;
	
	private static Point lp;
	
	private static ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();
	
	static Rectangle tmpRect;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Display d = new Display();
		Shell shell = new Shell(d);

		shell.setLayout(new FillLayout());
		Canvas c = new Canvas(shell, SWT.NONE);
		c.setSize(100, 100);
		c.setBackground(Display.getCurrent().getSystemColor(SWT.COLOR_WHITE));
		
		shell.open();

		createPaintListener(c);
		createMouseListener(c);
		createMoveListener(c);
		while(!shell.isDisposed()) {
			if(!d.readAndDispatch()) {
				d.sleep();	
			}
		}
		
		d.dispose();
	}

	private static void createMoveListener(final Canvas c) {
		// TODO Auto-generated method stub
		c.addMouseMoveListener(new MouseMoveListener() {
			
			@Override
			public void mouseMove(MouseEvent e) {
				// TODO Auto-generated method stub
				
			}
		});
	}

	private static void createMouseListener(final Canvas c) {
		c.addMouseListener(new MouseListener() {

			@Override
			public void mouseDoubleClick(MouseEvent e) {
				// TODO Auto-generated method stub
				
			}

			@Override
			public void mouseDown(MouseEvent e) {
				// TODO Auto-generated method stub
				if(e.button == 1) {
					if (fp == null) {
						fp = new Point(e.x, e.y);
					} 
				} else if(e.button == 3) {
					for(Rectangle rect : rectangles) {
						if(e.x > rect.x && e.y > rect.y) {
							if(e.x < rect.x + rect.width && e.y < rect.y + rect.height) {
								tmpRect = rect;
								rectangles.remove(rect);
								
								break;
							}
						}
					}
					
				}
			}

			@Override
			public void mouseUp(MouseEvent e) {
				// TODO Auto-generated method stub
				if(e.button == 1) {
					lp = new Point(e.x, e.y);
					int width = lp.x - fp.x;
					int height = lp.y - fp.y;
					
					drawRect(fp.x, lp.y, width, height, c);
					
					fp = null;
					
				} else if(e.button == 3 && tmpRect != null) {
					tmpRect.x = e.x;
					tmpRect.y = e.y;
					
					rectangles.add(tmpRect);
					c.redraw();
					c.update();
					GC gc = new GC(c);
					System.out.println(rectangles);
					for(Rectangle rect : rectangles) {
						System.out.println("x = " + rect.x);
						System.out.println("y = " + rect.y);
						gc.drawRectangle(rect);
					}

					gc.dispose();
				}
			}
			
			
		});
		
	}

	protected static void drawRect(int x, int y, int width, int height, Canvas c) {
		// TODO Auto-generated method stub
		
		Rectangle rect = new Rectangle(fp.x, fp.y, width, height);
		System.out.println("1x = " + rect.x);
		System.out.println("2y = " + rect.y);
		GC gc = new GC(c);
		gc.drawRectangle(rect);
		rectangles.add(rect);
		gc.dispose();
	}

	private static void createPaintListener(Canvas c) {
		c.addPaintListener(new PaintListener() {
			
			@Override
			public void paintControl(PaintEvent e) {
				// TODO Auto-generated method stub
			}
		});
	}

	@Override
	public void mouseDoubleClick(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseDown(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseUp(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}

}
