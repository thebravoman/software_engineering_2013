import org.eclipse.swt._
import org.eclipse.swt.widgets.Canvas
import org.eclipse.swt.widgets.Display
import org.eclipse.swt.widgets.Shell
import org.eclipse.swt.events._

class CPoint(xp: Int, yp: Int) {
	val x = xp
	val y = yp
}
class CLine(firstp: CPoint, secondp: CPoint) {
	val first = firstp
	val second = secondp
}

object LineDrawer {
	var drawLines: List[CLine] = List()
	var lastLine :CLine = new CLine(new CPoint(0,0), new CPoint(0,0))
	var placed : Boolean = false
	def main(args: Array[String]) { 
		val disp = new Display( )
		
		val shell = new Shell( disp )
		
		val canvas = new Canvas( shell, SWT.NONE )
		canvas.setSize( 300, 300)
		canvas.setBackground( Display.getCurrent().getSystemColor(SWT.COLOR_WHITE) )
		
		canvas.addPaintListener(new PaintListener() {
			def paintControl( event: PaintEvent ) = paintEvent(event)
		})
		canvas.addMouseMoveListener(new MouseMoveListener() {
			def mouseMove( event: MouseEvent ) = { mouseMoveEvent(event); canvas.redraw() }
		})
		canvas.addMouseListener(new MouseListener() {
			def mouseUp( event: MouseEvent ) = mouseClickEvent(event)
			def mouseDoubleClick( event: MouseEvent) {}
			def mouseDown(event: MouseEvent) {}
		})
		
		shell.open()
		
		while(!shell.isDisposed()) {
			if( !disp.readAndDispatch() )
				disp.sleep()
		}
		
		disp.dispose
	}
	def paintEvent( event: PaintEvent ) {
		def drawL(gc: graphics.GC, line: CLine) =
			gc.drawLine(line.first.x, line.first.y, line.second.x, line.second.y )
		for(line <- drawLines)
			drawL(event.gc, line)
		if(placed)
			drawL(event.gc, lastLine)
	}
	def mouseMoveEvent( event: MouseEvent ) {
		if(placed) {
			lastLine = new CLine(lastLine.first, new CPoint(event.x,event.y))
		}
	}
	def mouseClickEvent( event: MouseEvent ) {
		if(event.button == 1) {
			if(placed) {
				placed = false
				drawLines = drawLines ::: (new CLine(lastLine.first, new CPoint(event.x,event.y)) :: Nil)
			}else{
				placed = true
				lastLine = new CLine(new CPoint(event.x,event.y), new CPoint(0,0))
			}
		}
	}
}