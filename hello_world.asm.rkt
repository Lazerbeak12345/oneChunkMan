#!/usr/bin/env racket
#lang OCM_emu
(This is a assembly file in a custom syntax I made for my uses.
The syntax is as follows:

- A parenthasis starts a comment.
- A close paren closes a comment.
- All lines that aren't inside a comment require a character that indicates the
nature of the data that will be stored in said locations
  - If the character is a colon : then the rest of the line is the name of the
  instruction that is stored here
  - If the character is a pound # then the rest of the line is a decimal number
  that will be stored at this location
  - If the character is a doublequote " then the range between this and the next
  doublequote is character data that will be included in the specified location
  or range. Specifying said location or range is mandatory.
  - If the character is an at @ then the rest of the line is the name of the
  label that will represent the following line's location. Multiple labels
  may refer to the same location, and are compile-time evaluated only
  - If the character is a percent % then the rest of the line is the name of the
  label that is being referenced, and the line will evaluate to the location of
  where that symbol was defined - note that symbol evaluation is only done at
  compile time, not runtime

Made for OCMv5
)
  :NEXT
  %after-string
  :SWAP
  :NEXT
  #0
  :SUBTRACT (set the overflow bit)
  :SWAP
  :IFGOTO
@begin-string
"HELLO, WORLD!"
@after-string
(we will loop starting at begin-string ending before after-string)

(to make the drifting memory pointer, let's first grab it before we put it where
    it goes)
:NEXT
%begin-string
:SWAP
:GET (the location of begin-string is now in [A])
:SWAP
:NEXT
%counter
:SET (@counter now holds the location of @begin-string)

@begin-loop
  :NEXT
  @counter
  #0 (#0 is a dummy value - this starts with location of @begin-string)
  (is @counter, in [A], higher than location of @after-string?)
    :SWAP
    :NEXT
    %after-string
    :SWAP
    :SUBTRACT
  (if so then we break)
    :NEXT
    %halt
    :IFGOTO
  (else we get the character @counter is pointing to)
    :NEXT
    %counter ([A] is now location of @counter)
    :SWAP ([B] is now location of @counter)
    :GET ([A] is now location of current char, [B] is location of @counter)
    :SWAP
    :GET ([A] is now the char, [B] is the char's location)

    (print that char)
      :SENDOUT
    (increase @counter by one)
      (increase by one)
        :NEXT
        #1
        :ADD
        (if an unlikely overflow happens)
          :SWAP(remember - until the ifgoto this code still runs)
          :NEXT
          %increase-counter-failed
          :IFGOTO
      (update @counter)
        :NEXT
        %counter
        :SWAP
        :SET
    (then return to @begin-loop)
      :NEXT
      %begin-loop
      :SWAP
      :NEXT
      #0
      :SUBTRACT
      :SWAP
      :IFGOTO
:HALT (something badly wrong)
@increase-counter-failed
  :HALT
@halt
  :HALT (normal halt condition)
