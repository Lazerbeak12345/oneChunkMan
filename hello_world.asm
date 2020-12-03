(This is a assembly file in a custom syntax I made for my uses.
The syntax is as follows:

- A parenthasis ( starts a comment. Just like lisp's #|, comments can be nested.
- A close paren ) closes a comment. Note how this is valid syntax.
- Sortof like Fortran, all lines that aren't inside a comment require a number. 
These numbers must be incrementing by one, or a range, if the data to the right 
allows it. (ranges are in number dash number format)
- Immidiatly after the number or range is a character that indicates the nature
of the data that will be stored in said location(s)
  - If the character is a colon : then the rest of the line is the name of the
  instruction that is stored here
  - If the character is a pound # then the rest of the line is a decimal number
  that will be stored at this location
  - If the character is a doublequote " then the range between this and the next
  doublequote is character data that will be included in the specified location
  or range. Specifying said location or range is mandatory.
)
0:NEX
1#19(after hello world)
2:SW
3:IFG
4-17"Hello, World!"
18#0(C-style trailing null)
19:NEX
20#4(counter, start of hellow world)
21:SW
22:NEX
23#42(end of program)
24:SW
25:IFG
26:IO
27:NEX
28#20(a reference to the counter above)
29:SW
30:GET
31:SW
32:MATH
33:NEX
34#20
35:SET
36:SW
37:NEX
38#22(before null check)
39:SW
40:WIP
41:IFG

