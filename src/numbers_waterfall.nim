# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import illwill
import os
func binaryConversion(x: int): seq[int] =
  if x == 0:
    @[]
  else:
    binaryConversion(x div 2) & (x mod 2)





proc exitProc() {.noconv.} = 
  illwillDeinit()
  showCursor()
  quit(0)


proc main() =
  illwillInit(fullscreen=true)
  setControlCHook(exitProc)
  hideCursor()

  var 
    tb = newTerminalBuffer(terminalWidth(), terminalHeight()) #newbuff
    yPos = 0
    text = "Hello World!"

  while true:
    # Clear the buffer
    tb.clear()
    
    # Draw the text at current y position
    tb.write(0, yPos, text)
    
    # Display the buffer
    tb.display()
    
    # Move text down
    yPos.inc
    if yPos >= terminalHeight():
      yPos = 0
      
    # Add a small delay to control animation speed
    sleep(100) # 100ms delay
    
    # Check for quit
    var key = getKey()
    if key == Key.Q: exitProc()


when isMainModule:
  main()