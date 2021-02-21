<map version="freeplane 1.8.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="One Chunk Man ISA" LOCALIZED_STYLE_REF="AutomaticLayout.level,1" FOLDED="false" ID="ID_464494903" CREATED="1607219573097" MODIFIED="1613539850981" BACKGROUND_COLOR="#ffffff"><hook NAME="MapStyle">
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
<hook NAME="AutomaticEdgeColor" COUNTER="9" RULE="ON_BRANCH_CREATION"/>
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
      version 4
    </p>
    <p style="margin-top: 0">
      
    </p>
    <p style="margin-top: 0">
      About versions: Version 1 is the unoptimized design, version 2 is a few tweaks to make it more programmable, version 3 is me throwing in a bunch of stuff to test things out (but retroactivly turned out to be too hard to make). Version 4 is version 2, after the components in MineCraft were drafted, and the emulator was somewhat ready. Version 4 is intended to be the &quot;final&quot; version.
    </p>
    <p style="margin-top: 0">
      
    </p>
    <p style="margin-top: 0">
      Software with a shared major version number should be binary compatible with versions with a changed second digit.
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Tape" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_616789481" CREATED="1607219868820" MODIFIED="1607304717857">
<edge COLOR="#ff00ff"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Max length is max number that can be stored in a register
    </p>
    <p>
      Min length is 50 or so
    </p>
    <p>
      Rotates two directions. See the {DIRECTION} signal for more info.
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
<node TEXT="Registers" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_249625636" CREATED="1607219751399" MODIFIED="1607304717867">
<edge COLOR="#0000ff"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
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
<node TEXT="[@]" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1916156865" CREATED="1607219779816" MODIFIED="1607577167416"><richcontent TYPE="DETAILS">

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
<node TEXT="{DIRECTION}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_825519549" CREATED="1607280000914" MODIFIED="1607304749196"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Starts as off.
    </p>
    <p>
      Indicates the direction the tape should be moving.
    </p>
    <p>
      Off is forward, on is backward.
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="{OVERFLOW}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1629027373" CREATED="1607280000914" MODIFIED="1613540624315"><richcontent TYPE="DETAILS">

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
<node TEXT="{PREPAREHOP}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_953127579" CREATED="1607235126043" MODIFIED="1613541920843"><richcontent TYPE="DETAILS">

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
<node TEXT="If {DIRECTION} signal is on" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1104064771" CREATED="1607280122285" MODIFIED="1607577047185" LINK="#ID_825519549">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Move the tape [B] plus 1 times forward" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_687465189" CREATED="1607235150839" MODIFIED="1613543958214" LINK="#ID_1834691667"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_433566098" CREATED="1607280144667" MODIFIED="1607577424420">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Move the tape [B] plus 1 times backward" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_578670447" CREATED="1607280184630" MODIFIED="1613543950978" LINK="#ID_1834691667"/>
</node>
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
<node TEXT="Update [@] register to value on the tape" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_87150273" CREATED="1607224072096" MODIFIED="1607577148281" LINK="#ID_1916156865"/>
</node>
<node TEXT="{STEP}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_943501620" CREATED="1607219732866" MODIFIED="1607304749203"><richcontent TYPE="DETAILS">

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
<node TEXT="Rotate tape forward. (ignoring the {DIRECTION} signal)" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1524550912" CREATED="1607223724324" MODIFIED="1607304941707"/>
<node TEXT="Send {GO} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_579140649" CREATED="1607223735834" MODIFIED="1607577185902" LINK="#ID_1870565492"/>
</node>
<node TEXT="{SETA}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1235109976" CREATED="1607299556642" MODIFIED="1613541926552"><richcontent TYPE="DETAILS">

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
<node TEXT="Set [A] register to the number thats in the tape" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_94797605" CREATED="1607228208571" MODIFIED="1607577287669" LINK="#ID_1134177843"/>
</node>
<node TEXT="{UNHOPSTEP}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1714522166" CREATED="1607303302441" MODIFIED="1613541930900"><richcontent TYPE="DETAILS">

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
<node TEXT="Toggle {DIRECTION}" ID="ID_1316614883" CREATED="1607662792891" MODIFIED="1607663075347" LINK="#ID_825519549"/>
<node TEXT="Send {PREPAREHOP} signal" ID="ID_982489369" CREATED="1607662809628" MODIFIED="1607663081429" LINK="#ID_953127579"/>
<node TEXT="Toggle {DIRECTION}" ID="ID_552253238" CREATED="1607662792891" MODIFIED="1607663089472" LINK="#ID_825519549"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_333022242" CREATED="1607303371312" MODIFIED="1607577305894" LINK="#ID_943501620"/>
</node>
</node>
<node TEXT="Instructions" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_685631083" CREATED="1607224217949" MODIFIED="1607304717870">
<edge COLOR="#7c0000"/>
<node TEXT="Do nothing (NOP, 0)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1398278412" CREATED="1607224440797" MODIFIED="1613541308312">
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
<node TEXT="Swap (SWAP, 2)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_864447605" CREATED="1607224440797" MODIFIED="1613541575062"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Most used
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Swaps values stored in [A] register and [B] register" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_87717248" CREATED="1607225734926" MODIFIED="1607577372486" LINK="#ID_249625636"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_818803402" CREATED="1607225902618" MODIFIED="1607577378060" LINK="#ID_943501620"/>
</node>
<node TEXT="Get Next (NEXT, 3)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_452603626" CREATED="1607224468245" MODIFIED="1613541577667">
<node TEXT="Rotate tape forward. (ignoring the {DIRECTION} signal)" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1498698550" CREATED="1607227582372" MODIFIED="1607577451306" LINK="#ID_616789481"/>
<node TEXT="Send {SETA} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1652852579" CREATED="1607227694054" MODIFIED="1607577463581" LINK="#ID_1235109976"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_746298979" CREATED="1607299604050" MODIFIED="1607577468748" LINK="#ID_943501620"/>
</node>
<node TEXT="Get (GET, 4)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_551750208" CREATED="1607224451403" MODIFIED="1613541580859"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Get value at tape position [B] and put it in [A]
    </p>
    <p>
      In some architectures this would be called &quot;load&quot;
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Send {PREPAREHOP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1440453114" CREATED="1607226034522" MODIFIED="1607577385209" LINK="#ID_953127579"/>
<node TEXT="Send {SETA} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_638144837" CREATED="1607227073499" MODIFIED="1607577391662" LINK="#ID_1235109976"/>
<node TEXT="Send {UNHOPSTEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_478304716" CREATED="1607300632932" MODIFIED="1607577406069" LINK="#ID_1714522166"/>
</node>
<node TEXT="Set (SET, 5)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1775466053" CREATED="1607224800546" MODIFIED="1613842405863"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Inverse of GET (put value in [A] in the tape at location [B])
    </p>
    <p>
      In some architectures this would be called &quot;store&quot;
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Send {PREPAREHOP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1467726566" CREATED="1607235008642" MODIFIED="1607577537652" LINK="#ID_953127579"/>
<node TEXT="Set the number that&apos;s in the tape to the value in the [A] register" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1529112546" CREATED="1607227990672" MODIFIED="1607577554432" LINK="#ID_1134177843"/>
<node TEXT="Send {UNHOPSTEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1636232576" CREATED="1607300694893" MODIFIED="1607577567219" LINK="#ID_1714522166"/>
</node>
<node TEXT="If Goto (IFGOTO, 6)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_858237275" CREATED="1607224338236" MODIFIED="1613543526834"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Conditionally move [B] times in {DIRECTION}
    </p>
  </body>
</html>
</richcontent>
<node TEXT="If {OVERFLOW} is on" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1586555808" CREATED="1607225208609" MODIFIED="1613540948462" LINK="#ID_1134177843">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Send {PREPAREHOP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_863348963" CREATED="1607225232555" MODIFIED="1607577331895" LINK="#ID_953127579"/>
<node TEXT="Send {GO} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_196256595" CREATED="1607225290716" MODIFIED="1607577336830" LINK="#ID_1870565492"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_587045414" CREATED="1607225222996" MODIFIED="1607305580747">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_676337795" CREATED="1607225353544" MODIFIED="1607577341621" LINK="#ID_943501620"/>
</node>
</node>
<node TEXT="Change Direction to forwards (DIRF, 7)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1508374602" CREATED="1607280259983" MODIFIED="1613541588317">
<node TEXT="Turn on {DIRECTION}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_446483116" CREATED="1607302869837" MODIFIED="1607577596471" LINK="#ID_825519549"/>
<node TEXT="Send {STEP} signal" ID="ID_927166443" CREATED="1607580568518" MODIFIED="1607580578126"/>
</node>
<node TEXT="Change Direction to backwards (DIRB, 8)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1693470860" CREATED="1607280259983" MODIFIED="1613541592298">
<node TEXT="Turn off {DIRECTION}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1499196459" CREATED="1607302893441" MODIFIED="1607577600727" LINK="#ID_825519549"/>
<node TEXT="Send {STEP} signal" ID="ID_447275131" CREATED="1607580568518" MODIFIED="1607580578126"/>
</node>
<node TEXT="Read Input (READIN, 9)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_398636506" CREATED="1607224576012" MODIFIED="1613541594959" LINK="#ID_1901169444"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Reads GPIO
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Change the value of [A] register to &lt;IN&gt;" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_962490077" CREATED="1607227803978" MODIFIED="1613540064777" LINK="#ID_851196832"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1361778221" CREATED="1607227918927" MODIFIED="1607577531781" LINK="#ID_943501620"/>
</node>
<node TEXT="Send Output (SENDOUT, 10)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1429088621" CREATED="1607224576012" MODIFIED="1613541598093" LINK="#ID_1901169444"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Sends GPIO
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Change the value of &lt;OUT&gt; to [A]" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_818595852" CREATED="1607227776838" MODIFIED="1607577489057" LINK="#ID_1420013192"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1772424617" CREATED="1607227918927" MODIFIED="1607577531781" LINK="#ID_943501620"/>
</node>
<node TEXT="Addition (ADD, 11)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_571965779" CREATED="1607224357409" MODIFIED="1613541600595">
<node TEXT="Change [A] register to its old value plus [B]" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1411012962" CREATED="1607225466513" MODIFIED="1613540256567" LINK="#ID_249625636"/>
<node ID="ID_692768372" CREATED="1613540260781" MODIFIED="1613540287160"><richcontent TYPE="NODE">

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
<node TEXT="Turn on {OVERFLOW}" ID="ID_305778451" CREATED="1613540294037" MODIFIED="1613540703418"><richcontent TYPE="DETAILS">

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
<node ID="ID_1680655672" CREATED="1613540329053" MODIFIED="1613540344926"><richcontent TYPE="NODE">

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
<node TEXT="Turn off {OVERFLOW}" ID="ID_1085315900" CREATED="1613540359196" MODIFIED="1613540367191"/>
</node>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_698389274" CREATED="1607225658538" MODIFIED="1607577358696" LINK="#ID_943501620"/>
</node>
<node TEXT="Subtraction (SUBTRACT, 12)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_485093458" CREATED="1607224357409" MODIFIED="1613541603237">
<node TEXT="Change [A] register to its old value minus [B]" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_862871649" CREATED="1607225466513" MODIFIED="1613540533624" LINK="#ID_249625636"/>
<node ID="ID_1877242778" CREATED="1613540260781" MODIFIED="1613540860080"><richcontent TYPE="NODE">

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
<node TEXT="Turn on {OVERFLOW}" ID="ID_527701796" CREATED="1613540294037" MODIFIED="1613540785260"><richcontent TYPE="DETAILS">

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
<node ID="ID_1814996520" CREATED="1613540329053" MODIFIED="1613540344926"><richcontent TYPE="NODE">

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
<node TEXT="Turn off {OVERFLOW}" ID="ID_172275938" CREATED="1613540359196" MODIFIED="1613540367191"/>
</node>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_521454858" CREATED="1607225658538" MODIFIED="1607577358696" LINK="#ID_943501620"/>
</node>
</node>
</node>
</map>
