<map version="freeplane 1.8.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="One Chunk Man ISA" LOCALIZED_STYLE_REF="AutomaticLayout.level,1" FOLDED="false" ID="ID_464494903" CREATED="1607219573097" MODIFIED="1607472489030"><hook NAME="MapStyle">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" show_icon_for_attributes="true" fit_to_viewport="false"/>

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
<hook NAME="AutomaticEdgeColor" COUNTER="13" RULE="ON_BRANCH_CREATION"/>
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
      version 3
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
<node TEXT="IO ports" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" FOLDED="true" POSITION="right" ID="ID_1901169444" CREATED="1607219827930" MODIFIED="1607304717865" HGAP_QUANTITY="16.999999910593033 pt" VSHIFT_QUANTITY="-20.99999937415125 pt">
<edge COLOR="#00007c"/>
<node TEXT="&lt;OUT&gt;" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1420013192" CREATED="1607219842867" MODIFIED="1607474536128"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Communication to things outside of computer.
    </p>
    <p>
      There should also be an indicator to the outside that it has updated. This is usefull if it sends two of the same signal. (such as two &quot;l&quot;s in the demo hello world)
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="&lt;IN&gt;" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_851196832" CREATED="1607219856073" MODIFIED="1607474777521"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Communication from things outside of computer. When this changes, the [!] register changes to the number 1. When this is read, set the [!] register to 0
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Registers" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" FOLDED="true" POSITION="right" ID="ID_249625636" CREATED="1607219751399" MODIFIED="1607474918619">
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
<node TEXT="[A]" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1134177843" CREATED="1607219768574" MODIFIED="1607304749188"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Fastest at Write
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="[B]" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1834691667" CREATED="1607219776477" MODIFIED="1607304749189"/>
<node TEXT="[C] and beyond" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_256064333" CREATED="1607219776477" MODIFIED="1607484395814"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Values can only be accessed by shifting the repeaters
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="[@]" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1916156865" CREATED="1607219779816" MODIFIED="1607304749192"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Current state determines what Instruction the computer is currently doing. Can only be set to the current value in the tape.
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="[!]" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1919055115" CREATED="1607474800404" MODIFIED="1607474904023"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Only can be 0 or 1. Defaults to 0.
    </p>
    <p>
      See &lt;IN&gt; for more information.
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Signals" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_1774914395" CREATED="1607219662865" MODIFIED="1607304717868" HGAP_QUANTITY="22.999999731779106 pt" VSHIFT_QUANTITY="-8.249999754130847 pt">
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
<node TEXT="{DIRECTION}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_825519549" CREATED="1607280000914" MODIFIED="1607484764585"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Starts as off.
    </p>
    <p>
      Indicates the direction the tape and registers should be moving.
    </p>
    <p>
      Off is forward, on is backward.
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="{PREPAREHOP}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_953127579" CREATED="1607235126043" MODIFIED="1607304749197">
<node TEXT="If {DIRECTION} signal is off" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" FOLDED="true" ID="ID_1104064771" CREATED="1607280122285" MODIFIED="1607484860499">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Move the tape [B] times forward" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_687465189" CREATED="1607235150839" MODIFIED="1607304941684"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_433566098" CREATED="1607280144667" MODIFIED="1607305580752">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Move the tape [B] times backward" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_578670447" CREATED="1607280184630" MODIFIED="1607304941697"/>
</node>
</node>
<node TEXT="{UNHOP}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_926446120" CREATED="1607235126043" MODIFIED="1607304749199">
<node TEXT="If {DIRECTION} signal is off" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1529202343" CREATED="1607280122285" MODIFIED="1607484866454">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Move the tape [B] times backward" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1378819644" CREATED="1607235150839" MODIFIED="1607304941699"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1403762190" CREATED="1607280144667" MODIFIED="1607305580753">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Move the tape [B] times forward" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1297675179" CREATED="1607280184630" MODIFIED="1607304941700"/>
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
<node TEXT="Wait until {POWER} signal is on" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1725614072" CREATED="1607224035873" MODIFIED="1607304941701"/>
<node TEXT="Update [@] register to value on the tape" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_87150273" CREATED="1607224072096" MODIFIED="1607304941705"/>
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
<node TEXT="Send {GO} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_579140649" CREATED="1607223735834" MODIFIED="1607304941709"/>
</node>
<node TEXT="{SETA}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1235109976" CREATED="1607299556642" MODIFIED="1607304749204">
<node TEXT="Set [A] register to the number thats in the tape" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_94797605" CREATED="1607228208571" MODIFIED="1607304941710"/>
</node>
<node TEXT="{UNHOPSTEP}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1714522166" CREATED="1607303302441" MODIFIED="1607304749205">
<node TEXT="Send {UNHOP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_200173072" CREATED="1607303342989" MODIFIED="1607304941711"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_333022242" CREATED="1607303371312" MODIFIED="1607304941713"/>
</node>
</node>
<node TEXT="Instructions" LOCALIZED_STYLE_REF="AutomaticLayout.level,2" POSITION="right" ID="ID_685631083" CREATED="1607224217949" MODIFIED="1607304717870">
<edge COLOR="#7c0000"/>
<node TEXT="If Goto (IFG, 0)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" FOLDED="true" ID="ID_858237275" CREATED="1607224338236" MODIFIED="1607308524716">
<node TEXT="If [A] register is zero" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1586555808" CREATED="1607225208609" MODIFIED="1607305580746">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Send {PREPAREHOP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_863348963" CREATED="1607225232555" MODIFIED="1607490110548" LINK="#ID_953127579"/>
<node TEXT="Send {GO} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_196256595" CREATED="1607225290716" MODIFIED="1607490130575" LINK="#ID_1870565492"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_587045414" CREATED="1607225222996" MODIFIED="1607305580747">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_676337795" CREATED="1607225353544" MODIFIED="1607490142146" LINK="#ID_943501620"/>
</node>
</node>
<node TEXT="Subtract/Add (MATH, 1)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" FOLDED="true" ID="ID_571965779" CREATED="1607224357409" MODIFIED="1607308528789">
<node TEXT="Increase [A] register by one and decrease [B] register by one" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1411012962" CREATED="1607225466513" MODIFIED="1607304941718"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_698389274" CREATED="1607225658538" MODIFIED="1607490152569" LINK="#ID_943501620"/>
</node>
<node TEXT="Swap (SW, 2)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" FOLDED="true" ID="ID_1005463113" CREATED="1607224440797" MODIFIED="1607308535611"><richcontent TYPE="DETAILS">

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
<node TEXT="Swaps values stored in [A] register and [B] register" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1676174693" CREATED="1607225734926" MODIFIED="1607304941732"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1430567073" CREATED="1607225902618" MODIFIED="1607490163661" LINK="#ID_943501620"/>
</node>
<node TEXT="Get (GET, 3)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" FOLDED="true" ID="ID_551750208" CREATED="1607224451403" MODIFIED="1607308539509"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Get value at tape position [B] and put it in [A]
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Send {PREPAREHOP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1440453114" CREATED="1607226034522" MODIFIED="1607490179667" LINK="#ID_953127579"/>
<node TEXT="Send {SETA} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_638144837" CREATED="1607227073499" MODIFIED="1607490186033" LINK="#ID_1235109976"/>
<node TEXT="Send {UNHOPSTEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_478304716" CREATED="1607300632932" MODIFIED="1607490197767" LINK="#ID_1714522166"/>
</node>
<node TEXT="Get Next (NEX, 4)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" FOLDED="true" ID="ID_452603626" CREATED="1607224468245" MODIFIED="1607308577662">
<node TEXT="Rotate tape forward. (ignoring the {DIRECTION} signal)" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1498698550" CREATED="1607227582372" MODIFIED="1607304941737"/>
<node TEXT="Send {SETA} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1652852579" CREATED="1607227694054" MODIFIED="1607490218779" LINK="#ID_1235109976"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_746298979" CREATED="1607299604050" MODIFIED="1607490226953" LINK="#ID_943501620"/>
</node>
<node TEXT="Input/Output (IO, 5)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" FOLDED="true" ID="ID_398636506" CREATED="1607224576012" MODIFIED="1607308581307">
<node TEXT="Change the value of &lt;OUT&gt; to [A]" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1159075171" CREATED="1607227776838" MODIFIED="1607304941742"/>
<node TEXT="Change the value of [B] register to &lt;IN&gt;" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_962490077" CREATED="1607227803978" MODIFIED="1607304941745"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1361778221" CREATED="1607227918927" MODIFIED="1607490238584" LINK="#ID_943501620"/>
</node>
<node TEXT="Set (SET, 6)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" FOLDED="true" ID="ID_1775466053" CREATED="1607224800546" MODIFIED="1607308584916">
<node TEXT="Send {PREPAREHOP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1467726566" CREATED="1607235008642" MODIFIED="1607490250076" LINK="#ID_953127579"/>
<node TEXT="Set the number that&apos;s in the tape to the value in the [A] register" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1529112546" CREATED="1607227990672" MODIFIED="1607304941756"/>
<node TEXT="Send {UNHOPSTEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1636232576" CREATED="1607300694893" MODIFIED="1607490257236" LINK="#ID_1714522166"/>
</node>
<node TEXT="Change Direction (DIR, 7)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1508374602" CREATED="1607280259983" MODIFIED="1607308589100">
<node TEXT="If [A] register is zero" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1204222569" CREATED="1607302802119" MODIFIED="1607305580737">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Turn on {DIRECTION}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_446483116" CREATED="1607302869837" MODIFIED="1607490265439" LINK="#ID_825519549"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1194590238" CREATED="1607302841158" MODIFIED="1607305580745">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Turn off {DIRECTION}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_358152150" CREATED="1607302893441" MODIFIED="1607490272142" LINK="#ID_825519549"/>
</node>
</node>
<node TEXT="Shift (SH, 8)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1398278412" CREATED="1607224440797" MODIFIED="1607485011075"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Rotate the values of the registers.
    </p>
    <p>
      Here's an example if we had 3 registers and the direction is forward: The value of [A] goes into [C], the value of [B] goes into [A], the value of [C] goes into [B]
    </p>
  </body>
</html>
</richcontent>
<node TEXT="If {DIRECTION} is off" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_602377382" CREATED="1607302802119" MODIFIED="1607490311568" LINK="#ID_825519549">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Rotate values of registers forward." LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1474222748" CREATED="1607225734926" MODIFIED="1607484808502"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_948357009" CREATED="1607302841158" MODIFIED="1607305580745">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Rotate values of registers backward." LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1513437299" CREATED="1607225734926" MODIFIED="1607484909259"/>
</node>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_205241004" CREATED="1607225902618" MODIFIED="1607490320228" LINK="#ID_943501620"/>
</node>
</node>
<node TEXT="Structure" FOLDED="true" POSITION="left" ID="ID_1818917982" CREATED="1607489481633" MODIFIED="1607489673177">
<edge COLOR="#0000ff"/>
<cloud COLOR="#f0f0f0" SHAPE="ARC"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      An optional suggestion about how a hardware (or hardware-like) implementation could be structured.
    </p>
  </body>
</html>
</richcontent>
<node TEXT="[@]" ID="ID_965545722" CREATED="1607489688814" MODIFIED="1607489693800">
<node TEXT="IFG" ID="ID_1476069848" CREATED="1607489702800" MODIFIED="1607489894716">
<node TEXT="{PREPAREHOP}" ID="ID_822442268" CREATED="1607489821738" MODIFIED="1607489828381"/>
<node TEXT="{GO}" ID="ID_1397478896" CREATED="1607489838993" MODIFIED="1607489843922"/>
<node TEXT="{STEP}" LOCALIZED_STYLE_REF="defaultstyle.floating" ID="ID_1632304024" CREATED="1607489856815" MODIFIED="1607489899442" HGAP_QUANTITY="33.49999941885473 pt" VSHIFT_QUANTITY="10.499999687075624 pt"/>
</node>
<node TEXT="MATH" ID="ID_182233996" CREATED="1607489713968" MODIFIED="1607489915346">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="200" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_1632304024" STARTINCLINATION="84;0;" ENDINCLINATION="84;0;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
</node>
<node TEXT="SW" ID="ID_480311672" CREATED="1607489718098" MODIFIED="1607489719798"/>
<node TEXT="GET" ID="ID_863701090" CREATED="1607489720615" MODIFIED="1607489722231"/>
<node TEXT="NEX" ID="ID_1546224761" CREATED="1607489723315" MODIFIED="1607489724651"/>
<node TEXT="IO" ID="ID_1045984270" CREATED="1607489726367" MODIFIED="1607489741316"/>
<node TEXT="SET" ID="ID_779552523" CREATED="1607489741916" MODIFIED="1607489749691"/>
<node TEXT="DIR" ID="ID_1193567511" CREATED="1607489750165" MODIFIED="1607489753487"/>
<node TEXT="SH" ID="ID_478995302" CREATED="1607489753919" MODIFIED="1607489756459"/>
</node>
</node>
</node>
</map>
