package hristiqn_zarkov_27;

import java.awt.Point;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.MouseMoveListener;
import org.eclipse.swt.graphics.GC;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Canvas;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

public class Main {
	private static Point lastPoint = null;
	public static void main(String[] args) {
		Display d = new Display();
		Shell shell = new Shell(d);
		shell.setLayout(new FillLayout(SWT.HORIZONTAL));
		Canvas c = new Canvas(shell, SWT.NONE);
		c.setBackground(Display.getCurrent().getSystemColor(SWT.COLOR_WHITE));
		shell.open();
		createMoveListener(c);
		while(!shell.isDisposed()){
			if(!d.readAndDispatch()){
				d.sleep();
			}
		}
	}

	private static void createMoveListener(final Canvas c) {
		c.addMouseMoveListener(new MouseMoveListener() {
			public void mouseMove(MouseEvent e) {
				GC gc = new GC(c);
				if(lastPoint != null){
					gc.setForeground(Display.getCurrent().getSystemColor(SWT.COLOR_WHITE));
					gc.drawRectangle(lastPoint.x-10,lastPoint.y-10,10,10);
				}
				gc.setForeground(Display.getCurrent().getSystemColor(SWT.COLOR_BLACK));
				gc.drawRectangle(e.x-10,e.y-10,10,10);
				lastPoint = new Point(e.x,e.y);
				gc.dispose();
			}
		});
	}

}
