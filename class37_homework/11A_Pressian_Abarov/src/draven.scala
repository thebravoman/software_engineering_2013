import org.eclipse.swt._
import org.eclipse.swt.widgets._
import org.eclipse.swt.graphics._
import org.eclipse.swt.events._
import org.eclipse.swt.layout.FillLayout;
import scala.collection.mutable.ArrayBuffer

object Draven {
	var dravens = new ArrayBuffer[Label]
	var selected: Label = _

	def main(args: Array[String]) {
		val display = new Display()
		val shell = new Shell(display)
		val canvas = new Canvas(shell, SWT.NONE)
		val dravenhead = new Image(display, "draven.png")
		
		canvas.addMouseListener(new MouseListener() {
			def mouseUp(event: MouseEvent) = {}
			def mouseDoubleClick(event: MouseEvent) {
				val label = new Label(canvas, SWT.NONE)
				label.setImage(dravenhead)
				label.setSize(120, 120)
				label.setLocation(event.x, event.y)
				
				label.addMouseListener(new MouseListener() {
					def mouseUp(event: MouseEvent) = if(selected == null) selected = label else selected = null
					def mouseDoubleClick(event: MouseEvent) = {}
					def mouseDown(event: MouseEvent) = {}
				})
				dravens += label
			}
			def mouseDown(event: MouseEvent) {}
		})
		
		canvas.addMouseMoveListener(new MouseMoveListener() {
			def mouseMove(event: MouseEvent) = if(selected != null) selected.setLocation(event.x, event.y)
		})
		
		canvas.setBackground(Display.getCurrent().getSystemColor(SWT.COLOR_BLACK))
		shell.setLayout(new FillLayout())

		shell.open()
		while(!shell.isDisposed()) {
			if(!display.readAndDispatch())
				display.sleep()
		}

		display.dispose
		dravenhead.dispose
	}
}
