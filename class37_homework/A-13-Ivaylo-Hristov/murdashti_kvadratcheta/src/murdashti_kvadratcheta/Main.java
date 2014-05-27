package murdashti_kvadratcheta;

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
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Canvas;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Shell;

import java.util.ArrayList;
public class Main {
	
	private static boolean buttonPressed;
	private static boolean movingObject;
	private static boolean drawingRect;
	private static Point fp;
	private static Point mp;
	private static Rectangle movingRect;
	private static ArrayList<Rectangle> rects = new ArrayList<Rectangle>();
	
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
		
		final Button button = new Button(canvas, SWT.PUSH);
	    button.setBounds(10, 10, canvas.getSize().x - 20, 40);
	    button.setText(buttonPressed ? "active" : "inactive");
	    
	    button.addListener(SWT.Selection, new Listener() {
	    	public void handleEvent(Event e) {
	    		switch (e.type) {
	    		case SWT.Selection:
	    			buttonPressed = !buttonPressed;
	    			button.setText(buttonPressed ? "active" : "inactive");
	    			break;
	    		}
	    	}
	    });
	    
		while(!shell.isDisposed()) {
			if(!display.readAndDispatch()) {
				display.sleep();
			}
		}
		
		display.dispose();
	}

	private static void createMoveListener(final Canvas canvas) {
		canvas.addMouseMoveListener(new MouseMoveListener() {
			
			@Override
			public void mouseMove(MouseEvent e) {
				if (movingObject) {
					GC gc = new GC(canvas);
					canvas.redraw();
					canvas.update();
					Rectangle newRect = new Rectangle(
							movingRect.x + (e.x - mp.x),
							movingRect.y + (e.y - mp.y),
							movingRect.width,
							movingRect.height);
					gc.drawRectangle(newRect);
					for (Rectangle rect : rects) {
						gc.drawRectangle(rect);
					}
					gc.dispose();
				} else if (drawingRect) {
					GC gc = new GC(canvas);
					canvas.redraw();
					canvas.update();
					
					Rectangle newRect = new Rectangle(
							fp.x,
							fp.y,
							e.x - fp.x,
							e.y - fp.y);
					
					gc.drawRectangle(newRect);
					for (Rectangle rect : rects) {
						gc.drawRectangle(rect);
					}
					gc.dispose();
				}
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
				System.out.println(rects);
				if (buttonPressed) {
					for (Rectangle rect : rects) {
						if (e.x > rect.x && e.y > rect.y) {
							if (e.x < rect.x + rect.width && e.y < rect.y + rect.height) {
								movingObject = true;
								movingRect = rect;
								mp = new Point(e.x, e.y);
								break;
							}
						}
					}
					rects.remove(movingRect);
				} else {
					if (fp == null) {
						drawingRect = true;
						fp = new Point(e.x, e.y);
					}
				}
			}

			@Override
			public void mouseUp(MouseEvent e) {
				// TODO Auto-generated method stub
				if (movingObject) {
					GC gc = new GC(canvas);
					canvas.redraw();
					canvas.update();
					Rectangle newRect = new Rectangle(
							movingRect.x + (e.x - mp.x),
							movingRect.y + (e.y - mp.y),
							movingRect.width,
							movingRect.height);
					rects.add(newRect);
					
					for (Rectangle rect : rects) {
						gc.drawRectangle(rect);
					}
					
					movingObject = false;
					movingRect = null;
					mp = null;
					gc.dispose();
				} else if (drawingRect) {
					Point lp = new Point(e.x, e.y);
					int rectX = fp.x;
					int rectY = fp.y;
					int rectWidth = lp.x - fp.x;
					int rectHeight = lp.y - fp.y;
					
					if (rectWidth < 0 || rectHeight < 0) {
						rectWidth = Math.abs(rectWidth);
						rectHeight = Math.abs(rectHeight);
						
						rectX -= rectWidth;
						rectY -= rectHeight;
					}
					
					Rectangle newRect = new Rectangle(rectX, rectY, rectWidth, rectHeight);

					rects.add(newRect);
					
					GC gc = new GC(canvas);
					gc.drawRectangle(newRect);
					
					drawingRect = false;
					fp = null;
					gc.dispose();
				}
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
