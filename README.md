# One Chunk Man

An Instruction Set Archetecture made for minecraft CPUs.
Named as such because we want this to easily fit within one chunk.

## About the version numbers

Right now, v2 is most likely to be what is implimented, as its simpler than v3,
yet _much_ faster than v1 (when using tapes for memory).

- v0: The first version. Not documented here, also, I'm not sure if it worked
anyway.
- v1: The next version. Also, so far, perhaps the simplist one. Very slow if
the memory is implimented as a tape, as it can only do either one-way tapes, or
RAM.
- v2: More or less v1, but with support for 2 direction tapes added. (For this
reason, even if the instructions had the same opcodes, now that all pointers
are relitive to where they are called, it is _not_ compatible with v1 or v0)
- v3: v2, but with any number of registers, and an additional command to
"shift" them. Should be binary compatible with v2.

