<map version="freeplane 1.8.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="One Chunk Man ISA" LOCALIZED_STYLE_REF="AutomaticLayout.level,1" FOLDED="false" ID="ID_464494903" CREATED="1607219573097" MODIFIED="1607304704305"><hook NAME="MapStyle">
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
<hook NAME="AutomaticEdgeColor" COUNTER="8" RULE="ON_BRANCH_CREATION"/>
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
      version 2
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
<node TEXT="{PREPAREHOP}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_953127579" CREATED="1607235126043" MODIFIED="1607304749197">
<node TEXT="If {DIRECTION} signal is on" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1104064771" CREATED="1607280122285" MODIFIED="1607305580747">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Move the tape [B] times forward" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_687465189" CREATED="1607235150839" MODIFIED="1607304941684"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_433566098" CREATED="1607280144667" MODIFIED="1607305580752">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Move the tape [B] times backward" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_578670447" CREATED="1607280184630" MODIFIED="1607304941697"/>
</node>
</node>
<node TEXT="{UNHOP}" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_926446120" CREATED="1607235126043" MODIFIED="1607304749199">
<node TEXT="If {DIRECTION} signal is on" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1529202343" CREATED="1607280122285" MODIFIED="1607305580752">
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
<node TEXT="If Goto (IFG, 0)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_858237275" CREATED="1607224338236" MODIFIED="1607308524716">
<node TEXT="If [A] register is zero" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1586555808" CREATED="1607225208609" MODIFIED="1607305580746">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Send {PREPAREHOP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_863348963" CREATED="1607225232555" MODIFIED="1607304941716"/>
<node TEXT="Send {GO} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_196256595" CREATED="1607225290716" MODIFIED="1607304941716"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_587045414" CREATED="1607225222996" MODIFIED="1607305580747">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_676337795" CREATED="1607225353544" MODIFIED="1607304941717"/>
</node>
</node>
<node TEXT="Subtract/Add (MATH, 1)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_571965779" CREATED="1607224357409" MODIFIED="1607308528789">
<node TEXT="Increase [A] register by one and decrease [B] register by one" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1411012962" CREATED="1607225466513" MODIFIED="1607304941718"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_698389274" CREATED="1607225658538" MODIFIED="1607304941731"/>
</node>
<node TEXT="Swap (SW, 2)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1398278412" CREATED="1607224440797" MODIFIED="1607308535611"><richcontent TYPE="DETAILS">

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
<node TEXT="Swaps values stored in [A] register and [B] register" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1474222748" CREATED="1607225734926" MODIFIED="1607304941732"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_205241004" CREATED="1607225902618" MODIFIED="1607304941733"/>
</node>
<node TEXT="Get (GET, 3)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_551750208" CREATED="1607224451403" MODIFIED="1607308539509"><richcontent TYPE="DETAILS">

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
<node TEXT="Send {PREPAREHOP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1440453114" CREATED="1607226034522" MODIFIED="1607304941733"/>
<node TEXT="Send {SETA} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_638144837" CREATED="1607227073499" MODIFIED="1607304941735"/>
<node TEXT="Send {UNHOPSTEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_478304716" CREATED="1607300632932" MODIFIED="1607304941736"/>
</node>
<node TEXT="Get Next (NEX, 4)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_452603626" CREATED="1607224468245" MODIFIED="1607308577662">
<node TEXT="Rotate tape forward. (ignoring the {DIRECTION} signal)" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1498698550" CREATED="1607227582372" MODIFIED="1607304941737"/>
<node TEXT="Send {SETA} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1652852579" CREATED="1607227694054" MODIFIED="1607304941739"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_746298979" CREATED="1607299604050" MODIFIED="1607304941741"/>
</node>
<node TEXT="Input/Output (IO, 5)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_398636506" CREATED="1607224576012" MODIFIED="1607308581307">
<node TEXT="Change the value of &lt;OUT&gt; to [A]" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1159075171" CREATED="1607227776838" MODIFIED="1607304941742"/>
<node TEXT="Change the value of [B] register to &lt;IN&gt;" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_962490077" CREATED="1607227803978" MODIFIED="1607304941745"/>
<node TEXT="Send {STEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1361778221" CREATED="1607227918927" MODIFIED="1607304941746"/>
</node>
<node TEXT="Set (SET, 6)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1775466053" CREATED="1607224800546" MODIFIED="1607308584916">
<node TEXT="Send {PREPAREHOP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1467726566" CREATED="1607235008642" MODIFIED="1607304941748"/>
<node TEXT="Set the number that&apos;s in the tape to the value in the [A] register" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1529112546" CREATED="1607227990672" MODIFIED="1607304941756"/>
<node TEXT="Send {UNHOPSTEP} signal" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1636232576" CREATED="1607300694893" MODIFIED="1607304941763"/>
</node>
<node TEXT="Change Direction (DIR, 7)" LOCALIZED_STYLE_REF="AutomaticLayout.level,3" ID="ID_1508374602" CREATED="1607280259983" MODIFIED="1607308589100">
<node TEXT="If [A] register is zero" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1204222569" CREATED="1607302802119" MODIFIED="1607305580737">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Turn on {DIRECTION}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_446483116" CREATED="1607302869837" MODIFIED="1607304941764"/>
</node>
<node TEXT="else" LOCALIZED_STYLE_REF="AutomaticLayout.level,4" ID="ID_1194590238" CREATED="1607302841158" MODIFIED="1607305580745">
<font BOLD="true" ITALIC="false"/>
<node TEXT="Turn off {DIRECTION}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_358152150" CREATED="1607302893441" MODIFIED="1607304941764"/>
</node>
</node>
</node>
</node>
</map>
