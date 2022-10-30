# One Chunk Man

[![Racket](https://img.shields.io/badge/-Made%20with%20Racket-darkred?logo=racket)](https://racket-lang.org)

An Instruction Set Archetecture made for minecraft CPUs.
Named as such because we want this to easily fit within one chunk.

> For now we plan on excluding storage from the chunk. While we are keeping our
> minds open to the idea of having the storage vertical above the chunk, this
> is most likely not possible for a load/store arch that is intended for actual
> use.

## Uses

### What it can be used for (in the context of minecraft)

- 📮 An automated postal service manager. (now you just have to worry about
  keeping chunks loaded! _or do you..._ 🤔)
- 📈 An automated price-adjusting item store. (_stonks_)
- 🚪 Super advanced minecraft doors. (what's advanced here, the computer or
  the door? Probabbly both...)
- 🧠 Alternatives to huge logic systems.
- ₿ Cryptocurrency, but in minecraft?
- 🙃 Any strange combination of the above.
- 🛠 And other things too!

#### But wait! Can't those things be done already?

Yes, I'm sure they can. This is just a few examples of things that can be
easier using a very small (yet turing complete) redstone computer.

#### Examples of minecraft uses

None yet!

### What it can be used for (outside of minecraft)

Heck if I know. The emulator I made seems to be just about as useful as yet
another bf implementation.

#### Examples of non-minecraft uses

None yet!

## Where's the spec(s)?

You can find the specifications of the instruction sets in this repo with the
file extention of `.mm`. These files work best if you open them in Freeplane,
but I think Freemind and other mind-mapping software might be able to open them
as well.

## World download?

Heh. Not quite yet; we are working on making it in minecraft, but to do this
will take a lot longer than it did to make the specification(s) and the
emulator.

## Got an emulator yet?

Yep! Just check out the `./OCM_emu` directory. To use it you will need to
install Racket, then install that directory by running `raco pkg i` in that
directory. At that point you should be able to use `racket` or the "DrRacket"
program to run assembly files made for OCM. Should work on any system Racket
supports (Windows NT, macOS and Unix at time of writing)

## About the version numbers

Right now, v5 is most likely to be what is implimented

- it's easier to use than all previous versions
- It's simpler than v3 and v4
- It's faster than all previous versions

It's safe to assume that each major version offers little to no binary
compatibility with the previous versions unless otherwise noted.

- v0: The first version. Not documented here, also, I'm not sure if it worked
  anyway.
- v1: The next version. Also, so far, perhaps the simplist one. Very slow if
  the memory is implimented as a tape, as it can only do either one-way tapes
  or RAM.
- v2: More or less v1, but with support for 2 direction tapes added. (For this
  reason, even if the instructions had the same opcodes, now that all pointers
  are relitive to where they are called, it is _not_ compatible with v1 or v0).
- v3: v2, but with any number of registers, and an additional command to
  "shift" them. Should be binary compatible with v2.
- v4: Based off of v2 but much easier to program in. Doesn't include changes
  introduced in v3. Does include
  - Longer (more readable) names
  - Seperate math instructions
  - Seperate gpio instructions
  - Seperate direction instructions (this actually makes the code _much_
    faster)
  - A HALT instruction (for this reason alone I question the usibility of the
    previous versions)
  - A no-operation instruction
- v5: A modification to v4.
  - Removes "directions"
  - Adds `[#]` the "current location"
  - Calls registers that the dev can't directly access "banks"
