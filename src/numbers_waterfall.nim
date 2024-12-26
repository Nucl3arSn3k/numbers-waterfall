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


proc bigcall():string =
  let num = rand(2000000000..2147483647)
  let list = binaryConversion(num)
  let stfinal = listToString(list)
  stfinal

proc main(x:string) =
  illwillInit(fullscreen=true)
  setControlCHook(exitProc)
  hideCursor()
  var
    tb = newTerminalBuffer(terminalWidth(), terminalHeight())
    yPos = 0
  
  # Lambda for generating lines
  #let generateLine = () => bigcall()
  
  while true:
    tb.clear()
    tb.setForegroundColor(fgGreen)
    
    
    for y in 0..<terminalHeight():
      for x in 0..<terminalWidth():
        let line = bigcall()
        tb.write(x, y, line[0..min(line.len-1, terminalWidth()-1)])
    
    tb.display()
    sleep(500)
    
    if getKey() == Key.Q: exitProc()




when isMainModule:

  
  main("placehold")
  #echo num
  #echo stfinal
  #echo list
  #main()