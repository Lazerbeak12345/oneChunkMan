<map version="freeplane 1.8.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="One Chunk Man ISA" LOCALIZED_STYLE_REF="AutomaticLayout.level,1" FOLDED="false" ID="ID_464494903" CREATED="1607219573097" MODIFIED="1615427771772" BACKGROUND_COLOR="#ffffff"><hook NAME="MapStyle">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" show_icon_for_attributes="true" show_note_icons="true" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="12" RULE="ON_BRANCH_CREATION"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p style="margin-top: 0">
      An Instruction Set Architecture with recommended microcode. Designed by Nathan Fritzler with major feedback from Isaac Fritzler. A similar (earlier) work by Wyatt Brannon may have had some influence in the design of this ISA.
    </p>
    <p style="margin-top: 0">
      This ISA is designed for use in a Minecraft CPU, and is optimized for a small die size.
    </p>
    <p style="margin-top: 0">
      
    </p>
    <p style="margin-top: 0">
      version 5
    </p>
  </body>
</html>
</richcontent>
<hook NAME="accessories/plugins/AutomaticLayout.properties" VALUE="ALL"/>
<node LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_616789481" CREATED="1607219868820" MODIFIED="1615427508641"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p style="text-align: right">
      RAM
    </p>
  </body>
</html>
</richcontent>
<edge COLOR="#ff00ff"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Max size is max number that can be stored in a register
    </p>
    <p>
      Min length is 50 or so
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="IO ports" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_1901169444" CREATED="1607219827930" MODIFIED="1607304717865" HGAP_QUANTITY="16.999999910593033 pt" VSHIFT_QUANTITY="-20.99999937415125 pt">
<edge COLOR="#00007c"/>
<node TEXT="&lt;IN&gt;" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_851196832" CREATED="1607219856073" MODIFIED="1607304749187"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Communication from things outside of computer
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="&lt;OUT&gt;" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1420013192" CREATED="1607219842867" MODIFIED="1607304749180"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Communication to things outside of computer
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Registers" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_249625636" CREATED="1607219751399" MODIFIED="1615427900163">
<edge COLOR="#0000ff"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      A place to store things
    </p>
    <p>
      Min size should be as long as the tape.
    </p>
    <p>
      Defaults to zeros.
    </p>
  </body>
</html>
</richcontent>
<node TEXT="[A]" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1134177843" CREATED="1607219768574" MODIFIED="1607576994454"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Fastest at Write. Is changed by almost everything.
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="[B]" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1834691667" CREATED="1607219776477" MODIFIED="1607576976437"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Can only be modified by MATH, SW and IO
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Banks" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_1442531395" CREATED="1607219751399" MODIFIED="1615074104995">
<edge COLOR="#7c7c00"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Like a register, but can't be directly accessed by the progammer.
    </p>
  </body>
</html>
</richcontent>
<node TEXT="[@]" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_632789344" CREATED="1607219779816" MODIFIED="1607577167416"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Current state determines what Instruction the computer is currently doing. Can only be set to the current value in the tape. (and is only modified by {GO})
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="[#]" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1020182605" CREATED="1607219779816" MODIFIED="1615073900173"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Can only be read by the memory system that manages current location, but can be written by any Instruction (or signal?) This address is effectivly the &quot;current location&quot;
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Signals" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_1774914395" CREATED="1607219662865" MODIFIED="1607577250876" HGAP_QUANTITY="22.999999731779106 pt" VSHIFT_QUANTITY="-8.249999754130847 pt" MAX_WIDTH="222.41379225828155 pt" MIN_WIDTH="222.41379225828155 pt">
<edge COLOR="#ff0000"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Basically Microcode.
    </p>
    <p>
      Before sending a signal, wait for things to be done. (we might not need to wait if the player directly sent this signal?)
    </p>
  </body>
</html>
</richcontent>
<node TEXT="{POWER}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_685222002" CREATED="1607219710386" MODIFIED="1607304749193"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Starts as off.
    </p>
    <p>
      User can turn it on or off. (with a lever?)
    </p>
  </body>
</html>
</richcontent>
</node>
<node LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1629027373" CREATED="1607280000914" MODIFIED="1615428181752"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      {OVERFLOW}
    </p>
  </body>
</html>
</richcontent>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Starts as off.
    </p>
    <p>
      Turned on whenever there's an overflow, and oft used in conditional statements
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="{GO}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1870565492" CREATED="1607219742934" MODIFIED="1607304749201"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Monostable
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Wait until {POWER} signal is on" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1725614072" CREATED="1607224035873" MODIFIED="1607577141493" LINK="#ID_685222002"/>
<node TEXT="Update [@] bank to the number at [#] in the tape" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_87150273" CREATED="1607224072096" MODIFIED="1615423467060"/>
</node>
<node TEXT="{ROTATEONE}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_943501620" CREATED="1607219732866" MODIFIED="1615073529346"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Monostable
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Increase [#] by one" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1524550912" CREATED="1607223724324" MODIFIED="1615074250200"/>
</node>
<node TEXT="{STEP}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1997648288" CREATED="1607219732866" MODIFIED="1607304749203"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Monostable
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Send {ROTATEONE} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_77475732" CREATED="1607223724324" MODIFIED="1615073625554" LINK="#ID_943501620"/>
<node TEXT="Send {GO} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1393818571" CREATED="1607223735834" MODIFIED="1607577185902" LINK="#ID_1870565492"/>
</node>
</node>
<node TEXT="Instructions" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_685631083" CREATED="1607224217949" MODIFIED="1607304717870">
<edge COLOR="#7c0000"/>
<node TEXT="Do nothing (NOP, 0)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1398278412" CREATED="1607224440797" MODIFIED="1615074657763"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Does nothing. Moves on to the next instruction.
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_205241004" CREATED="1607225902618" MODIFIED="1607577378060" LINK="#ID_943501620"/>
</node>
<node TEXT="Halt (HALT, 1)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1334270010" CREATED="1607224440797" MODIFIED="1613541525490"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Should prevent the computer from doing anything else
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Set {POWER} to off" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_212810566" CREATED="1607225902618" MODIFIED="1613542055786" LINK="#ID_943501620"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Alternatively, literally don't do anything. As long as you never send {GO} or {STEP} then this will also work. We would only change {POWER} if that would make the user experience better.
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Swap (SWAP, 2)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_864447605" CREATED="1607224440797" MODIFIED="1615074669874"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Most used. Swaps [A] and [B]
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Swaps values stored in [A] register and [B] register" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_87717248" CREATED="1607225734926" MODIFIED="1607577372486" LINK="#ID_249625636"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_818803402" CREATED="1607225902618" MODIFIED="1607577378060" LINK="#ID_943501620"/>
</node>
<node TEXT="Get Next (NEXT, 3)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_452603626" CREATED="1607224468245" MODIFIED="1615074681112"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Puts the next value in ram in [A]
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Send {ROTATEONE} signal" ID="ID_230543934" CREATED="1615073554815" MODIFIED="1615073620616" LINK="#ID_943501620"/>
<node TEXT="Set [A] register to the number at [#] in the ram" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1007724205" CREATED="1607228208571" MODIFIED="1615422619149" LINK="#ID_1134177843"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_746298979" CREATED="1607299604050" MODIFIED="1607577468748" LINK="#ID_943501620"/>
</node>
<node TEXT="Get (GET, 4)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_551750208" CREATED="1607224451403" MODIFIED="1615421748407"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Get value at ram position [B] and put it in [A]
    </p>
    <p>
      In some architectures this would be called &quot;load&quot;
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Set [A] register to the number at [B] in the ram" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1018453250" CREATED="1607228208571" MODIFIED="1615422622795" LINK="#ID_1134177843"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_324906770" CREATED="1607299604050" MODIFIED="1607577468748" LINK="#ID_943501620"/>
</node>
<node TEXT="Set (SET, 5)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1775466053" CREATED="1607224800546" MODIFIED="1615423853658"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Inverse of GET (put value in [A] in the ram at location [B])
    </p>
    <p>
      In some architectures this would be called &quot;store&quot;
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Set the number that&apos;s in the ram at [B] to the value in the [A] register" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1529112546" CREATED="1607227990672" MODIFIED="1615423934667" LINK="#ID_1134177843"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1907151668" CREATED="1607299604050" MODIFIED="1607577468748" LINK="#ID_943501620"/>
</node>
<node TEXT="If Goto (IFGOTO, 6)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_858237275" CREATED="1607224338236" MODIFIED="1615424171981"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Conditionally move to [B]
    </p>
  </body>
</html>
</richcontent>
<node TEXT="If {OVERFLOW} is on" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1586555808" CREATED="1607225208609" MODIFIED="1613540948462" LINK="#ID_1134177843">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Set [#] bank to the number in [B]" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1855447397" CREATED="1607228208571" MODIFIED="1615424161852" LINK="#ID_1134177843"/>
<node TEXT="Send {GO} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_196256595" CREATED="1607225290716" MODIFIED="1607577336830" LINK="#ID_1870565492"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_587045414" CREATED="1607225222996" MODIFIED="1607305580747">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_676337795" CREATED="1607225353544" MODIFIED="1607577341621" LINK="#ID_943501620"/>
</node>
</node>
<node TEXT="Read Input (READIN, 7)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_398636506" CREATED="1607224576012" MODIFIED="1615428065085" LINK="#ID_1901169444"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Reads GPIO and puts it in [A]
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Change the value of [A] register to &lt;IN&gt;" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_962490077" CREATED="1607227803978" MODIFIED="1613540064777" LINK="#ID_851196832"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1361778221" CREATED="1607227918927" MODIFIED="1607577531781" LINK="#ID_943501620"/>
</node>
<node TEXT="Send Output (SENDOUT, 8)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1429088621" CREATED="1607224576012" MODIFIED="1615428069821" LINK="#ID_1901169444"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Sends GPIO the value in [A]
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Change the value of &lt;OUT&gt; to [A]" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_818595852" CREATED="1607227776838" MODIFIED="1607577489057" LINK="#ID_1420013192"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1772424617" CREATED="1607227918927" MODIFIED="1607577531781" LINK="#ID_943501620"/>
</node>
<node TEXT="Addition (ADD, 9)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_571965779" CREATED="1607224357409" MODIFIED="1615428073725">
<node TEXT="Change [A] register to its old value plus [B]" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1411012962" CREATED="1607225466513" MODIFIED="1613540256567" LINK="#ID_249625636"/>
<node LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_692768372" CREATED="1613540260781" MODIFIED="1615428634788"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      <b>IF there was an overflow</b>
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Turn on {OVERFLOW}" ID="ID_305778451" CREATED="1613540294037" MODIFIED="1615511030151" LINK="#ID_1629027373"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      A note about overflows: If the max num is 32 and you add 4 to 30, [A] will be 2 and this flag will be on.
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1680655672" CREATED="1613540329053" MODIFIED="1615428641897"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      <b>else</b>
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Turn off {OVERFLOW}" ID="ID_1085315900" CREATED="1613540359196" MODIFIED="1615511073909" LINK="#ID_1629027373"/>
</node>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_698389274" CREATED="1607225658538" MODIFIED="1607577358696" LINK="#ID_943501620"/>
</node>
<node TEXT="Subtraction (SUBTRACT, 10)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_485093458" CREATED="1607224357409" MODIFIED="1615428076830">
<node TEXT="Change [A] register to its old value minus [B]" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_862871649" CREATED="1607225466513" MODIFIED="1613540533624" LINK="#ID_249625636"/>
<node LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1877242778" CREATED="1613540260781" MODIFIED="1615428641910"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      <b>IF there was an overflow</b>
    </p>
  </body>
</html>
</richcontent>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Technically, this would be an underflow, but in the end it's the same thing inside some ALUs
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Turn on {OVERFLOW}" ID="ID_527701796" CREATED="1613540294037" MODIFIED="1615511041363" LINK="#ID_1629027373"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      A note about overflows: If the max num is 32 and you subtract 7 from 2, [A] will be 27 (that's 32-5) and this flag will be on.
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1814996520" CREATED="1613540329053" MODIFIED="1615428720793"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      <b>else</b>
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Turn off {OVERFLOW}" ID="ID_172275938" CREATED="1613540359196" MODIFIED="1615511062551" LINK="#ID_1629027373"/>
</node>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_521454858" CREATED="1607225658538" MODIFIED="1607577358696" LINK="#ID_943501620"/>
</node>
</node>
</node>
</map>
