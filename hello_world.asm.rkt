#lang OCM_emu
(This is a assembly file in a custom syntax I made for my uses.
The syntax is as follows:

- A parenthasis starts a comment.
- A close paren closes a comment.
- Sortof like Fortran, all lines that aren't inside a comment require a number. 
These numbers must be incrementing by one, or a range, if the data to the right 
allows it. ranges are in number dash number format
- Immidiately after the number or range is a character that indicates the nature
of the data that will be stored in said locations
  - If the character is a colon : then the rest of the line is the name of the
  instruction that is stored here
  - If the character is a pound # then the rest of the line is a decimal number
  that will be stored at this location
  - If the character is a doublequote " then the range between this and the next
  doublequote is character data that will be included in the specified location
  or range. Specifying said location or range is mandatory.

Made for OCMv2.0
)
0:NEX
1#14(after hello world, using 18 as SW)
2:SW
3:IFG
4-17"Hello, World!"
18#0(C-style trailing null and SW)
19:DIR (Change to backwards direction)
20:NEX
21#18(counter, start of hello world)
22:SW
23:GET
24:SW
25:NEX
26#0
27:DIR (Change to forwards direction)
28:NEX
29#49(end of program)
30:SW
31:IFG
32:IO
33:SW
34:NEX
35#14(a reference to the counter above)
36:SW
37:GET
38:MATH
39:NEX
40#21(another reference to above counter)
41:SW
42:SET
43:SW
44:NEX
45#25(before null check)
46:DIR (Change to backwards direction)
47:SW
48:NEX
49#0
50:IFG

