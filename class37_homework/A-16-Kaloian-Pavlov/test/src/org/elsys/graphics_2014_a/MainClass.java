package org.elsys.graphics_2014_a;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.MouseListener;
import org.eclipse.swt.events.MouseMoveListener;
import org.eclipse.swt.events.PaintEvent;
import org.eclipse.swt.events.PaintListener;
import org.eclipse.swt.graphics.GC;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Canvas;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Shell;

import java.util.ArrayList;
public class MainClass {
	
	private static Point fp;
	private static boolean mouseDownOnce = false;  
	private static boolean buttonPressed = false;
	private static Point startPos;
	private static Point endPos;
	private static Point lastPoint;
	private static ArrayList<Point> points = new ArrayList<Point>();
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Display display = new Display();
		Shell shell = new Shell(display);

		shell.setLayout(new FillLayout());
		Canvas canvas = new Canvas(shell, SWT.NONE);
		canvas.setSize(100, 100);
		canvas.setBackground(Display.getCurrent().getSystemColor(SWT.COLOR_WHITE));
		
		shell.open();
		createPaintListener(canvas);
		createMouseListener(canvas);
		createMoveListener(canvas);
		Button button = new Button(canvas, SWT.PUSH);
	    button.setBounds(10, 10, 300, 40);
	    
	    button.addListener(SWT.Selection, new Listener() {
	        public void handleEvent(Event e) {
	          switch (e.type) {
	          case SWT.Selection:
	            if(buttonPressed) {
	            	buttonPressed = false;
	            } else {
	            	buttonPressed = true;
	            }
	            break;
	          }
	        }
	      });
	    
		while(!shell.isDisposed()) {
			if(!display.readAndDispatch()) {
				display.sleep();
			}
		}
		
		for(Point p : points) {
			System.out.println(p.x + " " + p.y);
		}
		display.dispose();
	}

	private static void createMoveListener(final Canvas canvas) {
		canvas.addMouseMoveListener(new MouseMoveListener() {
			@Override
			public void mouseMove(MouseEvent e) {
				if(buttonPressed && startPos != null && endPos != null) {
					GC gc = new GC(canvas);
					canvas.redraw();
					canvas.update();
					for(int i = 1; i < points.size(); i+=2) {
						gc.drawLine(points.get(i-1).x - startPos.x + endPos.x,
								points.get(i-1).y - startPos.y + endPos.y,
								points.get(i).x - startPos.x + endPos.x,
								points.get(i).y - startPos.y + endPos.y) ;
					}
					endPos = null;
					startPos = null;
					gc.dispose();
					return;
				}
				GC gc = new GC(canvas);
				lastPoint = new Point(e.x,e.y);
				if(fp != null){
					canvas.redraw();
					canvas.update();
					gc.drawLine(fp.x, fp.y, lastPoint.x, lastPoint.y);
					for(int i = 1; i < points.size(); i+=2) {
						gc.drawLine(points.get(i-1).x, points.get(i-1).y, points.get(i).x, points.get(i).y);
					}
				}
				gc.dispose();
			}
		});
	}

	private static void createMouseListener(final Canvas canvas) {
		canvas.addMouseListener(new MouseListener() {

			@Override
			public void mouseDoubleClick(MouseEvent e) {
				// TODO Auto-generated method stub
				
			}

			@Override
			public void mouseDown(MouseEvent e) {
				// TODO Auto-generated method stub
				if(buttonPressed) {
					if(mouseDownOnce){
						endPos = new Point(e.x, e.y);
						mouseDownOnce = false;
					} else {
						startPos = new Point(e.x, e.y);
						mouseDownOnce = true;
					}
					return;
				}
				if(mouseDownOnce){
					mouseDownOnce = false;
				} else {
					mouseDownOnce = true;
				}
				if (fp == null) {
					fp = new Point(e.x, e.y);
				} else {
					GC gc = new GC(canvas);
					gc.drawLine(fp.x, fp.y, e.x, e.y);
					if(!mouseDownOnce){
						points.add(fp);
						points.add(lastPoint);
					}
					canvas.update();
					gc.dispose();
					fp = null;
				}
			}

			@Override
			public void mouseUp(MouseEvent e) {
				// TODO Auto-generated method stub
			}
			
		});
		
	}

	private static void createPaintListener(Canvas canvas) {
		canvas.addPaintListener(new PaintListener() {
			
			@Override
			public void paintControl(PaintEvent e) {
				// TODO Auto-generated method stub
			}
		});
	}

}
