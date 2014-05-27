package org.elsys.graphics_2014;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.MouseListener;
import org.eclipse.swt.events.MouseMoveListener;
import org.eclipse.swt.events.PaintEvent;
import org.eclipse.swt.events.PaintListener;
import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.graphics.GC;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Canvas;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.TableItem;
import org.eclipse.swt.dnd.*;

public class MainClass {

	private static Point firstPoint = null;
	private static Point secondPoint = null;

	public static void main(String[] args){
		Display d = new Display();
		Shell shell = new Shell(d);
		shell.setLayout(new FillLayout(SWT.HORIZONTAL));
		Canvas c = new Canvas(shell, SWT.NONE);
		c.setBackground(Display.getCurrent().getSystemColor(SWT.COLOR_WHITE));

		shell.open();
		
		
		final Table dropTable = new Table(shell, SWT.BORDER);
			for (int i = 0; i < 10; i++) {
			    TableItem item = new TableItem(dropTable, SWT.NONE);
			    item.setText("item" + i);
		int operations = DND.DROP_MOVE | DND.DROP_COPY | DND.DROP_DEFAULT;
		DropTarget target = new DropTarget(dropTable, operations);
		

		final FileTransfer fileTransfer = FileTransfer.getInstance();
		final TextTransfer textTransfer = TextTransfer.getInstance();
				
		target.addDropListener(new DropTargetListener() {
			public void dragEnter(DropTargetEvent event) {
				if (event.detail == DND.DROP_DEFAULT) {
					if ((event.operations & DND.DROP_COPY) != 0) {
						event.detail = DND.DROP_COPY;
					} else {
						event.detail = DND.DROP_NONE;
					}
				}
				for (int i = 0; i < event.dataTypes.length; i++) {
				
					if ( fileTransfer.isSupportedType(event.dataTypes[i])) {
						event.currentDataType = event.dataTypes[i];
						if (event.detail != DND.DROP_COPY) {
							event.detail = DND.DROP_NONE;
						}
					break;
					
					}
				}
			}

			@Override
			public void dragLeave(DropTargetEvent arg0) {
				// TODO Auto-generated method stub
				
			}

			@Override
			public void dragOperationChanged(DropTargetEvent event) {
				// TODO Auto-generated method stub
				if (event.detail == DND.DROP_DEFAULT) {
					if ((event.operations & DND.DROP_COPY) != 0) {
						event.detail = DND.DROP_COPY; 
					} else {
						event.detail = DND.DROP_NONE;
					}
				}
					
			}

			@Override
			public void dragOver(DropTargetEvent event) {
				// TODO Auto-generated method stub
				event.feedback = DND.FEEDBACK_SELECT | DND.FEEDBACK_SCROLL;
				if (textTransfer.isSupportedType(event.currentDataType)) {
					// Oт неподдържани платформи ще върне NULL
					Object o = textTransfer.nativeToJava(event.currentDataType);
					String t = (String)o;
					if (t != null) System.out.println(t);
				} 
			}

			@Override
			public void drop(DropTargetEvent event) {
				// TODO Auto-generated method stub
				if (textTransfer.isSupportedType (event.currentDataType)) {
					String text = (String)event.data;
					TableItem item = new TableItem (dropTable, SWT.NONE);
					item.setText(text);
				}
				if (fileTransfer.isSupportedType(event.currentDataType)) {
					String[] files = (String[])event.data;
					for (int i = 0; i <files.length; i++) {
						TableItem item = new TableItem (dropTable, SWT.NONE);
						item.setText(files[i]);
					}
				}
			}

			@Override
			public void dropAccept(DropTargetEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		createPaintListener(c);
		createMouseListener(c);
		createMoveListener(c);
		while(!shell.isDisposed()){
			if(!d.readAndDispatch()){
				d.sleep();
			}
		}
		}	
	}

	private static void createMoveListener(final Canvas c) {
		c.addMouseMoveListener(new MouseMoveListener() {

			@Override
			public void mouseMove(MouseEvent e) {
				if (firstPoint != null && secondPoint == null) {
					GC gc = new GC(c);
					gc.drawLine(firstPoint.x, firstPoint.y, e.x, e.y);
					gc.dispose();
				}
			}
		});
	}

	private static void createMouseListener(final Canvas c) {
		c.addMouseListener(new MouseListener() {

			@Override
			public void mouseUp(MouseEvent arg0) {

			}

			@Override
			public void mouseDown(MouseEvent e) {
				if (firstPoint == null && secondPoint == null)
					firstPoint = new Point(e.x, e.y);
				// firstPoint, secondPoint == null
				else if (firstPoint != null && secondPoint == null) {
					GC gc = new GC(c);
					secondPoint = new Point(e.x, e.y);
					gc.drawLine(firstPoint.x, firstPoint.y, secondPoint.x,
							secondPoint.y);
					firstPoint = null;
					secondPoint = null;
					gc.dispose();
				}

				// GC gc = new GC(c);
				// gc.drawOval(e.x, e.y, 10, 10);
				// gc.dispose();
			}

			@Override
			public void mouseDoubleClick(MouseEvent arg0) {

			}
		});
	}

	private static void createPaintListener(Canvas c) {
		c.addPaintListener(new PaintListener() {

			@Override
			public void paintControl(PaintEvent e) {
				// GC gc = e.gc;
				// gc.drawLine(0, 0, 100, 100);
				// gc.drawRectangle(100, 100, 100, 100);
				// Image image = new
				// Image(e.display,"/home/student11b/Desktop/Other/cats.jpg");
				// gc.drawImage(image, 200, 0);
			}
		});
	}
}
