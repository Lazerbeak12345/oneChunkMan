(This is a assembly file in a custom syntax I made for my uses.
The syntax is as follows:

- A parenthasis starts a comment.
- A close paren closes a comment.
- Sortof like Fortran, all lines that aren't inside a comment require a number. 
These numbers must be incrementing by one, or a range, if the data to the right 
allows it. ranges are in number dash number format
- Immidiatly after the number or range is a character that indicates the nature
of the data that will be stored in said locations
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
22:GET
23:SW
24:NEX
25#42(end of program)
26:SW
27:IFG
28:SW
29:IO
30:NEX
31#20(a reference to the counter above)
32:SW
33:GET
34:SW
35:MATH
36:NEX
37#20
38:SW
39:SET
40:SW
41:NEX
42#19(before null check)
43:SW
44:WIP
45:IFG

