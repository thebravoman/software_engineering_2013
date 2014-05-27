package org.elsys.graphics_2014_a;

import java.awt.Rectangle;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.MouseListener;
import org.eclipse.swt.events.MouseMoveListener;
import org.eclipse.swt.events.PaintEvent;
import org.eclipse.swt.events.PaintListener;
import org.eclipse.swt.graphics.GC;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Canvas;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

public class MainClass {
	
	private static Point fp;
	private static Point lp;
	private static Point mrel;
	private static int index;
	private static boolean trigger = false;
	private static List<Rectangle> lr = new ArrayList();
	private static boolean redraw = false;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Display d = new Display();
		Shell shell = new Shell(d);
		shell.setSize(640, 480);

		shell.setLayout(new FillLayout());
		Canvas c = new Canvas(shell, SWT.NONE);
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
			
			public void mouseMove(MouseEvent e) {
				GC gc = new GC(c);
				if(trigger){
					Rectangle r = lr.get(index);
					gc.setForeground(Display.getCurrent().getSystemColor(SWT.COLOR_WHITE));
					gc.drawLine(r.x, r.y, r.width, r.height);
					gc.setForeground(Display.getCurrent().getSystemColor(SWT.COLOR_BLACK));
					r.x += e.x-mrel.x;
					r.y += e.y-mrel.y;
					r.width += e.x-mrel.x;
					r.height += e.y-mrel.y;
					lr.set(index, r);
				}
				if(redraw){
					//c.redraw();
					if(lp!=null){
						gc.setForeground(Display.getCurrent().getSystemColor(SWT.COLOR_WHITE));
						gc.drawLine(fp.x, fp.y, lp.x, lp.y);
						gc.setForeground(Display.getCurrent().getSystemColor(SWT.COLOR_BLACK));
						gc.drawLine(fp.x, fp.y, e.x, e.y);
					}
					lp = new Point(e.x, e.y);
				}
				for(Rectangle r : lr){
					gc.drawLine(r.x, r.y, r.width, r.height);
				}
				gc.dispose();
				
				mrel = new Point(e.x, e.y);
				
			}
		});
	}

	private static void createMouseListener(final Canvas c) {
		c.addMouseListener(new MouseListener() {

			@Override
			public void mouseDoubleClick(MouseEvent e) {
				c.redraw();
			}

			@Override
			public void mouseDown(MouseEvent e) {
				// TODO Auto-generated method stub
				if(e.button == 1){
					fp = new Point(e.x, e.y);
					redraw = true;
				}
				else{
					for(int i = 0; i < lr.size(); ++i){
						Rectangle r = lr.get(i);
						int x = r.x > r.width ? r.width: r.x;
						int y = r.y > r.height ? r.height : r.y;
						int w = r.width > r.x ? r.width : r.x;
						int h = r.height > r.y ? r.height : r.y;
						if(e.x > x && e.y > y && e.x < w && e.y < h){
							index = i;
							trigger = true;
							break;
						}
					}
				}
			}

			@Override
			public void mouseUp(MouseEvent e) {
				// TODO Auto-generated method stub
				if(e.button == 1){
					redraw = false;
					lp = new Point(e.x, e.y);
					lr.add(new Rectangle(fp.x, fp.y, lp.x, lp.y));
				}
				else{
					trigger = false;
				}
			}
			
		});
		
	}

	private static void createPaintListener(Canvas c) {
		c.addPaintListener(new PaintListener() {
			
			@Override
			public void paintControl(PaintEvent e) {
				// TODO Auto-generated method stub
			}
		});
	}

}
