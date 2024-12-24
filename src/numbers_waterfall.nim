# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import illwill
import os
import std/random
import sequtils
randomize() #need to do this because it'll be the same every run,need to randomize the seed
func binaryConversion(x: int): seq[int] =
  if x == 0:
    @[]
  else:
    binaryConversion(x div 2) & (x mod 2)



proc listToString(x: seq[int]): string =
  var res:string = ""
  for i in x:
    res &= $i
  res

proc exitProc() {.noconv.} = 
  illwillDeinit()
  showCursor()
  quit(0)


proc main(x:string) =
  illwillInit(fullscreen=true)
  setControlCHook(exitProc)
  hideCursor()

  var 
    tb = newTerminalBuffer(terminalWidth(), terminalHeight()) #newbuff
    yPos = 0
    text = x

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

  let num = rand(2000000000..2147483647)
  let list = binaryConversion(num)
  let stfinal = listToString(list)
  main(stfinal)
  #echo num
  #echo stfinal
  #echo list
  #main()