<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.1.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="SRAM">
<packages>
<package name="SOP32-5">
<description>&lt;b&gt;Small Outline Package&lt;/b&gt;</description>
<wire x1="-10.296" y1="4.966" x2="-10.295" y2="4.966" width="0.1524" layer="21"/>
<wire x1="-10.295" y1="4.966" x2="10.295" y2="4.966" width="0.1524" layer="21"/>
<wire x1="10.545" y1="4.716" x2="10.545" y2="-4.716" width="0.1524" layer="21"/>
<wire x1="10.295" y1="-4.966" x2="-10.295" y2="-4.966" width="0.1524" layer="21"/>
<wire x1="-10.545" y1="-4.726" x2="-10.545" y2="4.716" width="0.1524" layer="21"/>
<wire x1="-10.045" y1="4.716" x2="10.055" y2="4.716" width="0.0508" layer="21"/>
<wire x1="10.295" y1="4.476" x2="10.295" y2="-4.466" width="0.0508" layer="21"/>
<wire x1="10.045" y1="-4.716" x2="-10.045" y2="-4.716" width="0.0508" layer="21"/>
<wire x1="-10.295" y1="-4.466" x2="-10.295" y2="4.466" width="0.0508" layer="21"/>
<wire x1="10.295" y1="4.966" x2="10.545" y2="4.716" width="0.1524" layer="21" curve="-90"/>
<wire x1="10.295" y1="-4.966" x2="10.545" y2="-4.716" width="0.1524" layer="21" curve="90"/>
<wire x1="-10.545" y1="-4.726" x2="-10.295" y2="-4.966" width="0.1524" layer="21" curve="87.753395"/>
<wire x1="-10.295" y1="-4.466" x2="-10.045" y2="-4.716" width="0.0508" layer="21" curve="90"/>
<wire x1="-10.545" y1="4.716" x2="-10.295" y2="4.966" width="0.1524" layer="21" curve="-90"/>
<wire x1="-10.295" y1="4.466" x2="-10.045" y2="4.716" width="0.0508" layer="21" curve="-90"/>
<wire x1="10.045" y1="-4.716" x2="10.295" y2="-4.466" width="0.0508" layer="21" curve="90"/>
<wire x1="10.055" y1="4.716" x2="10.295" y2="4.476" width="0.0508" layer="21" curve="-87.661721"/>
<circle x="-9.045" y="-3.466" radius="0.5" width="0.0508" layer="21"/>
<circle x="-6.985" y="-0.0635" radius="0.9525" width="0.0508" layer="21"/>
<circle x="6.985" y="-0.0635" radius="0.9525" width="0.0508" layer="21"/>
<smd name="3" x="-6.985" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="4" x="-5.715" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="5" x="-4.445" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="6" x="-3.175" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="7" x="-1.905" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="8" x="-0.635" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="9" x="0.635" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="10" x="1.905" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="11" x="3.175" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="12" x="4.445" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="13" x="5.715" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="14" x="6.985" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="30" x="-6.985" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="29" x="-5.715" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="28" x="-4.445" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="27" x="-3.175" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="26" x="-1.905" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="25" x="-0.635" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="24" x="0.635" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="23" x="1.905" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="22" x="3.175" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="21" x="4.445" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="20" x="5.715" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="19" x="6.985" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="15" x="8.255" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="16" x="9.525" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="18" x="8.255" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="17" x="9.525" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="1" x="-9.525" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="2" x="-8.255" y="-6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="32" x="-9.525" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<smd name="31" x="-8.255" y="6.516" dx="0.5" dy="2.2" layer="1"/>
<text x="-10.795" y="-4.826" size="1.778" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-5.842" y="-2.667" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-7.16" y1="4.966" x2="-6.81" y2="7.016" layer="51"/>
<rectangle x1="-5.89" y1="4.966" x2="-5.54" y2="7.016" layer="51"/>
<rectangle x1="-4.62" y1="4.966" x2="-4.27" y2="7.016" layer="51"/>
<rectangle x1="-3.35" y1="4.966" x2="-3" y2="7.016" layer="51"/>
<rectangle x1="-2.08" y1="4.966" x2="-1.73" y2="7.016" layer="51"/>
<rectangle x1="-0.81" y1="4.966" x2="-0.46" y2="7.016" layer="51"/>
<rectangle x1="0.46" y1="4.966" x2="0.81" y2="7.016" layer="51"/>
<rectangle x1="1.73" y1="4.966" x2="2.08" y2="7.016" layer="51"/>
<rectangle x1="3" y1="4.966" x2="3.35" y2="7.016" layer="51"/>
<rectangle x1="4.27" y1="4.966" x2="4.62" y2="7.016" layer="51"/>
<rectangle x1="5.54" y1="4.966" x2="5.89" y2="7.016" layer="51"/>
<rectangle x1="6.81" y1="4.966" x2="7.16" y2="7.016" layer="51"/>
<rectangle x1="-7.16" y1="-7.016" x2="-6.81" y2="-4.966" layer="51"/>
<rectangle x1="-5.89" y1="-7.016" x2="-5.54" y2="-4.966" layer="51"/>
<rectangle x1="-4.62" y1="-7.016" x2="-4.27" y2="-4.966" layer="51"/>
<rectangle x1="-3.35" y1="-7.016" x2="-3" y2="-4.966" layer="51"/>
<rectangle x1="-2.08" y1="-7.016" x2="-1.73" y2="-4.966" layer="51"/>
<rectangle x1="-0.81" y1="-7.016" x2="-0.46" y2="-4.966" layer="51"/>
<rectangle x1="0.46" y1="-7.016" x2="0.81" y2="-4.966" layer="51"/>
<rectangle x1="1.73" y1="-7.016" x2="2.08" y2="-4.966" layer="51"/>
<rectangle x1="3" y1="-7.016" x2="3.35" y2="-4.966" layer="51"/>
<rectangle x1="4.27" y1="-7.016" x2="4.62" y2="-4.966" layer="51"/>
<rectangle x1="5.54" y1="-7.016" x2="5.89" y2="-4.966" layer="51"/>
<rectangle x1="6.81" y1="-7.016" x2="7.16" y2="-4.966" layer="51"/>
<rectangle x1="8.08" y1="4.966" x2="8.43" y2="7.016" layer="51"/>
<rectangle x1="9.35" y1="4.966" x2="9.7" y2="7.016" layer="51"/>
<rectangle x1="8.08" y1="-7.016" x2="8.43" y2="-4.966" layer="51"/>
<rectangle x1="9.35" y1="-7.016" x2="9.7" y2="-4.966" layer="51"/>
<rectangle x1="-9.7" y1="4.966" x2="-9.35" y2="7.016" layer="51"/>
<rectangle x1="-8.43" y1="4.966" x2="-8.08" y2="7.016" layer="51"/>
<rectangle x1="-9.7" y1="-7.016" x2="-9.35" y2="-4.966" layer="51"/>
<rectangle x1="-8.43" y1="-7.016" x2="-8.08" y2="-4.966" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="SRAM">
<wire x1="12.7" y1="25.4" x2="-12.7" y2="25.4" width="0.254" layer="94"/>
<wire x1="-12.7" y1="25.4" x2="-12.7" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-25.4" x2="12.7" y2="-25.4" width="0.254" layer="94"/>
<wire x1="12.7" y1="-25.4" x2="12.7" y2="25.4" width="0.254" layer="94"/>
<pin name="I/O1" x="17.78" y="22.86" length="middle" rot="R180"/>
<pin name="I/O2" x="17.78" y="20.32" length="middle" rot="R180"/>
<pin name="I/O3" x="17.78" y="17.78" length="middle" rot="R180"/>
<pin name="I/O4" x="17.78" y="15.24" length="middle" rot="R180"/>
<pin name="I/O5" x="17.78" y="12.7" length="middle" rot="R180"/>
<pin name="I/O6" x="17.78" y="10.16" length="middle" rot="R180"/>
<pin name="I/O7" x="17.78" y="7.62" length="middle" rot="R180"/>
<pin name="I/O8" x="17.78" y="5.08" length="middle" rot="R180"/>
<pin name="A0" x="-17.78" y="22.86" length="middle" direction="in"/>
<pin name="A1" x="-17.78" y="20.32" length="middle" direction="in"/>
<pin name="A2" x="-17.78" y="17.78" length="middle" direction="in"/>
<pin name="A3" x="-17.78" y="15.24" length="middle" direction="in"/>
<pin name="A4" x="-17.78" y="12.7" length="middle" direction="in"/>
<pin name="A5" x="-17.78" y="10.16" length="middle" direction="in"/>
<pin name="A6" x="-17.78" y="7.62" length="middle" direction="in"/>
<pin name="A7" x="-17.78" y="5.08" length="middle" direction="in"/>
<pin name="A8" x="-17.78" y="2.54" length="middle" direction="in"/>
<pin name="A9" x="-17.78" y="0" length="middle" direction="in"/>
<pin name="A10" x="-17.78" y="-2.54" length="middle" direction="in"/>
<pin name="A11" x="-17.78" y="-5.08" length="middle" direction="in"/>
<pin name="A12" x="-17.78" y="-7.62" length="middle" direction="in"/>
<pin name="A13" x="-17.78" y="-10.16" length="middle" direction="in"/>
<pin name="A14" x="-17.78" y="-12.7" length="middle" direction="in"/>
<pin name="A15" x="-17.78" y="-15.24" length="middle" direction="in"/>
<pin name="A16" x="-17.78" y="-17.78" length="middle" direction="in"/>
<pin name="CS1" x="17.78" y="-22.86" length="middle" direction="in" function="dot" rot="R180"/>
<pin name="CS2" x="17.78" y="-20.32" length="middle" direction="in" rot="R180"/>
<pin name="OE" x="17.78" y="-17.78" length="middle" direction="in" function="dot" rot="R180"/>
<pin name="WE" x="17.78" y="-15.24" length="middle" direction="in" function="dot" rot="R180"/>
<pin name="VSS" x="17.78" y="-7.62" length="middle" direction="pwr" rot="R180"/>
<pin name="VCC" x="17.78" y="-5.08" length="middle" direction="pwr" rot="R180"/>
<text x="0" y="30.48" size="2.54" layer="96" align="center">&gt;NAME</text>
<text x="0" y="0" size="2.54" layer="95" rot="R90" align="center">K6X1008C2D</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="K6X1008C2D" prefix="IC">
<description>Static RAM
SOP32-5</description>
<gates>
<gate name="IC$1" symbol="SRAM" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOP32-5">
<connects>
<connect gate="IC$1" pin="A0" pad="12"/>
<connect gate="IC$1" pin="A1" pad="11"/>
<connect gate="IC$1" pin="A10" pad="23"/>
<connect gate="IC$1" pin="A11" pad="25"/>
<connect gate="IC$1" pin="A12" pad="4"/>
<connect gate="IC$1" pin="A13" pad="28"/>
<connect gate="IC$1" pin="A14" pad="3"/>
<connect gate="IC$1" pin="A15" pad="31"/>
<connect gate="IC$1" pin="A16" pad="2"/>
<connect gate="IC$1" pin="A2" pad="10"/>
<connect gate="IC$1" pin="A3" pad="9"/>
<connect gate="IC$1" pin="A4" pad="8"/>
<connect gate="IC$1" pin="A5" pad="7"/>
<connect gate="IC$1" pin="A6" pad="6"/>
<connect gate="IC$1" pin="A7" pad="5"/>
<connect gate="IC$1" pin="A8" pad="27"/>
<connect gate="IC$1" pin="A9" pad="26"/>
<connect gate="IC$1" pin="CS1" pad="22"/>
<connect gate="IC$1" pin="CS2" pad="30"/>
<connect gate="IC$1" pin="I/O1" pad="13"/>
<connect gate="IC$1" pin="I/O2" pad="14"/>
<connect gate="IC$1" pin="I/O3" pad="15"/>
<connect gate="IC$1" pin="I/O4" pad="17"/>
<connect gate="IC$1" pin="I/O5" pad="18"/>
<connect gate="IC$1" pin="I/O6" pad="19"/>
<connect gate="IC$1" pin="I/O7" pad="20"/>
<connect gate="IC$1" pin="I/O8" pad="21"/>
<connect gate="IC$1" pin="OE" pad="24"/>
<connect gate="IC$1" pin="VCC" pad="32"/>
<connect gate="IC$1" pin="VSS" pad="16"/>
<connect gate="IC$1" pin="WE" pad="29"/>
</connects>
<technologies>
<technology name="">
<attribute name="IC1" value="K6X1008C2D-B" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="74xx-eu">
<description>&lt;b&gt;TTL Devices, 74xx Series with European Symbols&lt;/b&gt;&lt;p&gt;
Based on the following sources:
&lt;ul&gt;
&lt;li&gt;Texas Instruments &lt;i&gt;TTL Data Book&lt;/i&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;Volume 1, 1996.
&lt;li&gt;TTL Data Book, Volume 2 , 1993
&lt;li&gt;National Seminconductor Databook 1990, ALS/LS Logic
&lt;li&gt;ttl 74er digital data dictionary, ECA Electronic + Acustic GmbH, ISBN 3-88109-032-0
&lt;li&gt;http://icmaster.com/ViewCompare.asp
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL20">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="12.7" y1="2.921" x2="-12.7" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-2.921" x2="12.7" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="12.7" y1="2.921" x2="12.7" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="2.921" x2="-12.7" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-2.921" x2="-12.7" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.016" x2="-12.7" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-11.43" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="11.43" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="11.43" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="17" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="18" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="19" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="20" x="-11.43" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-13.081" y="-3.048" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="-9.779" y="-0.381" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="SO20W">
<description>&lt;b&gt;Wide Small Outline package&lt;/b&gt; 300 mil</description>
<wire x1="6.1214" y1="3.7338" x2="-6.1214" y2="3.7338" width="0.1524" layer="51"/>
<wire x1="6.1214" y1="-3.7338" x2="6.5024" y2="-3.3528" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.5024" y1="3.3528" x2="-6.1214" y2="3.7338" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.1214" y1="3.7338" x2="6.5024" y2="3.3528" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.5024" y1="-3.3528" x2="-6.1214" y2="-3.7338" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.1214" y1="-3.7338" x2="6.1214" y2="-3.7338" width="0.1524" layer="51"/>
<wire x1="6.5024" y1="-3.3528" x2="6.5024" y2="3.3528" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="3.3528" x2="-6.5024" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="1.27" x2="-6.5024" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="-1.27" x2="-6.5024" y2="-3.3528" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="-3.3782" x2="6.477" y2="-3.3782" width="0.0508" layer="21"/>
<wire x1="-6.5024" y1="1.27" x2="-6.5024" y2="-1.27" width="0.1524" layer="21" curve="-180"/>
<smd name="1" x="-5.715" y="-5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="2" x="-4.445" y="-5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="3" x="-3.175" y="-5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="4" x="-1.905" y="-5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="5" x="-0.635" y="-5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="6" x="0.635" y="-5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="7" x="1.905" y="-5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="8" x="3.175" y="-5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="13" x="3.175" y="5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="14" x="1.905" y="5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="15" x="0.635" y="5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="16" x="-0.635" y="5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="17" x="-1.905" y="5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="18" x="-3.175" y="5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="19" x="-4.445" y="5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="20" x="-5.715" y="5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="9" x="4.445" y="-5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="10" x="5.715" y="-5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="12" x="4.445" y="5.0292" dx="0.6604" dy="2.032" layer="1"/>
<smd name="11" x="5.715" y="5.0292" dx="0.6604" dy="2.032" layer="1"/>
<text x="-3.81" y="-1.778" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.858" y="-3.175" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-5.969" y1="-3.8608" x2="-5.461" y2="-3.7338" layer="51"/>
<rectangle x1="-5.969" y1="-5.334" x2="-5.461" y2="-3.8608" layer="51"/>
<rectangle x1="-4.699" y1="-3.8608" x2="-4.191" y2="-3.7338" layer="51"/>
<rectangle x1="-4.699" y1="-5.334" x2="-4.191" y2="-3.8608" layer="51"/>
<rectangle x1="-3.429" y1="-3.8608" x2="-2.921" y2="-3.7338" layer="51"/>
<rectangle x1="-3.429" y1="-5.334" x2="-2.921" y2="-3.8608" layer="51"/>
<rectangle x1="-2.159" y1="-3.8608" x2="-1.651" y2="-3.7338" layer="51"/>
<rectangle x1="-2.159" y1="-5.334" x2="-1.651" y2="-3.8608" layer="51"/>
<rectangle x1="-0.889" y1="-5.334" x2="-0.381" y2="-3.8608" layer="51"/>
<rectangle x1="-0.889" y1="-3.8608" x2="-0.381" y2="-3.7338" layer="51"/>
<rectangle x1="0.381" y1="-3.8608" x2="0.889" y2="-3.7338" layer="51"/>
<rectangle x1="0.381" y1="-5.334" x2="0.889" y2="-3.8608" layer="51"/>
<rectangle x1="1.651" y1="-3.8608" x2="2.159" y2="-3.7338" layer="51"/>
<rectangle x1="1.651" y1="-5.334" x2="2.159" y2="-3.8608" layer="51"/>
<rectangle x1="2.921" y1="-3.8608" x2="3.429" y2="-3.7338" layer="51"/>
<rectangle x1="2.921" y1="-5.334" x2="3.429" y2="-3.8608" layer="51"/>
<rectangle x1="-5.969" y1="3.8608" x2="-5.461" y2="5.334" layer="51"/>
<rectangle x1="-5.969" y1="3.7338" x2="-5.461" y2="3.8608" layer="51"/>
<rectangle x1="-4.699" y1="3.7338" x2="-4.191" y2="3.8608" layer="51"/>
<rectangle x1="-4.699" y1="3.8608" x2="-4.191" y2="5.334" layer="51"/>
<rectangle x1="-3.429" y1="3.7338" x2="-2.921" y2="3.8608" layer="51"/>
<rectangle x1="-3.429" y1="3.8608" x2="-2.921" y2="5.334" layer="51"/>
<rectangle x1="-2.159" y1="3.7338" x2="-1.651" y2="3.8608" layer="51"/>
<rectangle x1="-2.159" y1="3.8608" x2="-1.651" y2="5.334" layer="51"/>
<rectangle x1="-0.889" y1="3.7338" x2="-0.381" y2="3.8608" layer="51"/>
<rectangle x1="-0.889" y1="3.8608" x2="-0.381" y2="5.334" layer="51"/>
<rectangle x1="0.381" y1="3.7338" x2="0.889" y2="3.8608" layer="51"/>
<rectangle x1="0.381" y1="3.8608" x2="0.889" y2="5.334" layer="51"/>
<rectangle x1="1.651" y1="3.7338" x2="2.159" y2="3.8608" layer="51"/>
<rectangle x1="1.651" y1="3.8608" x2="2.159" y2="5.334" layer="51"/>
<rectangle x1="2.921" y1="3.7338" x2="3.429" y2="3.8608" layer="51"/>
<rectangle x1="2.921" y1="3.8608" x2="3.429" y2="5.334" layer="51"/>
<rectangle x1="4.191" y1="3.7338" x2="4.699" y2="3.8608" layer="51"/>
<rectangle x1="5.461" y1="3.7338" x2="5.969" y2="3.8608" layer="51"/>
<rectangle x1="4.191" y1="3.8608" x2="4.699" y2="5.334" layer="51"/>
<rectangle x1="5.461" y1="3.8608" x2="5.969" y2="5.334" layer="51"/>
<rectangle x1="4.191" y1="-3.8608" x2="4.699" y2="-3.7338" layer="51"/>
<rectangle x1="5.461" y1="-3.8608" x2="5.969" y2="-3.7338" layer="51"/>
<rectangle x1="4.191" y1="-5.334" x2="4.699" y2="-3.8608" layer="51"/>
<rectangle x1="5.461" y1="-5.334" x2="5.969" y2="-3.8608" layer="51"/>
</package>
<package name="LCC20">
<description>&lt;b&gt;Leadless Chip Carrier&lt;/b&gt;&lt;p&gt; Ceramic Package</description>
<wire x1="-0.4001" y1="4.4" x2="-0.87" y2="4.4" width="0.2032" layer="51"/>
<wire x1="-3.3" y1="4.4" x2="-4.4" y2="3.3" width="0.2032" layer="51"/>
<wire x1="-0.4001" y1="4.3985" x2="0.4001" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-1.6701" y1="4.3985" x2="-0.8699" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.3985" y1="2.14" x2="-4.3985" y2="2.94" width="0.2032" layer="51" curve="180"/>
<wire x1="-2.9401" y1="4.4" x2="-3.3" y2="4.4" width="0.2032" layer="51"/>
<wire x1="0.87" y1="4.4" x2="0.4001" y2="4.4" width="0.2032" layer="51"/>
<wire x1="0.87" y1="4.3985" x2="1.67" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.4" y1="3.3" x2="-4.4" y2="2.9401" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="2.14" x2="-4.4" y2="1.6701" width="0.2032" layer="51"/>
<wire x1="-4.3985" y1="0.87" x2="-4.3985" y2="1.67" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.3985" y1="-0.4001" x2="-4.3985" y2="0.4001" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.3985" y1="-1.6701" x2="-4.3985" y2="-0.8699" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.4" y1="0.87" x2="-4.4" y2="0.4001" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-0.4001" x2="-4.4" y2="-0.87" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-2.9401" x2="-4.4" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-4.4" x2="-4.4" y2="-4.4099" width="0.2032" layer="51"/>
<wire x1="2.14" y1="4.3985" x2="2.94" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="2.14" y1="4.4" x2="1.6701" y2="4.4" width="0.2032" layer="51"/>
<wire x1="4.4" y1="4.4" x2="2.9401" y2="4.4" width="0.2032" layer="51"/>
<wire x1="0.4001" y1="-4.4" x2="0.87" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-0.4001" y1="-4.3985" x2="0.4001" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="0.87" y1="-4.3985" x2="1.67" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="2.9401" y1="-4.4" x2="4.4" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-0.87" y1="-4.4" x2="-0.4001" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-1.6701" y1="-4.3985" x2="-0.8699" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="-2.9401" y1="-4.3985" x2="-2.1399" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="-2.14" y1="-4.4" x2="-1.6701" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-4.4" x2="-2.9401" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="4.4" y1="0.4001" x2="4.4" y2="0.87" width="0.2032" layer="51"/>
<wire x1="4.3985" y1="0.4001" x2="4.3985" y2="-0.4001" width="0.2032" layer="51" curve="180"/>
<wire x1="4.3985" y1="1.6701" x2="4.3985" y2="0.8699" width="0.2032" layer="51" curve="180"/>
<wire x1="4.4" y1="2.9401" x2="4.4" y2="4.4" width="0.2032" layer="51"/>
<wire x1="4.4" y1="-0.87" x2="4.4" y2="-0.4001" width="0.2032" layer="51"/>
<wire x1="4.3985" y1="-0.87" x2="4.3985" y2="-1.67" width="0.2032" layer="51" curve="180"/>
<wire x1="4.3985" y1="-2.14" x2="4.3985" y2="-2.94" width="0.2032" layer="51" curve="180"/>
<wire x1="4.4" y1="-2.14" x2="4.4" y2="-1.6701" width="0.2032" layer="51"/>
<wire x1="4.4" y1="-4.4" x2="4.4" y2="-2.9401" width="0.2032" layer="51"/>
<wire x1="-2.9401" y1="4.3985" x2="-2.1399" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-1.6701" y1="4.4" x2="-2.14" y2="4.4" width="0.2032" layer="51"/>
<wire x1="-4.3985" y1="-2.9401" x2="-4.3985" y2="-2.1399" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.4" y1="-1.6701" x2="-4.4" y2="-2.14" width="0.2032" layer="51"/>
<wire x1="1.6701" y1="-4.4" x2="2.14" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="2.14" y1="-4.3985" x2="2.94" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="4.3985" y1="2.9401" x2="4.3985" y2="2.1399" width="0.2032" layer="51" curve="180"/>
<wire x1="4.4" y1="1.6701" x2="4.4" y2="2.14" width="0.2032" layer="51"/>
<wire x1="-3.3" y1="4.4" x2="-4.4" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="-3.1941" x2="-4.4" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="-4.4" x2="-3.1941" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="3.1941" y1="-4.4" x2="4.4" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="4.4" y1="-4.4" x2="4.4" y2="-3.1941" width="0.2032" layer="21"/>
<wire x1="4.4" y1="3.1941" x2="4.4" y2="4.4" width="0.2032" layer="21"/>
<wire x1="4.4" y1="4.4" x2="3.1941" y2="4.4" width="0.2032" layer="21"/>
<smd name="2" x="-1.27" y="4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="1" x="0" y="3.8001" dx="0.8" dy="3.4" layer="1"/>
<smd name="3" x="-2.54" y="4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="4" x="-4.5001" y="2.54" dx="2" dy="0.8" layer="1"/>
<smd name="5" x="-4.5001" y="1.27" dx="2" dy="0.8" layer="1"/>
<smd name="6" x="-4.5001" y="0" dx="2" dy="0.8" layer="1"/>
<smd name="7" x="-4.5001" y="-1.27" dx="2" dy="0.8" layer="1"/>
<smd name="8" x="-4.5001" y="-2.54" dx="2" dy="0.8" layer="1"/>
<smd name="9" x="-2.54" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="10" x="-1.27" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="11" x="0" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="12" x="1.27" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="13" x="2.54" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="14" x="4.5001" y="-2.54" dx="2" dy="0.8" layer="1"/>
<smd name="15" x="4.5001" y="-1.27" dx="2" dy="0.8" layer="1"/>
<smd name="16" x="4.5001" y="0" dx="2" dy="0.8" layer="1"/>
<smd name="17" x="4.5001" y="1.27" dx="2" dy="0.8" layer="1"/>
<smd name="18" x="4.5001" y="2.54" dx="2" dy="0.8" layer="1"/>
<smd name="19" x="2.54" y="4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="20" x="1.27" y="4.5001" dx="0.8" dy="2" layer="1"/>
<text x="-4.0051" y="6.065" size="1.778" layer="25">&gt;NAME</text>
<text x="-3.9751" y="-7.5601" size="1.778" layer="27">&gt;VALUE</text>
</package>
<package name="DIL16">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="10.16" y1="2.921" x2="-10.16" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="10.16" y1="2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="2.921" x2="-10.16" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="-10.16" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.016" x2="-10.16" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-10.541" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-7.493" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SO16">
<description>&lt;b&gt;Small Outline package&lt;/b&gt; 150 mil</description>
<wire x1="4.699" y1="1.9558" x2="-4.699" y2="1.9558" width="0.1524" layer="51"/>
<wire x1="4.699" y1="-1.9558" x2="5.08" y2="-1.5748" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.5748" x2="-4.699" y2="1.9558" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="1.9558" x2="5.08" y2="1.5748" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.5748" x2="-4.699" y2="-1.9558" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="-1.9558" x2="4.699" y2="-1.9558" width="0.1524" layer="51"/>
<wire x1="5.08" y1="-1.5748" x2="5.08" y2="1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.5748" x2="-5.08" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.508" x2="-5.08" y2="-1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21" curve="-180"/>
<wire x1="-5.08" y1="-1.6002" x2="5.08" y2="-1.6002" width="0.0508" layer="21"/>
<smd name="1" x="-4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="16" x="-4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="2" x="-3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="3" x="-1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="15" x="-3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="14" x="-1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="4" x="-0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="13" x="-0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="5" x="0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="12" x="0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="6" x="1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="7" x="3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="11" x="1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="10" x="3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="8" x="4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="9" x="4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<text x="-3.81" y="-0.762" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.461" y="-1.905" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-0.889" y1="1.9558" x2="-0.381" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="-3.0988" x2="-4.191" y2="-1.9558" layer="51"/>
<rectangle x1="-3.429" y1="-3.0988" x2="-2.921" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="-3.0734" x2="-1.651" y2="-1.9304" layer="51"/>
<rectangle x1="-0.889" y1="-3.0988" x2="-0.381" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="1.9558" x2="-1.651" y2="3.0988" layer="51"/>
<rectangle x1="-3.429" y1="1.9558" x2="-2.921" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="1.9558" x2="-4.191" y2="3.0988" layer="51"/>
<rectangle x1="0.381" y1="-3.0988" x2="0.889" y2="-1.9558" layer="51"/>
<rectangle x1="1.651" y1="-3.0988" x2="2.159" y2="-1.9558" layer="51"/>
<rectangle x1="2.921" y1="-3.0988" x2="3.429" y2="-1.9558" layer="51"/>
<rectangle x1="4.191" y1="-3.0988" x2="4.699" y2="-1.9558" layer="51"/>
<rectangle x1="0.381" y1="1.9558" x2="0.889" y2="3.0988" layer="51"/>
<rectangle x1="1.651" y1="1.9558" x2="2.159" y2="3.0988" layer="51"/>
<rectangle x1="2.921" y1="1.9558" x2="3.429" y2="3.0988" layer="51"/>
<rectangle x1="4.191" y1="1.9558" x2="4.699" y2="3.0988" layer="51"/>
</package>
<package name="DIL14">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="8.89" y1="2.921" x2="-8.89" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-2.921" x2="8.89" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="8.89" y1="2.921" x2="8.89" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="2.921" x2="-8.89" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-2.921" x2="-8.89" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="1.016" x2="-8.89" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-7.62" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-5.08" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="7.62" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="7.62" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-2.54" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="0" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="5.08" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="2.54" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="5.08" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="2.54" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="0" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="-2.54" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-5.08" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-7.62" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-9.271" y="-3.048" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-6.731" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SO14">
<description>&lt;b&gt;Small Outline package&lt;/b&gt; 150 mil</description>
<wire x1="4.064" y1="1.9558" x2="-4.064" y2="1.9558" width="0.1524" layer="51"/>
<wire x1="4.064" y1="-1.9558" x2="4.445" y2="-1.5748" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.445" y1="1.5748" x2="-4.064" y2="1.9558" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.064" y1="1.9558" x2="4.445" y2="1.5748" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.445" y1="-1.5748" x2="-4.064" y2="-1.9558" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.064" y1="-1.9558" x2="4.064" y2="-1.9558" width="0.1524" layer="51"/>
<wire x1="4.445" y1="-1.5748" x2="4.445" y2="1.5748" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.5748" x2="-4.445" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="0.508" x2="-4.445" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-0.508" x2="-4.445" y2="-1.5748" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="0.508" x2="-4.445" y2="-0.508" width="0.1524" layer="21" curve="-180"/>
<wire x1="-4.445" y1="-1.6002" x2="4.445" y2="-1.6002" width="0.0508" layer="21"/>
<smd name="1" x="-3.81" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="14" x="-3.81" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="2" x="-2.54" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="3" x="-1.27" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="13" x="-2.54" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="12" x="-1.27" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="4" x="0" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="11" x="0" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="5" x="1.27" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="6" x="2.54" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="10" x="1.27" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="9" x="2.54" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="7" x="3.81" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="8" x="3.81" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<text x="-3.175" y="-0.762" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-4.826" y="-1.905" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-0.254" y1="1.9558" x2="0.254" y2="3.0988" layer="51"/>
<rectangle x1="-4.064" y1="-3.0988" x2="-3.556" y2="-1.9558" layer="51"/>
<rectangle x1="-2.794" y1="-3.0988" x2="-2.286" y2="-1.9558" layer="51"/>
<rectangle x1="-1.524" y1="-3.0734" x2="-1.016" y2="-1.9304" layer="51"/>
<rectangle x1="-0.254" y1="-3.0988" x2="0.254" y2="-1.9558" layer="51"/>
<rectangle x1="-1.524" y1="1.9558" x2="-1.016" y2="3.0988" layer="51"/>
<rectangle x1="-2.794" y1="1.9558" x2="-2.286" y2="3.0988" layer="51"/>
<rectangle x1="-4.064" y1="1.9558" x2="-3.556" y2="3.0988" layer="51"/>
<rectangle x1="1.016" y1="1.9558" x2="1.524" y2="3.0988" layer="51"/>
<rectangle x1="2.286" y1="1.9558" x2="2.794" y2="3.0988" layer="51"/>
<rectangle x1="3.556" y1="1.9558" x2="4.064" y2="3.0988" layer="51"/>
<rectangle x1="1.016" y1="-3.0988" x2="1.524" y2="-1.9558" layer="51"/>
<rectangle x1="2.286" y1="-3.0988" x2="2.794" y2="-1.9558" layer="51"/>
<rectangle x1="3.556" y1="-3.0988" x2="4.064" y2="-1.9558" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="74245">
<wire x1="-7.62" y1="-15.24" x2="7.62" y2="-15.24" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-15.24" x2="7.62" y2="15.24" width="0.4064" layer="94"/>
<wire x1="7.62" y1="15.24" x2="-7.62" y2="15.24" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="15.24" x2="-7.62" y2="-15.24" width="0.4064" layer="94"/>
<text x="-7.62" y="15.875" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-17.78" size="1.778" layer="96">&gt;VALUE</text>
<pin name="DIR" x="-12.7" y="-10.16" length="middle" direction="in"/>
<pin name="A1" x="-12.7" y="12.7" length="middle"/>
<pin name="A2" x="-12.7" y="10.16" length="middle"/>
<pin name="A3" x="-12.7" y="7.62" length="middle"/>
<pin name="A4" x="-12.7" y="5.08" length="middle"/>
<pin name="A5" x="-12.7" y="2.54" length="middle"/>
<pin name="A6" x="-12.7" y="0" length="middle"/>
<pin name="A7" x="-12.7" y="-2.54" length="middle"/>
<pin name="A8" x="-12.7" y="-5.08" length="middle"/>
<pin name="B8" x="12.7" y="-5.08" length="middle" rot="R180"/>
<pin name="B7" x="12.7" y="-2.54" length="middle" rot="R180"/>
<pin name="B6" x="12.7" y="0" length="middle" rot="R180"/>
<pin name="B5" x="12.7" y="2.54" length="middle" rot="R180"/>
<pin name="B4" x="12.7" y="5.08" length="middle" rot="R180"/>
<pin name="B3" x="12.7" y="7.62" length="middle" rot="R180"/>
<pin name="B2" x="12.7" y="10.16" length="middle" rot="R180"/>
<pin name="B1" x="12.7" y="12.7" length="middle" rot="R180"/>
<pin name="G" x="-12.7" y="-12.7" length="middle" direction="in" function="dot"/>
</symbol>
<symbol name="PWRN">
<text x="-0.635" y="-0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="1.905" y="-5.842" size="1.27" layer="95" rot="R90">GND</text>
<text x="1.905" y="2.54" size="1.27" layer="95" rot="R90">VCC</text>
<pin name="GND" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="VCC" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
</symbol>
<symbol name="74157">
<wire x1="-7.62" y1="-15.24" x2="7.62" y2="-15.24" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-15.24" x2="7.62" y2="15.24" width="0.4064" layer="94"/>
<wire x1="7.62" y1="15.24" x2="-7.62" y2="15.24" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="15.24" x2="-7.62" y2="-15.24" width="0.4064" layer="94"/>
<text x="-7.62" y="15.875" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-17.78" size="1.778" layer="96">&gt;VALUE</text>
<pin name="!A!/B" x="-12.7" y="-10.16" length="middle" direction="in"/>
<pin name="1A" x="-12.7" y="12.7" length="middle" direction="in"/>
<pin name="1B" x="-12.7" y="10.16" length="middle" direction="in"/>
<pin name="1Y" x="12.7" y="12.7" length="middle" direction="out" rot="R180"/>
<pin name="2A" x="-12.7" y="7.62" length="middle" direction="in"/>
<pin name="2B" x="-12.7" y="5.08" length="middle" direction="in"/>
<pin name="2Y" x="12.7" y="7.62" length="middle" direction="out" rot="R180"/>
<pin name="3Y" x="12.7" y="2.54" length="middle" direction="out" rot="R180"/>
<pin name="3B" x="-12.7" y="0" length="middle" direction="in"/>
<pin name="3A" x="-12.7" y="2.54" length="middle" direction="in"/>
<pin name="4Y" x="12.7" y="-2.54" length="middle" direction="out" rot="R180"/>
<pin name="4B" x="-12.7" y="-5.08" length="middle" direction="in"/>
<pin name="4A" x="-12.7" y="-2.54" length="middle" direction="in"/>
<pin name="G" x="-12.7" y="-12.7" length="middle" direction="in" function="dot"/>
</symbol>
<symbol name="7404">
<wire x1="-5.08" y1="5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<text x="2.54" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="I" x="-10.16" y="0" visible="pad" length="middle" direction="in"/>
<pin name="O" x="10.16" y="0" visible="pad" length="middle" direction="out" function="dot" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="74*245" prefix="IC">
<description>Octal &lt;b&gt;BUS TRANSCEIVER&lt;/b&gt;, 3-state</description>
<gates>
<gate name="A" symbol="74245" x="20.32" y="0"/>
<gate name="P" symbol="PWRN" x="-5.08" y="0" addlevel="request"/>
</gates>
<devices>
<device name="N" package="DIL20">
<connects>
<connect gate="A" pin="A1" pad="2"/>
<connect gate="A" pin="A2" pad="3"/>
<connect gate="A" pin="A3" pad="4"/>
<connect gate="A" pin="A4" pad="5"/>
<connect gate="A" pin="A5" pad="6"/>
<connect gate="A" pin="A6" pad="7"/>
<connect gate="A" pin="A7" pad="8"/>
<connect gate="A" pin="A8" pad="9"/>
<connect gate="A" pin="B1" pad="18"/>
<connect gate="A" pin="B2" pad="17"/>
<connect gate="A" pin="B3" pad="16"/>
<connect gate="A" pin="B4" pad="15"/>
<connect gate="A" pin="B5" pad="14"/>
<connect gate="A" pin="B6" pad="13"/>
<connect gate="A" pin="B7" pad="12"/>
<connect gate="A" pin="B8" pad="11"/>
<connect gate="A" pin="DIR" pad="1"/>
<connect gate="A" pin="G" pad="19"/>
<connect gate="P" pin="GND" pad="10"/>
<connect gate="P" pin="VCC" pad="20"/>
</connects>
<technologies>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
</technologies>
</device>
<device name="DW" package="SO20W">
<connects>
<connect gate="A" pin="A1" pad="2"/>
<connect gate="A" pin="A2" pad="3"/>
<connect gate="A" pin="A3" pad="4"/>
<connect gate="A" pin="A4" pad="5"/>
<connect gate="A" pin="A5" pad="6"/>
<connect gate="A" pin="A6" pad="7"/>
<connect gate="A" pin="A7" pad="8"/>
<connect gate="A" pin="A8" pad="9"/>
<connect gate="A" pin="B1" pad="18"/>
<connect gate="A" pin="B2" pad="17"/>
<connect gate="A" pin="B3" pad="16"/>
<connect gate="A" pin="B4" pad="15"/>
<connect gate="A" pin="B5" pad="14"/>
<connect gate="A" pin="B6" pad="13"/>
<connect gate="A" pin="B7" pad="12"/>
<connect gate="A" pin="B8" pad="11"/>
<connect gate="A" pin="DIR" pad="1"/>
<connect gate="A" pin="G" pad="19"/>
<connect gate="P" pin="GND" pad="10"/>
<connect gate="P" pin="VCC" pad="20"/>
</connects>
<technologies>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
</technologies>
</device>
<device name="FK" package="LCC20">
<connects>
<connect gate="A" pin="A1" pad="2"/>
<connect gate="A" pin="A2" pad="3"/>
<connect gate="A" pin="A3" pad="4"/>
<connect gate="A" pin="A4" pad="5"/>
<connect gate="A" pin="A5" pad="6"/>
<connect gate="A" pin="A6" pad="7"/>
<connect gate="A" pin="A7" pad="8"/>
<connect gate="A" pin="A8" pad="9"/>
<connect gate="A" pin="B1" pad="18"/>
<connect gate="A" pin="B2" pad="17"/>
<connect gate="A" pin="B3" pad="16"/>
<connect gate="A" pin="B4" pad="15"/>
<connect gate="A" pin="B5" pad="14"/>
<connect gate="A" pin="B6" pad="13"/>
<connect gate="A" pin="B7" pad="12"/>
<connect gate="A" pin="B8" pad="11"/>
<connect gate="A" pin="DIR" pad="1"/>
<connect gate="A" pin="G" pad="19"/>
<connect gate="P" pin="GND" pad="10"/>
<connect gate="P" pin="VCC" pad="20"/>
</connects>
<technologies>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="74*157" prefix="IC">
<description>Quadruple 2-line to 1-line data &lt;b&gt;SELECTOR/MULTIPLEXER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="74157" x="20.32" y="0"/>
<gate name="P" symbol="PWRN" x="-5.08" y="0" addlevel="request"/>
</gates>
<devices>
<device name="N" package="DIL16">
<connects>
<connect gate="A" pin="!A!/B" pad="1"/>
<connect gate="A" pin="1A" pad="2"/>
<connect gate="A" pin="1B" pad="3"/>
<connect gate="A" pin="1Y" pad="4"/>
<connect gate="A" pin="2A" pad="5"/>
<connect gate="A" pin="2B" pad="6"/>
<connect gate="A" pin="2Y" pad="7"/>
<connect gate="A" pin="3A" pad="11"/>
<connect gate="A" pin="3B" pad="10"/>
<connect gate="A" pin="3Y" pad="9"/>
<connect gate="A" pin="4A" pad="14"/>
<connect gate="A" pin="4B" pad="13"/>
<connect gate="A" pin="4Y" pad="12"/>
<connect gate="A" pin="G" pad="15"/>
<connect gate="P" pin="GND" pad="8"/>
<connect gate="P" pin="VCC" pad="16"/>
</connects>
<technologies>
<technology name=""/>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
<technology name="S"/>
</technologies>
</device>
<device name="D" package="SO16">
<connects>
<connect gate="A" pin="!A!/B" pad="1"/>
<connect gate="A" pin="1A" pad="2"/>
<connect gate="A" pin="1B" pad="3"/>
<connect gate="A" pin="1Y" pad="4"/>
<connect gate="A" pin="2A" pad="5"/>
<connect gate="A" pin="2B" pad="6"/>
<connect gate="A" pin="2Y" pad="7"/>
<connect gate="A" pin="3A" pad="11"/>
<connect gate="A" pin="3B" pad="10"/>
<connect gate="A" pin="3Y" pad="9"/>
<connect gate="A" pin="4A" pad="14"/>
<connect gate="A" pin="4B" pad="13"/>
<connect gate="A" pin="4Y" pad="12"/>
<connect gate="A" pin="G" pad="15"/>
<connect gate="P" pin="GND" pad="8"/>
<connect gate="P" pin="VCC" pad="16"/>
</connects>
<technologies>
<technology name=""/>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
<technology name="S"/>
</technologies>
</device>
<device name="FK" package="LCC20">
<connects>
<connect gate="A" pin="!A!/B" pad="2"/>
<connect gate="A" pin="1A" pad="3"/>
<connect gate="A" pin="1B" pad="4"/>
<connect gate="A" pin="1Y" pad="5"/>
<connect gate="A" pin="2A" pad="7"/>
<connect gate="A" pin="2B" pad="8"/>
<connect gate="A" pin="2Y" pad="9"/>
<connect gate="A" pin="3A" pad="14"/>
<connect gate="A" pin="3B" pad="13"/>
<connect gate="A" pin="3Y" pad="12"/>
<connect gate="A" pin="4A" pad="18"/>
<connect gate="A" pin="4B" pad="17"/>
<connect gate="A" pin="4Y" pad="15"/>
<connect gate="A" pin="G" pad="19"/>
<connect gate="P" pin="GND" pad="10"/>
<connect gate="P" pin="VCC" pad="20"/>
</connects>
<technologies>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
<technology name="S"/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="74*04" prefix="IC">
<description>Hex &lt;b&gt;INVERTER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="7404" x="17.78" y="0" swaplevel="1"/>
<gate name="B" symbol="7404" x="17.78" y="-12.7" swaplevel="1"/>
<gate name="C" symbol="7404" x="17.78" y="-25.4" swaplevel="1"/>
<gate name="D" symbol="7404" x="45.72" y="0" swaplevel="1"/>
<gate name="E" symbol="7404" x="45.72" y="-12.7" swaplevel="1"/>
<gate name="F" symbol="7404" x="45.72" y="-25.4" swaplevel="1"/>
<gate name="P" symbol="PWRN" x="-5.08" y="-10.16" addlevel="request"/>
</gates>
<devices>
<device name="N" package="DIL14">
<connects>
<connect gate="A" pin="I" pad="1"/>
<connect gate="A" pin="O" pad="2"/>
<connect gate="B" pin="I" pad="3"/>
<connect gate="B" pin="O" pad="4"/>
<connect gate="C" pin="I" pad="5"/>
<connect gate="C" pin="O" pad="6"/>
<connect gate="D" pin="I" pad="9"/>
<connect gate="D" pin="O" pad="8"/>
<connect gate="E" pin="I" pad="11"/>
<connect gate="E" pin="O" pad="10"/>
<connect gate="F" pin="I" pad="13"/>
<connect gate="F" pin="O" pad="12"/>
<connect gate="P" pin="GND" pad="7"/>
<connect gate="P" pin="VCC" pad="14"/>
</connects>
<technologies>
<technology name=""/>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="ALS"/>
<technology name="AS"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
<technology name="S"/>
</technologies>
</device>
<device name="D" package="SO14">
<connects>
<connect gate="A" pin="I" pad="1"/>
<connect gate="A" pin="O" pad="2"/>
<connect gate="B" pin="I" pad="3"/>
<connect gate="B" pin="O" pad="4"/>
<connect gate="C" pin="I" pad="5"/>
<connect gate="C" pin="O" pad="6"/>
<connect gate="D" pin="I" pad="9"/>
<connect gate="D" pin="O" pad="8"/>
<connect gate="E" pin="I" pad="11"/>
<connect gate="E" pin="O" pad="10"/>
<connect gate="F" pin="I" pad="13"/>
<connect gate="F" pin="O" pad="12"/>
<connect gate="P" pin="GND" pad="7"/>
<connect gate="P" pin="VCC" pad="14"/>
</connects>
<technologies>
<technology name=""/>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="ALS"/>
<technology name="AS"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
<technology name="S"/>
</technologies>
</device>
<device name="FK" package="LCC20">
<connects>
<connect gate="A" pin="I" pad="2"/>
<connect gate="A" pin="O" pad="3"/>
<connect gate="B" pin="I" pad="4"/>
<connect gate="B" pin="O" pad="6"/>
<connect gate="C" pin="I" pad="8"/>
<connect gate="C" pin="O" pad="9"/>
<connect gate="D" pin="I" pad="13"/>
<connect gate="D" pin="O" pad="12"/>
<connect gate="E" pin="I" pad="16"/>
<connect gate="E" pin="O" pad="14"/>
<connect gate="F" pin="I" pad="19"/>
<connect gate="F" pin="O" pad="18"/>
<connect gate="P" pin="GND" pad="10"/>
<connect gate="P" pin="VCC" pad="20"/>
</connects>
<technologies>
<technology name=""/>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
<technology name="S"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X08">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-0.635" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.27" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-10.2362" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.16" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="-9.144" y1="-0.254" x2="-8.636" y2="0.254" layer="51"/>
<rectangle x1="8.636" y1="-0.254" x2="9.144" y2="0.254" layer="51"/>
</package>
<package name="1X08/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-10.16" y1="-1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="6.985" x2="-8.89" y2="1.27" width="0.762" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.985" x2="-6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="6.985" x2="8.89" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-10.795" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="12.065" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-9.271" y1="0.635" x2="-8.509" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="8.509" y1="0.635" x2="9.271" y2="1.143" layer="21"/>
<rectangle x1="-9.271" y1="-2.921" x2="-8.509" y2="-1.905" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
<rectangle x1="8.509" y1="-2.921" x2="9.271" y2="-1.905" layer="21"/>
</package>
<package name="1X06">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-7.6962" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-7.62" y1="-1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.985" x2="-6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-8.255" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="9.525" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
</package>
<package name="1X05">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-6.4262" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.35" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="-5.334" y1="-0.254" x2="-4.826" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
</package>
<package name="1X05/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-6.985" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="8.255" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
</package>
<package name="1X02">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-2.6162" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
</package>
<package name="1X02/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-3.175" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="4.445" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="PINHD8">
<wire x1="-6.35" y1="-10.16" x2="1.27" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-10.16" x2="1.27" y2="12.7" width="0.4064" layer="94"/>
<wire x1="1.27" y1="12.7" x2="-6.35" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="12.7" x2="-6.35" y2="-10.16" width="0.4064" layer="94"/>
<text x="-6.35" y="13.335" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD6">
<wire x1="-6.35" y1="-7.62" x2="1.27" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="1.27" y2="10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="10.16" x2="-6.35" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="10.16" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD5">
<wire x1="-6.35" y1="-7.62" x2="1.27" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD2">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X8" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X08">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X08/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X6" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD6" x="0" y="-2.54"/>
</gates>
<devices>
<device name="" package="1X06">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X06/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X5" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X05">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X05/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X2" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X02">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X02/90">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="40xx">
<description>&lt;b&gt;CMOS Logic Devices, 4000 Series&lt;/b&gt;&lt;p&gt;
Based on the following sources:
&lt;ul&gt;
&lt;li&gt;Motorola &lt;i&gt;CMOS LOGIC DATA&lt;/i&gt;; book, 02/88, DL131 REV 1
&lt;li&gt;http://www.elexp.com
&lt;li&gt;http://www.intersil.com
&lt;li&gt;http://www.ls3c.com.tw/product/1/COMOS.html
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL16">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="10.16" y1="2.921" x2="-10.16" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="10.16" y1="2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="2.921" x2="-10.16" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="-10.16" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.016" x2="-10.16" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-10.541" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-7.493" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SO16">
<description>&lt;b&gt;Small Outline package&lt;/b&gt; 150 mil</description>
<wire x1="4.699" y1="1.9558" x2="-4.699" y2="1.9558" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-1.9558" x2="5.08" y2="-1.5748" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.5748" x2="-4.699" y2="1.9558" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="1.9558" x2="5.08" y2="1.5748" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.5748" x2="-4.699" y2="-1.9558" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="-1.9558" x2="4.699" y2="-1.9558" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.5748" x2="5.08" y2="1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.5748" x2="-5.08" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.508" x2="-5.08" y2="-1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21" curve="-180"/>
<wire x1="-5.08" y1="-1.6002" x2="5.08" y2="-1.6002" width="0.0508" layer="21"/>
<smd name="1" x="-4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="16" x="-4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="2" x="-3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="3" x="-1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="15" x="-3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="14" x="-1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="4" x="-0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="13" x="-0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="5" x="0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="12" x="0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="6" x="1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="7" x="3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="11" x="1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="10" x="3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="8" x="4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="9" x="4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<text x="-4.064" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.461" y="-2.032" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-0.889" y1="1.9558" x2="-0.381" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="-3.0988" x2="-4.191" y2="-1.9558" layer="51"/>
<rectangle x1="-3.429" y1="-3.0988" x2="-2.921" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="-3.0734" x2="-1.651" y2="-1.9304" layer="51"/>
<rectangle x1="-0.889" y1="-3.0988" x2="-0.381" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="1.9558" x2="-1.651" y2="3.0988" layer="51"/>
<rectangle x1="-3.429" y1="1.9558" x2="-2.921" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="1.9558" x2="-4.191" y2="3.0988" layer="51"/>
<rectangle x1="0.381" y1="-3.0988" x2="0.889" y2="-1.9558" layer="51"/>
<rectangle x1="1.651" y1="-3.0988" x2="2.159" y2="-1.9558" layer="51"/>
<rectangle x1="2.921" y1="-3.0988" x2="3.429" y2="-1.9558" layer="51"/>
<rectangle x1="4.191" y1="-3.0988" x2="4.699" y2="-1.9558" layer="51"/>
<rectangle x1="0.381" y1="1.9558" x2="0.889" y2="3.0988" layer="51"/>
<rectangle x1="1.651" y1="1.9558" x2="2.159" y2="3.0988" layer="51"/>
<rectangle x1="2.921" y1="1.9558" x2="3.429" y2="3.0988" layer="51"/>
<rectangle x1="4.191" y1="1.9558" x2="4.699" y2="3.0988" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="4040">
<wire x1="-7.62" y1="-17.78" x2="7.62" y2="-17.78" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-17.78" x2="7.62" y2="15.24" width="0.4064" layer="94"/>
<wire x1="7.62" y1="15.24" x2="-7.62" y2="15.24" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="15.24" x2="-7.62" y2="-17.78" width="0.4064" layer="94"/>
<text x="-7.62" y="15.875" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-20.32" size="1.778" layer="96">&gt;VALUE</text>
<pin name="Q12" x="12.7" y="-15.24" length="middle" direction="out" rot="R180"/>
<pin name="Q6" x="12.7" y="0" length="middle" direction="out" rot="R180"/>
<pin name="Q5" x="12.7" y="2.54" length="middle" direction="out" rot="R180"/>
<pin name="Q7" x="12.7" y="-2.54" length="middle" direction="out" rot="R180"/>
<pin name="Q4" x="12.7" y="5.08" length="middle" direction="out" rot="R180"/>
<pin name="Q3" x="12.7" y="7.62" length="middle" direction="out" rot="R180"/>
<pin name="Q2" x="12.7" y="10.16" length="middle" direction="out" rot="R180"/>
<pin name="Q1" x="12.7" y="12.7" length="middle" direction="out" rot="R180"/>
<pin name="P1" x="-12.7" y="12.7" length="middle" direction="in" function="dotclk"/>
<pin name="RES" x="-12.7" y="-15.24" length="middle" direction="in"/>
<pin name="Q9" x="12.7" y="-7.62" length="middle" direction="out" rot="R180"/>
<pin name="Q8" x="12.7" y="-5.08" length="middle" direction="out" rot="R180"/>
<pin name="Q10" x="12.7" y="-10.16" length="middle" direction="out" rot="R180"/>
<pin name="Q11" x="12.7" y="-12.7" length="middle" direction="out" rot="R180"/>
</symbol>
<symbol name="PWRN">
<text x="-1.27" y="-0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="1.905" y="2.54" size="1.27" layer="95" rot="R90">VDD</text>
<text x="1.905" y="-5.842" size="1.27" layer="95" rot="R90">VSS</text>
<pin name="VSS" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="VDD" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="4040" prefix="IC">
<description>12-stage binary/ripple &lt;b&gt;COUNTER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="4040" x="15.24" y="0"/>
<gate name="P" symbol="PWRN" x="-5.08" y="0" addlevel="request"/>
</gates>
<devices>
<device name="N" package="DIL16">
<connects>
<connect gate="A" pin="P1" pad="10"/>
<connect gate="A" pin="Q1" pad="9"/>
<connect gate="A" pin="Q10" pad="14"/>
<connect gate="A" pin="Q11" pad="15"/>
<connect gate="A" pin="Q12" pad="1"/>
<connect gate="A" pin="Q2" pad="7"/>
<connect gate="A" pin="Q3" pad="6"/>
<connect gate="A" pin="Q4" pad="5"/>
<connect gate="A" pin="Q5" pad="3"/>
<connect gate="A" pin="Q6" pad="2"/>
<connect gate="A" pin="Q7" pad="4"/>
<connect gate="A" pin="Q8" pad="13"/>
<connect gate="A" pin="Q9" pad="12"/>
<connect gate="A" pin="RES" pad="11"/>
<connect gate="P" pin="VDD" pad="16"/>
<connect gate="P" pin="VSS" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="D" package="SO16">
<connects>
<connect gate="A" pin="P1" pad="10"/>
<connect gate="A" pin="Q1" pad="9"/>
<connect gate="A" pin="Q10" pad="14"/>
<connect gate="A" pin="Q11" pad="15"/>
<connect gate="A" pin="Q12" pad="1"/>
<connect gate="A" pin="Q2" pad="7"/>
<connect gate="A" pin="Q3" pad="6"/>
<connect gate="A" pin="Q4" pad="5"/>
<connect gate="A" pin="Q5" pad="3"/>
<connect gate="A" pin="Q6" pad="2"/>
<connect gate="A" pin="Q7" pad="4"/>
<connect gate="A" pin="Q8" pad="13"/>
<connect gate="A" pin="Q9" pad="12"/>
<connect gate="A" pin="RES" pad="11"/>
<connect gate="P" pin="VDD" pad="16"/>
<connect gate="P" pin="VSS" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="VCC">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VCC" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="VCC" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="SRAM" deviceset="K6X1008C2D" device=""/>
<part name="IC2" library="SRAM" deviceset="K6X1008C2D" device=""/>
<part name="IC4" library="74xx-eu" deviceset="74*245" device="DW" technology="HC"/>
<part name="IC3" library="74xx-eu" deviceset="74*245" device="DW" technology="HC"/>
<part name="IC5" library="74xx-eu" deviceset="74*157" device="D" technology="HC"/>
<part name="IC6" library="74xx-eu" deviceset="74*157" device="D" technology="HC"/>
<part name="IC9" library="74xx-eu" deviceset="74*157" device="D" technology="HC"/>
<part name="JP1" library="pinhead" deviceset="PINHD-1X8" device="" value="Data I/O"/>
<part name="JP2" library="pinhead" deviceset="PINHD-1X8" device="" value="Video Output"/>
<part name="IC11" library="74xx-eu" deviceset="74*04" device="D" technology="HC"/>
<part name="IC12" library="74xx-eu" deviceset="74*245" device="DW" technology="HC"/>
<part name="IC7" library="40xx" deviceset="4040" device="D"/>
<part name="IC8" library="40xx" deviceset="4040" device="D"/>
<part name="IC13" library="40xx" deviceset="4040" device="D"/>
<part name="IC14" library="40xx" deviceset="4040" device="D"/>
<part name="IC15" library="74xx-eu" deviceset="74*157" device="D" technology="HC"/>
<part name="IC16" library="74xx-eu" deviceset="74*157" device="D" technology="HC"/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="P+2" library="supply1" deviceset="VCC" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="P+3" library="supply1" deviceset="VCC" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="JP4" library="pinhead" deviceset="PINHD-1X6" device="" value="Data Control"/>
<part name="JP5" library="pinhead" deviceset="PINHD-1X5" device="" value="Video Control"/>
<part name="JP6" library="pinhead" deviceset="PINHD-1X2" device="" value="Copy Control"/>
<part name="JP7" library="pinhead" deviceset="PINHD-1X2" device="" value="Supply"/>
<part name="P+4" library="supply1" deviceset="VCC" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="P+5" library="supply1" deviceset="VCC" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-243.84" y="15.24" size="5.08" layer="91">DATA I/O</text>
<text x="317.5" y="15.24" size="5.08" layer="91">VIDEO OUT</text>
<text x="58.42" y="35.56" size="2.1844" layer="91" align="bottom-center">**OPTIONAL**
RAM copy
interface</text>
<text x="-121.92" y="-35.56" size="1.778" layer="97">A</text>
<text x="-121.92" y="2.54" size="1.778" layer="97">B</text>
<text x="2.54" y="7.62" size="6.4516" layer="97">A</text>
<text x="182.88" y="7.62" size="6.4516" layer="97">B</text>
<text x="-12.7" y="-71.12" size="1.778" layer="97">B</text>
<text x="-12.7" y="-81.28" size="1.778" layer="97">B</text>
<text x="-12.7" y="-76.2" size="1.778" layer="97">A</text>
<text x="-12.7" y="-86.36" size="1.778" layer="97">A</text>
<text x="-12.7" y="-116.84" size="1.778" layer="97">B</text>
<text x="-12.7" y="-121.92" size="1.778" layer="97">A</text>
<text x="-12.7" y="-127" size="1.778" layer="97">B</text>
<text x="-12.7" y="-132.08" size="1.778" layer="97">A</text>
<text x="-12.7" y="-162.56" size="1.778" layer="97">B</text>
<text x="-12.7" y="-167.64" size="1.778" layer="97">A</text>
</plain>
<instances>
<instance part="IC1" gate="IC$1" x="5.08" y="-7.62"/>
<instance part="IC2" gate="IC$1" x="185.42" y="-7.62"/>
<instance part="IC4" gate="A" x="-132.08" y="-25.4"/>
<instance part="IC3" gate="A" x="-132.08" y="12.7"/>
<instance part="IC5" gate="A" x="271.78" y="-25.4"/>
<instance part="IC6" gate="A" x="271.78" y="12.7"/>
<instance part="IC9" gate="A" x="-27.94" y="-129.54"/>
<instance part="JP1" gate="A" x="-208.28" y="15.24" rot="MR0"/>
<instance part="JP2" gate="A" x="312.42" y="15.24"/>
<instance part="IC11" gate="A" x="-160.02" y="-45.72"/>
<instance part="IC12" gate="A" x="88.9" y="40.64" rot="MR90"/>
<instance part="IC7" gate="A" x="-48.26" y="-20.32"/>
<instance part="IC8" gate="A" x="132.08" y="-20.32"/>
<instance part="IC13" gate="A" x="-48.26" y="22.86"/>
<instance part="IC14" gate="A" x="132.08" y="22.86"/>
<instance part="IC15" gate="A" x="-27.94" y="-83.82"/>
<instance part="IC16" gate="A" x="-27.94" y="-175.26"/>
<instance part="IC11" gate="B" x="-78.74" y="-172.72"/>
<instance part="GND2" gate="1" x="-48.26" y="-193.04"/>
<instance part="P+2" gate="VCC" x="27.94" y="-7.62"/>
<instance part="GND3" gate="1" x="25.4" y="-35.56"/>
<instance part="P+3" gate="VCC" x="208.28" y="-7.62"/>
<instance part="GND4" gate="1" x="205.74" y="-35.56"/>
<instance part="IC11" gate="C" x="-180.34" y="-48.26" rot="R90"/>
<instance part="JP4" gate="A" x="-208.28" y="-73.66" rot="MR0"/>
<instance part="JP5" gate="A" x="-208.28" y="-104.14" rot="MR0"/>
<instance part="JP6" gate="G$1" x="-208.28" y="-129.54" rot="MR0"/>
<instance part="JP7" gate="G$1" x="-208.28" y="109.22" rot="MR0"/>
<instance part="IC3" gate="P" x="-175.26" y="111.76"/>
<instance part="IC4" gate="P" x="-167.64" y="111.76"/>
<instance part="IC13" gate="P" x="-106.68" y="111.76"/>
<instance part="IC7" gate="P" x="-144.78" y="111.76"/>
<instance part="IC12" gate="P" x="-114.3" y="111.76"/>
<instance part="IC14" gate="P" x="-99.06" y="111.76"/>
<instance part="IC8" gate="P" x="-137.16" y="111.76"/>
<instance part="IC6" gate="P" x="-152.4" y="111.76"/>
<instance part="IC5" gate="P" x="-160.02" y="111.76"/>
<instance part="IC15" gate="P" x="-91.44" y="111.76"/>
<instance part="IC9" gate="P" x="-129.54" y="111.76"/>
<instance part="IC16" gate="P" x="-83.82" y="111.76"/>
<instance part="IC11" gate="P" x="-121.92" y="111.76"/>
<instance part="P+4" gate="VCC" x="-193.04" y="127"/>
<instance part="GND5" gate="1" x="-193.04" y="96.52"/>
<instance part="P+5" gate="VCC" x="-43.18" y="-147.32"/>
</instances>
<busses>
</busses>
<nets>
<net name="IO1" class="0">
<segment>
<pinref part="IC3" gate="A" pin="A1"/>
<wire x1="-144.78" y1="25.4" x2="-147.32" y2="25.4" width="0.1524" layer="91"/>
<wire x1="-147.32" y1="25.4" x2="-147.32" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="IC4" gate="A" pin="A1"/>
<wire x1="-147.32" y1="-12.7" x2="-144.78" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="-147.32" y1="25.4" x2="-205.74" y2="25.4" width="0.1524" layer="91"/>
<junction x="-147.32" y="25.4"/>
<pinref part="JP1" gate="A" pin="1"/>
</segment>
</net>
<net name="IO2" class="0">
<segment>
<pinref part="IC4" gate="A" pin="A2"/>
<wire x1="-144.78" y1="-15.24" x2="-149.86" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="-149.86" y1="-15.24" x2="-149.86" y2="22.86" width="0.1524" layer="91"/>
<pinref part="IC3" gate="A" pin="A2"/>
<wire x1="-149.86" y1="22.86" x2="-144.78" y2="22.86" width="0.1524" layer="91"/>
<wire x1="-149.86" y1="22.86" x2="-205.74" y2="22.86" width="0.1524" layer="91"/>
<junction x="-149.86" y="22.86"/>
<pinref part="JP1" gate="A" pin="2"/>
</segment>
</net>
<net name="IO3" class="0">
<segment>
<pinref part="IC3" gate="A" pin="A3"/>
<wire x1="-144.78" y1="20.32" x2="-152.4" y2="20.32" width="0.1524" layer="91"/>
<wire x1="-152.4" y1="20.32" x2="-152.4" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="IC4" gate="A" pin="A3"/>
<wire x1="-152.4" y1="-17.78" x2="-144.78" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="-152.4" y1="20.32" x2="-205.74" y2="20.32" width="0.1524" layer="91"/>
<junction x="-152.4" y="20.32"/>
<pinref part="JP1" gate="A" pin="3"/>
</segment>
</net>
<net name="IO4" class="0">
<segment>
<pinref part="IC4" gate="A" pin="A4"/>
<wire x1="-144.78" y1="-20.32" x2="-154.94" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="-154.94" y1="-20.32" x2="-154.94" y2="17.78" width="0.1524" layer="91"/>
<pinref part="IC3" gate="A" pin="A4"/>
<wire x1="-154.94" y1="17.78" x2="-144.78" y2="17.78" width="0.1524" layer="91"/>
<wire x1="-154.94" y1="17.78" x2="-205.74" y2="17.78" width="0.1524" layer="91"/>
<junction x="-154.94" y="17.78"/>
<pinref part="JP1" gate="A" pin="4"/>
</segment>
</net>
<net name="IO5" class="0">
<segment>
<pinref part="IC3" gate="A" pin="A5"/>
<wire x1="-144.78" y1="15.24" x2="-157.48" y2="15.24" width="0.1524" layer="91"/>
<wire x1="-157.48" y1="15.24" x2="-157.48" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="IC4" gate="A" pin="A5"/>
<wire x1="-157.48" y1="-22.86" x2="-144.78" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="-157.48" y1="15.24" x2="-205.74" y2="15.24" width="0.1524" layer="91"/>
<junction x="-157.48" y="15.24"/>
<pinref part="JP1" gate="A" pin="5"/>
</segment>
</net>
<net name="IO6" class="0">
<segment>
<pinref part="IC3" gate="A" pin="A6"/>
<wire x1="-144.78" y1="12.7" x2="-160.02" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-160.02" y1="12.7" x2="-160.02" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="IC4" gate="A" pin="A6"/>
<wire x1="-160.02" y1="-25.4" x2="-144.78" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="-160.02" y1="12.7" x2="-205.74" y2="12.7" width="0.1524" layer="91"/>
<junction x="-160.02" y="12.7"/>
<pinref part="JP1" gate="A" pin="6"/>
</segment>
</net>
<net name="IO7" class="0">
<segment>
<pinref part="IC4" gate="A" pin="A7"/>
<wire x1="-144.78" y1="-27.94" x2="-162.56" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="-162.56" y1="-27.94" x2="-162.56" y2="10.16" width="0.1524" layer="91"/>
<pinref part="IC3" gate="A" pin="A7"/>
<wire x1="-162.56" y1="10.16" x2="-144.78" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-162.56" y1="10.16" x2="-205.74" y2="10.16" width="0.1524" layer="91"/>
<junction x="-162.56" y="10.16"/>
<pinref part="JP1" gate="A" pin="7"/>
</segment>
</net>
<net name="IO8" class="0">
<segment>
<pinref part="IC3" gate="A" pin="A8"/>
<wire x1="-144.78" y1="7.62" x2="-165.1" y2="7.62" width="0.1524" layer="91"/>
<wire x1="-165.1" y1="7.62" x2="-165.1" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="IC4" gate="A" pin="A8"/>
<wire x1="-165.1" y1="-30.48" x2="-144.78" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-165.1" y1="7.62" x2="-205.74" y2="7.62" width="0.1524" layer="91"/>
<junction x="-165.1" y="7.62"/>
<pinref part="JP1" gate="A" pin="8"/>
</segment>
</net>
<net name="O1" class="0">
<segment>
<pinref part="IC6" gate="A" pin="1Y"/>
<wire x1="284.48" y1="25.4" x2="309.88" y2="25.4" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="1"/>
</segment>
</net>
<net name="O2" class="0">
<segment>
<pinref part="IC6" gate="A" pin="2Y"/>
<wire x1="284.48" y1="20.32" x2="287.02" y2="20.32" width="0.1524" layer="91"/>
<wire x1="287.02" y1="20.32" x2="287.02" y2="22.86" width="0.1524" layer="91"/>
<wire x1="287.02" y1="22.86" x2="309.88" y2="22.86" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="2"/>
</segment>
</net>
<net name="O3" class="0">
<segment>
<wire x1="309.88" y1="20.32" x2="289.56" y2="20.32" width="0.1524" layer="91"/>
<wire x1="289.56" y1="20.32" x2="289.56" y2="15.24" width="0.1524" layer="91"/>
<pinref part="IC6" gate="A" pin="3Y"/>
<wire x1="289.56" y1="15.24" x2="284.48" y2="15.24" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="3"/>
</segment>
</net>
<net name="O4" class="0">
<segment>
<wire x1="309.88" y1="17.78" x2="292.1" y2="17.78" width="0.1524" layer="91"/>
<wire x1="292.1" y1="17.78" x2="292.1" y2="10.16" width="0.1524" layer="91"/>
<pinref part="IC6" gate="A" pin="4Y"/>
<wire x1="292.1" y1="10.16" x2="284.48" y2="10.16" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="4"/>
</segment>
</net>
<net name="O5" class="0">
<segment>
<wire x1="309.88" y1="15.24" x2="294.64" y2="15.24" width="0.1524" layer="91"/>
<wire x1="294.64" y1="15.24" x2="294.64" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="IC5" gate="A" pin="1Y"/>
<wire x1="294.64" y1="-12.7" x2="284.48" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="5"/>
</segment>
</net>
<net name="O6" class="0">
<segment>
<wire x1="309.88" y1="12.7" x2="297.18" y2="12.7" width="0.1524" layer="91"/>
<wire x1="297.18" y1="12.7" x2="297.18" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="IC5" gate="A" pin="2Y"/>
<wire x1="297.18" y1="-17.78" x2="284.48" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="6"/>
</segment>
</net>
<net name="O7" class="0">
<segment>
<pinref part="IC5" gate="A" pin="3Y"/>
<wire x1="284.48" y1="-22.86" x2="299.72" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="299.72" y1="-22.86" x2="299.72" y2="10.16" width="0.1524" layer="91"/>
<wire x1="299.72" y1="10.16" x2="309.88" y2="10.16" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="7"/>
</segment>
</net>
<net name="O8" class="0">
<segment>
<pinref part="IC5" gate="A" pin="4Y"/>
<wire x1="284.48" y1="-27.94" x2="302.26" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="302.26" y1="-27.94" x2="302.26" y2="7.62" width="0.1524" layer="91"/>
<wire x1="302.26" y1="7.62" x2="309.88" y2="7.62" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="8"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="A11"/>
<wire x1="167.64" y1="-12.7" x2="144.78" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="IC8" gate="A" pin="Q3"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="A10"/>
<wire x1="167.64" y1="-10.16" x2="144.78" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="IC8" gate="A" pin="Q2"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="A12"/>
<wire x1="167.64" y1="-15.24" x2="144.78" y2="-15.24" width="0.1524" layer="91"/>
<pinref part="IC8" gate="A" pin="Q4"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="A9"/>
<wire x1="167.64" y1="-7.62" x2="144.78" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="IC8" gate="A" pin="Q1"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="A14"/>
<wire x1="167.64" y1="-20.32" x2="144.78" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="IC8" gate="A" pin="Q6"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="A13"/>
<wire x1="167.64" y1="-17.78" x2="144.78" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="IC8" gate="A" pin="Q5"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="A15"/>
<wire x1="167.64" y1="-22.86" x2="144.78" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="IC8" gate="A" pin="Q7"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="A16"/>
<wire x1="167.64" y1="-25.4" x2="144.78" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="IC8" gate="A" pin="Q8"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A11"/>
<wire x1="-12.7" y1="-12.7" x2="-35.56" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="IC7" gate="A" pin="Q3"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A8"/>
<wire x1="-12.7" y1="-5.08" x2="-35.56" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="-35.56" y1="-5.08" x2="-35.56" y2="0" width="0.1524" layer="91"/>
<pinref part="IC9" gate="A" pin="2Y"/>
<wire x1="-15.24" y1="-121.92" x2="-10.16" y2="-121.92" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="-121.92" x2="-10.16" y2="-154.94" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="-154.94" x2="-66.04" y2="-154.94" width="0.1524" layer="91"/>
<wire x1="-66.04" y1="-154.94" x2="-66.04" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="-66.04" y1="-7.62" x2="-60.96" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="-35.56" y1="0" x2="-66.04" y2="0" width="0.1524" layer="91"/>
<wire x1="-66.04" y1="0" x2="-66.04" y2="-7.62" width="0.1524" layer="91"/>
<junction x="-66.04" y="-7.62"/>
<pinref part="IC7" gate="A" pin="P1"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A12"/>
<wire x1="-12.7" y1="-15.24" x2="-35.56" y2="-15.24" width="0.1524" layer="91"/>
<pinref part="IC7" gate="A" pin="Q4"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A14"/>
<wire x1="-12.7" y1="-20.32" x2="-35.56" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="IC7" gate="A" pin="Q6"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A13"/>
<wire x1="-12.7" y1="-17.78" x2="-35.56" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="IC7" gate="A" pin="Q5"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A15"/>
<wire x1="-12.7" y1="-22.86" x2="-35.56" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="IC7" gate="A" pin="Q7"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A16"/>
<wire x1="-12.7" y1="-25.4" x2="-35.56" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="IC7" gate="A" pin="Q8"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<wire x1="-60.96" y1="-35.56" x2="-63.5" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="-63.5" y1="-35.56" x2="-63.5" y2="-152.4" width="0.1524" layer="91"/>
<wire x1="-63.5" y1="-152.4" x2="-12.7" y2="-152.4" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="-152.4" x2="-12.7" y2="-132.08" width="0.1524" layer="91"/>
<pinref part="IC9" gate="A" pin="4Y"/>
<wire x1="-12.7" y1="-132.08" x2="-15.24" y2="-132.08" width="0.1524" layer="91"/>
<pinref part="IC7" gate="A" pin="RES"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="IC9" gate="A" pin="3Y"/>
<wire x1="-15.24" y1="-127" x2="116.84" y2="-127" width="0.1524" layer="91"/>
<wire x1="116.84" y1="-127" x2="116.84" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="116.84" y1="-35.56" x2="119.38" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="IC8" gate="A" pin="RES"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="IC9" gate="A" pin="1Y"/>
<wire x1="-15.24" y1="-116.84" x2="114.3" y2="-116.84" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-116.84" x2="114.3" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-7.62" x2="119.38" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-7.62" x2="114.3" y2="0" width="0.1524" layer="91"/>
<junction x="114.3" y="-7.62"/>
<wire x1="114.3" y1="0" x2="144.78" y2="0" width="0.1524" layer="91"/>
<wire x1="144.78" y1="0" x2="144.78" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="A8"/>
<wire x1="167.64" y1="-5.08" x2="144.78" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="IC8" gate="A" pin="P1"/>
</segment>
</net>
<net name="VIDEO_CLKY" class="0">
<segment>
<pinref part="IC9" gate="A" pin="1B"/>
<wire x1="-40.64" y1="-119.38" x2="-43.18" y2="-119.38" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-119.38" x2="-43.18" y2="-121.92" width="0.1524" layer="91"/>
<pinref part="IC9" gate="A" pin="2A"/>
<wire x1="-43.18" y1="-121.92" x2="-40.64" y2="-121.92" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-119.38" x2="-76.2" y2="-119.38" width="0.1524" layer="91"/>
<junction x="-43.18" y="-119.38"/>
<wire x1="-76.2" y1="-119.38" x2="-76.2" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="-76.2" y1="-106.68" x2="-205.74" y2="-106.68" width="0.1524" layer="91"/>
<label x="-200.914" y="-105.918" size="1.27" layer="95"/>
<pinref part="JP5" gate="A" pin="4"/>
</segment>
</net>
<net name="DATA_CLKY" class="0">
<segment>
<pinref part="IC9" gate="A" pin="1A"/>
<wire x1="-40.64" y1="-116.84" x2="-45.72" y2="-116.84" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="-116.84" x2="-45.72" y2="-124.46" width="0.1524" layer="91"/>
<pinref part="IC9" gate="A" pin="2B"/>
<wire x1="-45.72" y1="-124.46" x2="-40.64" y2="-124.46" width="0.1524" layer="91"/>
<junction x="-45.72" y="-116.84"/>
<wire x1="-45.72" y1="-116.84" x2="-93.98" y2="-116.84" width="0.1524" layer="91"/>
<wire x1="-93.98" y1="-116.84" x2="-93.98" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="-93.98" y1="-76.2" x2="-205.74" y2="-76.2" width="0.1524" layer="91"/>
<label x="-200.914" y="-75.438" size="1.27" layer="95"/>
<pinref part="JP4" gate="A" pin="5"/>
</segment>
</net>
<net name="VIDEO_RESY" class="0">
<segment>
<pinref part="IC9" gate="A" pin="3B"/>
<wire x1="-40.64" y1="-129.54" x2="-43.18" y2="-129.54" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-129.54" x2="-43.18" y2="-132.08" width="0.1524" layer="91"/>
<pinref part="IC9" gate="A" pin="4A"/>
<wire x1="-43.18" y1="-132.08" x2="-40.64" y2="-132.08" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-129.54" x2="-78.74" y2="-129.54" width="0.1524" layer="91"/>
<junction x="-43.18" y="-129.54"/>
<wire x1="-78.74" y1="-129.54" x2="-78.74" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="-78.74" y1="-109.22" x2="-205.74" y2="-109.22" width="0.1524" layer="91"/>
<label x="-200.914" y="-108.458" size="1.27" layer="95"/>
<pinref part="JP5" gate="A" pin="5"/>
</segment>
</net>
<net name="DATA_RESY" class="0">
<segment>
<pinref part="IC9" gate="A" pin="3A"/>
<wire x1="-40.64" y1="-127" x2="-45.72" y2="-127" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="-127" x2="-45.72" y2="-134.62" width="0.1524" layer="91"/>
<pinref part="IC9" gate="A" pin="4B"/>
<wire x1="-45.72" y1="-134.62" x2="-40.64" y2="-134.62" width="0.1524" layer="91"/>
<junction x="-45.72" y="-127"/>
<wire x1="-45.72" y1="-127" x2="-96.52" y2="-127" width="0.1524" layer="91"/>
<wire x1="-96.52" y1="-127" x2="-96.52" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="-96.52" y1="-78.74" x2="-205.74" y2="-78.74" width="0.1524" layer="91"/>
<label x="-200.914" y="-77.978" size="1.27" layer="95"/>
<pinref part="JP4" gate="A" pin="6"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="IC3" gate="A" pin="DIR"/>
<wire x1="-144.78" y1="2.54" x2="-170.18" y2="2.54" width="0.1524" layer="91"/>
<wire x1="-170.18" y1="2.54" x2="-170.18" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="IC4" gate="A" pin="DIR"/>
<wire x1="-170.18" y1="-35.56" x2="-144.78" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="IC11" gate="C" pin="O"/>
<wire x1="-180.34" y1="-38.1" x2="-180.34" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="-180.34" y1="-35.56" x2="-170.18" y2="-35.56" width="0.1524" layer="91"/>
<junction x="-170.18" y="-35.56"/>
</segment>
</net>
<net name="SWAP" class="0">
<segment>
<pinref part="IC5" gate="A" pin="!A!/B"/>
<wire x1="259.08" y1="-35.56" x2="254" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="IC6" gate="A" pin="!A!/B"/>
<wire x1="254" y1="-35.56" x2="254" y2="2.54" width="0.1524" layer="91"/>
<wire x1="254" y1="2.54" x2="259.08" y2="2.54" width="0.1524" layer="91"/>
<wire x1="254" y1="-35.56" x2="246.38" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="246.38" y1="-35.56" x2="246.38" y2="-66.04" width="0.1524" layer="91"/>
<junction x="254" y="-35.56"/>
<wire x1="246.38" y1="-66.04" x2="-50.8" y2="-66.04" width="0.1524" layer="91"/>
<pinref part="IC3" gate="A" pin="G"/>
<wire x1="-144.78" y1="0" x2="-172.72" y2="0" width="0.1524" layer="91"/>
<wire x1="-172.72" y1="0" x2="-172.72" y2="-45.72" width="0.1524" layer="91"/>
<wire x1="-172.72" y1="-45.72" x2="-170.18" y2="-45.72" width="0.1524" layer="91"/>
<pinref part="IC11" gate="A" pin="I"/>
<wire x1="-172.72" y1="-45.72" x2="-172.72" y2="-66.04" width="0.1524" layer="91"/>
<junction x="-172.72" y="-45.72"/>
<wire x1="-172.72" y1="-66.04" x2="-205.74" y2="-66.04" width="0.1524" layer="91"/>
<label x="-200.914" y="-65.278" size="1.27" layer="95"/>
<pinref part="IC15" gate="A" pin="!A!/B"/>
<wire x1="-40.64" y1="-93.98" x2="-50.8" y2="-93.98" width="0.1524" layer="91"/>
<wire x1="-50.8" y1="-93.98" x2="-50.8" y2="-139.7" width="0.1524" layer="91"/>
<pinref part="IC9" gate="A" pin="!A!/B"/>
<wire x1="-50.8" y1="-139.7" x2="-40.64" y2="-139.7" width="0.1524" layer="91"/>
<junction x="-50.8" y="-139.7"/>
<pinref part="IC16" gate="A" pin="!A!/B"/>
<wire x1="-50.8" y1="-139.7" x2="-50.8" y2="-185.42" width="0.1524" layer="91"/>
<wire x1="-50.8" y1="-185.42" x2="-40.64" y2="-185.42" width="0.1524" layer="91"/>
<wire x1="-172.72" y1="-66.04" x2="-50.8" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="-50.8" y1="-66.04" x2="-50.8" y2="-93.98" width="0.1524" layer="91"/>
<junction x="-172.72" y="-66.04"/>
<junction x="-50.8" y="-93.98"/>
<junction x="-50.8" y="-66.04"/>
<pinref part="JP4" gate="A" pin="1"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<pinref part="IC4" gate="A" pin="G"/>
<wire x1="-144.78" y1="-38.1" x2="-147.32" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="-147.32" y1="-38.1" x2="-147.32" y2="-45.72" width="0.1524" layer="91"/>
<wire x1="-147.32" y1="-45.72" x2="-149.86" y2="-45.72" width="0.1524" layer="91"/>
<pinref part="IC11" gate="A" pin="O"/>
</segment>
</net>
<net name="A_I/O8" class="0">
<segment>
<pinref part="IC12" gate="A" pin="A1"/>
<pinref part="IC1" gate="IC$1" pin="I/O8"/>
<wire x1="101.6" y1="27.94" x2="101.6" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="101.6" y1="-2.54" x2="25.4" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-2.54" x2="22.86" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="101.6" y1="-2.54" x2="101.6" y2="-43.18" width="0.1524" layer="91"/>
<junction x="101.6" y="-2.54"/>
<pinref part="IC4" gate="A" pin="B8"/>
<wire x1="-119.38" y1="-30.48" x2="-76.2" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-76.2" y1="-30.48" x2="-76.2" y2="48.26" width="0.1524" layer="91"/>
<wire x1="-76.2" y1="48.26" x2="25.4" y2="48.26" width="0.1524" layer="91"/>
<wire x1="25.4" y1="48.26" x2="25.4" y2="-2.54" width="0.1524" layer="91"/>
<junction x="25.4" y="-2.54"/>
<pinref part="IC5" gate="A" pin="4A"/>
<wire x1="243.84" y1="-43.18" x2="243.84" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="243.84" y1="-27.94" x2="259.08" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="101.6" y1="-43.18" x2="243.84" y2="-43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="A_I/O7" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="I/O7"/>
<pinref part="IC12" gate="A" pin="A2"/>
<wire x1="22.86" y1="0" x2="27.94" y2="0" width="0.1524" layer="91"/>
<wire x1="27.94" y1="0" x2="99.06" y2="0" width="0.1524" layer="91"/>
<wire x1="99.06" y1="0" x2="99.06" y2="27.94" width="0.1524" layer="91"/>
<wire x1="99.06" y1="0" x2="99.06" y2="-45.72" width="0.1524" layer="91"/>
<junction x="99.06" y="0"/>
<wire x1="27.94" y1="0" x2="27.94" y2="50.8" width="0.1524" layer="91"/>
<junction x="27.94" y="0"/>
<wire x1="27.94" y1="50.8" x2="-78.74" y2="50.8" width="0.1524" layer="91"/>
<wire x1="-78.74" y1="50.8" x2="-78.74" y2="-27.94" width="0.1524" layer="91"/>
<pinref part="IC4" gate="A" pin="B7"/>
<wire x1="-78.74" y1="-27.94" x2="-119.38" y2="-27.94" width="0.1524" layer="91"/>
<pinref part="IC5" gate="A" pin="3A"/>
<wire x1="241.3" y1="-45.72" x2="241.3" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="241.3" y1="-22.86" x2="259.08" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="99.06" y1="-45.72" x2="241.3" y2="-45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="A_I/O6" class="0">
<segment>
<pinref part="IC12" gate="A" pin="A3"/>
<pinref part="IC1" gate="IC$1" pin="I/O6"/>
<wire x1="96.52" y1="27.94" x2="96.52" y2="2.54" width="0.1524" layer="91"/>
<wire x1="96.52" y1="2.54" x2="30.48" y2="2.54" width="0.1524" layer="91"/>
<wire x1="30.48" y1="2.54" x2="22.86" y2="2.54" width="0.1524" layer="91"/>
<wire x1="96.52" y1="2.54" x2="96.52" y2="-48.26" width="0.1524" layer="91"/>
<junction x="96.52" y="2.54"/>
<pinref part="IC4" gate="A" pin="B6"/>
<wire x1="-119.38" y1="-25.4" x2="-81.28" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="-25.4" x2="-81.28" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="53.34" x2="30.48" y2="53.34" width="0.1524" layer="91"/>
<wire x1="30.48" y1="53.34" x2="30.48" y2="2.54" width="0.1524" layer="91"/>
<junction x="30.48" y="2.54"/>
<wire x1="238.76" y1="-17.78" x2="238.76" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="IC5" gate="A" pin="2A"/>
<wire x1="259.08" y1="-17.78" x2="238.76" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="96.52" y1="-48.26" x2="238.76" y2="-48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="A_I/O5" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="I/O5"/>
<pinref part="IC12" gate="A" pin="A4"/>
<wire x1="22.86" y1="5.08" x2="33.02" y2="5.08" width="0.1524" layer="91"/>
<wire x1="33.02" y1="5.08" x2="93.98" y2="5.08" width="0.1524" layer="91"/>
<wire x1="93.98" y1="5.08" x2="93.98" y2="27.94" width="0.1524" layer="91"/>
<wire x1="93.98" y1="5.08" x2="93.98" y2="-50.8" width="0.1524" layer="91"/>
<junction x="93.98" y="5.08"/>
<wire x1="33.02" y1="5.08" x2="33.02" y2="55.88" width="0.1524" layer="91"/>
<junction x="33.02" y="5.08"/>
<wire x1="33.02" y1="55.88" x2="-83.82" y2="55.88" width="0.1524" layer="91"/>
<wire x1="-83.82" y1="55.88" x2="-83.82" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="IC4" gate="A" pin="B5"/>
<wire x1="-83.82" y1="-22.86" x2="-119.38" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-50.8" x2="236.22" y2="-50.8" width="0.1524" layer="91"/>
<pinref part="IC5" gate="A" pin="1A"/>
<wire x1="259.08" y1="-12.7" x2="236.22" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="236.22" y1="-12.7" x2="236.22" y2="-50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="A_I/O4" class="0">
<segment>
<pinref part="IC12" gate="A" pin="A5"/>
<pinref part="IC1" gate="IC$1" pin="I/O4"/>
<wire x1="91.44" y1="27.94" x2="91.44" y2="7.62" width="0.1524" layer="91"/>
<wire x1="91.44" y1="7.62" x2="35.56" y2="7.62" width="0.1524" layer="91"/>
<wire x1="35.56" y1="7.62" x2="22.86" y2="7.62" width="0.1524" layer="91"/>
<wire x1="91.44" y1="7.62" x2="91.44" y2="-53.34" width="0.1524" layer="91"/>
<junction x="91.44" y="7.62"/>
<pinref part="IC4" gate="A" pin="B4"/>
<wire x1="-119.38" y1="-20.32" x2="-86.36" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="-86.36" y1="-20.32" x2="-86.36" y2="58.42" width="0.1524" layer="91"/>
<wire x1="-86.36" y1="58.42" x2="35.56" y2="58.42" width="0.1524" layer="91"/>
<wire x1="35.56" y1="58.42" x2="35.56" y2="7.62" width="0.1524" layer="91"/>
<junction x="35.56" y="7.62"/>
<pinref part="IC6" gate="A" pin="4A"/>
<wire x1="259.08" y1="10.16" x2="233.68" y2="10.16" width="0.1524" layer="91"/>
<wire x1="233.68" y1="10.16" x2="233.68" y2="-53.34" width="0.1524" layer="91"/>
<wire x1="233.68" y1="-53.34" x2="91.44" y2="-53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="A_I/O3" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="I/O3"/>
<pinref part="IC12" gate="A" pin="A6"/>
<wire x1="22.86" y1="10.16" x2="38.1" y2="10.16" width="0.1524" layer="91"/>
<wire x1="38.1" y1="10.16" x2="88.9" y2="10.16" width="0.1524" layer="91"/>
<wire x1="88.9" y1="10.16" x2="88.9" y2="27.94" width="0.1524" layer="91"/>
<wire x1="88.9" y1="10.16" x2="88.9" y2="-55.88" width="0.1524" layer="91"/>
<junction x="88.9" y="10.16"/>
<wire x1="38.1" y1="10.16" x2="38.1" y2="60.96" width="0.1524" layer="91"/>
<junction x="38.1" y="10.16"/>
<wire x1="38.1" y1="60.96" x2="-88.9" y2="60.96" width="0.1524" layer="91"/>
<wire x1="-88.9" y1="60.96" x2="-88.9" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="IC4" gate="A" pin="B3"/>
<wire x1="-88.9" y1="-17.78" x2="-119.38" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="IC6" gate="A" pin="3A"/>
<wire x1="259.08" y1="15.24" x2="231.14" y2="15.24" width="0.1524" layer="91"/>
<wire x1="88.9" y1="-55.88" x2="231.14" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="231.14" y1="-55.88" x2="231.14" y2="15.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="A_I/O2" class="0">
<segment>
<pinref part="IC12" gate="A" pin="A7"/>
<pinref part="IC1" gate="IC$1" pin="I/O2"/>
<wire x1="86.36" y1="27.94" x2="86.36" y2="12.7" width="0.1524" layer="91"/>
<wire x1="86.36" y1="12.7" x2="40.64" y2="12.7" width="0.1524" layer="91"/>
<wire x1="40.64" y1="12.7" x2="22.86" y2="12.7" width="0.1524" layer="91"/>
<wire x1="86.36" y1="12.7" x2="86.36" y2="-58.42" width="0.1524" layer="91"/>
<junction x="86.36" y="12.7"/>
<pinref part="IC4" gate="A" pin="B2"/>
<wire x1="-119.38" y1="-15.24" x2="-91.44" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="-15.24" x2="-91.44" y2="63.5" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="63.5" x2="40.64" y2="63.5" width="0.1524" layer="91"/>
<wire x1="40.64" y1="63.5" x2="40.64" y2="12.7" width="0.1524" layer="91"/>
<junction x="40.64" y="12.7"/>
<pinref part="IC6" gate="A" pin="2A"/>
<wire x1="259.08" y1="20.32" x2="228.6" y2="20.32" width="0.1524" layer="91"/>
<wire x1="86.36" y1="-58.42" x2="228.6" y2="-58.42" width="0.1524" layer="91"/>
<wire x1="228.6" y1="-58.42" x2="228.6" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="A_I/O1" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="I/O1"/>
<pinref part="IC12" gate="A" pin="A8"/>
<wire x1="22.86" y1="15.24" x2="43.18" y2="15.24" width="0.1524" layer="91"/>
<wire x1="43.18" y1="15.24" x2="83.82" y2="15.24" width="0.1524" layer="91"/>
<wire x1="83.82" y1="15.24" x2="83.82" y2="27.94" width="0.1524" layer="91"/>
<wire x1="83.82" y1="15.24" x2="83.82" y2="-60.96" width="0.1524" layer="91"/>
<junction x="83.82" y="15.24"/>
<wire x1="43.18" y1="15.24" x2="43.18" y2="66.04" width="0.1524" layer="91"/>
<junction x="43.18" y="15.24"/>
<wire x1="43.18" y1="66.04" x2="-93.98" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-93.98" y1="66.04" x2="-93.98" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="IC4" gate="A" pin="B1"/>
<wire x1="-93.98" y1="-12.7" x2="-119.38" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="IC6" gate="A" pin="1A"/>
<wire x1="259.08" y1="25.4" x2="226.06" y2="25.4" width="0.1524" layer="91"/>
<wire x1="226.06" y1="25.4" x2="226.06" y2="-60.96" width="0.1524" layer="91"/>
<wire x1="226.06" y1="-60.96" x2="83.82" y2="-60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="B_I/O8" class="0">
<segment>
<pinref part="IC12" gate="A" pin="B1"/>
<wire x1="101.6" y1="53.34" x2="101.6" y2="71.12" width="0.1524" layer="91"/>
<wire x1="101.6" y1="71.12" x2="223.52" y2="71.12" width="0.1524" layer="91"/>
<wire x1="223.52" y1="71.12" x2="223.52" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="I/O8"/>
<wire x1="223.52" y1="-2.54" x2="203.2" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="101.6" y1="71.12" x2="-99.06" y2="71.12" width="0.1524" layer="91"/>
<junction x="101.6" y="71.12"/>
<pinref part="IC3" gate="A" pin="B8"/>
<wire x1="-119.38" y1="7.62" x2="-99.06" y2="7.62" width="0.1524" layer="91"/>
<wire x1="-99.06" y1="7.62" x2="-99.06" y2="71.12" width="0.1524" layer="91"/>
<pinref part="IC5" gate="A" pin="4B"/>
<wire x1="259.08" y1="-30.48" x2="223.52" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="223.52" y1="-30.48" x2="223.52" y2="-2.54" width="0.1524" layer="91"/>
<junction x="223.52" y="-2.54"/>
</segment>
</net>
<net name="B_I/O1" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="I/O1"/>
<wire x1="203.2" y1="15.24" x2="205.74" y2="15.24" width="0.1524" layer="91"/>
<wire x1="205.74" y1="15.24" x2="205.74" y2="22.86" width="0.1524" layer="91"/>
<pinref part="IC12" gate="A" pin="B8"/>
<wire x1="205.74" y1="22.86" x2="205.74" y2="88.9" width="0.1524" layer="91"/>
<wire x1="205.74" y1="88.9" x2="83.82" y2="88.9" width="0.1524" layer="91"/>
<wire x1="83.82" y1="88.9" x2="83.82" y2="53.34" width="0.1524" layer="91"/>
<wire x1="83.82" y1="88.9" x2="-116.84" y2="88.9" width="0.1524" layer="91"/>
<junction x="83.82" y="88.9"/>
<pinref part="IC3" gate="A" pin="B1"/>
<wire x1="-119.38" y1="25.4" x2="-116.84" y2="25.4" width="0.1524" layer="91"/>
<wire x1="-116.84" y1="25.4" x2="-116.84" y2="88.9" width="0.1524" layer="91"/>
<pinref part="IC6" gate="A" pin="1B"/>
<wire x1="259.08" y1="22.86" x2="205.74" y2="22.86" width="0.1524" layer="91"/>
<junction x="205.74" y="22.86"/>
</segment>
</net>
<net name="B_I/O2" class="0">
<segment>
<pinref part="IC12" gate="A" pin="B7"/>
<wire x1="86.36" y1="53.34" x2="86.36" y2="86.36" width="0.1524" layer="91"/>
<wire x1="86.36" y1="86.36" x2="208.28" y2="86.36" width="0.1524" layer="91"/>
<wire x1="208.28" y1="86.36" x2="208.28" y2="17.78" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="I/O2"/>
<wire x1="208.28" y1="17.78" x2="208.28" y2="12.7" width="0.1524" layer="91"/>
<wire x1="208.28" y1="12.7" x2="203.2" y2="12.7" width="0.1524" layer="91"/>
<wire x1="86.36" y1="86.36" x2="-114.3" y2="86.36" width="0.1524" layer="91"/>
<junction x="86.36" y="86.36"/>
<wire x1="-114.3" y1="86.36" x2="-114.3" y2="22.86" width="0.1524" layer="91"/>
<pinref part="IC3" gate="A" pin="B2"/>
<wire x1="-114.3" y1="22.86" x2="-119.38" y2="22.86" width="0.1524" layer="91"/>
<pinref part="IC6" gate="A" pin="2B"/>
<wire x1="259.08" y1="17.78" x2="208.28" y2="17.78" width="0.1524" layer="91"/>
<junction x="208.28" y="17.78"/>
</segment>
</net>
<net name="B_I/O3" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="I/O3"/>
<wire x1="203.2" y1="10.16" x2="210.82" y2="10.16" width="0.1524" layer="91"/>
<wire x1="210.82" y1="10.16" x2="210.82" y2="12.7" width="0.1524" layer="91"/>
<pinref part="IC12" gate="A" pin="B6"/>
<wire x1="210.82" y1="12.7" x2="210.82" y2="83.82" width="0.1524" layer="91"/>
<wire x1="210.82" y1="83.82" x2="88.9" y2="83.82" width="0.1524" layer="91"/>
<wire x1="88.9" y1="83.82" x2="88.9" y2="53.34" width="0.1524" layer="91"/>
<wire x1="88.9" y1="83.82" x2="-111.76" y2="83.82" width="0.1524" layer="91"/>
<junction x="88.9" y="83.82"/>
<pinref part="IC3" gate="A" pin="B3"/>
<wire x1="-119.38" y1="20.32" x2="-111.76" y2="20.32" width="0.1524" layer="91"/>
<wire x1="-111.76" y1="20.32" x2="-111.76" y2="83.82" width="0.1524" layer="91"/>
<pinref part="IC6" gate="A" pin="3B"/>
<wire x1="259.08" y1="12.7" x2="210.82" y2="12.7" width="0.1524" layer="91"/>
<junction x="210.82" y="12.7"/>
</segment>
</net>
<net name="B_I/O4" class="0">
<segment>
<pinref part="IC12" gate="A" pin="B5"/>
<wire x1="91.44" y1="53.34" x2="91.44" y2="81.28" width="0.1524" layer="91"/>
<wire x1="91.44" y1="81.28" x2="213.36" y2="81.28" width="0.1524" layer="91"/>
<wire x1="213.36" y1="81.28" x2="213.36" y2="7.62" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="I/O4"/>
<wire x1="213.36" y1="7.62" x2="203.2" y2="7.62" width="0.1524" layer="91"/>
<wire x1="91.44" y1="81.28" x2="-109.22" y2="81.28" width="0.1524" layer="91"/>
<junction x="91.44" y="81.28"/>
<pinref part="IC3" gate="A" pin="B4"/>
<wire x1="-119.38" y1="17.78" x2="-109.22" y2="17.78" width="0.1524" layer="91"/>
<wire x1="-109.22" y1="17.78" x2="-109.22" y2="81.28" width="0.1524" layer="91"/>
<pinref part="IC6" gate="A" pin="4B"/>
<wire x1="213.36" y1="7.62" x2="259.08" y2="7.62" width="0.1524" layer="91"/>
<junction x="213.36" y="7.62"/>
</segment>
</net>
<net name="B_I/O5" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="I/O5"/>
<wire x1="203.2" y1="5.08" x2="215.9" y2="5.08" width="0.1524" layer="91"/>
<wire x1="215.9" y1="5.08" x2="215.9" y2="78.74" width="0.1524" layer="91"/>
<pinref part="IC12" gate="A" pin="B4"/>
<wire x1="215.9" y1="78.74" x2="93.98" y2="78.74" width="0.1524" layer="91"/>
<wire x1="93.98" y1="78.74" x2="93.98" y2="53.34" width="0.1524" layer="91"/>
<wire x1="93.98" y1="78.74" x2="-106.68" y2="78.74" width="0.1524" layer="91"/>
<junction x="93.98" y="78.74"/>
<pinref part="IC3" gate="A" pin="B5"/>
<wire x1="-119.38" y1="15.24" x2="-106.68" y2="15.24" width="0.1524" layer="91"/>
<wire x1="-106.68" y1="15.24" x2="-106.68" y2="78.74" width="0.1524" layer="91"/>
<pinref part="IC5" gate="A" pin="1B"/>
<wire x1="259.08" y1="-15.24" x2="215.9" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="215.9" y1="-15.24" x2="215.9" y2="5.08" width="0.1524" layer="91"/>
<junction x="215.9" y="5.08"/>
</segment>
</net>
<net name="B_I/O6" class="0">
<segment>
<pinref part="IC12" gate="A" pin="B3"/>
<wire x1="96.52" y1="53.34" x2="96.52" y2="76.2" width="0.1524" layer="91"/>
<wire x1="96.52" y1="76.2" x2="218.44" y2="76.2" width="0.1524" layer="91"/>
<wire x1="218.44" y1="76.2" x2="218.44" y2="2.54" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="I/O6"/>
<wire x1="218.44" y1="2.54" x2="203.2" y2="2.54" width="0.1524" layer="91"/>
<wire x1="96.52" y1="76.2" x2="-104.14" y2="76.2" width="0.1524" layer="91"/>
<junction x="96.52" y="76.2"/>
<pinref part="IC3" gate="A" pin="B6"/>
<wire x1="-119.38" y1="12.7" x2="-104.14" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="12.7" x2="-104.14" y2="76.2" width="0.1524" layer="91"/>
<pinref part="IC5" gate="A" pin="2B"/>
<wire x1="259.08" y1="-20.32" x2="218.44" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="218.44" y1="-20.32" x2="218.44" y2="2.54" width="0.1524" layer="91"/>
<junction x="218.44" y="2.54"/>
</segment>
</net>
<net name="B_I/O7" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="I/O7"/>
<wire x1="203.2" y1="0" x2="220.98" y2="0" width="0.1524" layer="91"/>
<wire x1="220.98" y1="0" x2="220.98" y2="73.66" width="0.1524" layer="91"/>
<pinref part="IC12" gate="A" pin="B2"/>
<wire x1="220.98" y1="73.66" x2="99.06" y2="73.66" width="0.1524" layer="91"/>
<wire x1="99.06" y1="73.66" x2="99.06" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-101.6" y1="73.66" x2="99.06" y2="73.66" width="0.1524" layer="91"/>
<junction x="99.06" y="73.66"/>
<pinref part="IC3" gate="A" pin="B7"/>
<wire x1="-119.38" y1="10.16" x2="-101.6" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-101.6" y1="10.16" x2="-101.6" y2="73.66" width="0.1524" layer="91"/>
<pinref part="IC5" gate="A" pin="3B"/>
<wire x1="259.08" y1="-25.4" x2="220.98" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="220.98" y1="-25.4" x2="220.98" y2="0" width="0.1524" layer="91"/>
<junction x="220.98" y="0"/>
</segment>
</net>
<net name="VIDEO_ENABLE_LOW" class="0">
<segment>
<pinref part="IC5" gate="A" pin="G"/>
<wire x1="259.08" y1="-38.1" x2="256.54" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="256.54" y1="-38.1" x2="256.54" y2="0" width="0.1524" layer="91"/>
<pinref part="IC6" gate="A" pin="G"/>
<wire x1="256.54" y1="0" x2="259.08" y2="0" width="0.1524" layer="91"/>
<wire x1="256.54" y1="-38.1" x2="248.92" y2="-38.1" width="0.1524" layer="91"/>
<junction x="256.54" y="-38.1"/>
<wire x1="248.92" y1="-38.1" x2="248.92" y2="-111.76" width="0.1524" layer="91"/>
<wire x1="248.92" y1="-111.76" x2="-73.66" y2="-111.76" width="0.1524" layer="91"/>
<wire x1="-73.66" y1="-111.76" x2="-73.66" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="-73.66" y1="-99.06" x2="-205.74" y2="-99.06" width="0.1524" layer="91"/>
<label x="-200.914" y="-98.298" size="1.27" layer="95"/>
<pinref part="JP5" gate="A" pin="1"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<wire x1="-15.24" y1="15.24" x2="-15.24" y2="43.18" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="43.18" x2="-71.12" y2="43.18" width="0.1524" layer="91"/>
<wire x1="-71.12" y1="43.18" x2="-71.12" y2="35.56" width="0.1524" layer="91"/>
<pinref part="IC13" gate="A" pin="P1"/>
<wire x1="-71.12" y1="35.56" x2="-60.96" y2="35.56" width="0.1524" layer="91"/>
<pinref part="IC1" gate="IC$1" pin="A0"/>
<wire x1="-15.24" y1="15.24" x2="-12.7" y2="15.24" width="0.1524" layer="91"/>
<pinref part="IC15" gate="A" pin="2Y"/>
<wire x1="-15.24" y1="-76.2" x2="-10.16" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="-76.2" x2="-10.16" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="-109.22" x2="-71.12" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="-71.12" y1="-109.22" x2="-71.12" y2="35.56" width="0.1524" layer="91"/>
<junction x="-71.12" y="35.56"/>
</segment>
</net>
<net name="N$73" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A4"/>
<wire x1="-25.4" y1="27.94" x2="-25.4" y2="5.08" width="0.1524" layer="91"/>
<wire x1="-25.4" y1="5.08" x2="-12.7" y2="5.08" width="0.1524" layer="91"/>
<pinref part="IC13" gate="A" pin="Q4"/>
<wire x1="-25.4" y1="27.94" x2="-35.56" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$74" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A5"/>
<wire x1="-27.94" y1="25.4" x2="-27.94" y2="2.54" width="0.1524" layer="91"/>
<wire x1="-27.94" y1="2.54" x2="-12.7" y2="2.54" width="0.1524" layer="91"/>
<pinref part="IC13" gate="A" pin="Q5"/>
<wire x1="-27.94" y1="25.4" x2="-35.56" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$75" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A6"/>
<wire x1="-30.48" y1="0" x2="-12.7" y2="0" width="0.1524" layer="91"/>
<wire x1="-30.48" y1="0" x2="-30.48" y2="22.86" width="0.1524" layer="91"/>
<pinref part="IC13" gate="A" pin="Q6"/>
<wire x1="-30.48" y1="22.86" x2="-35.56" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$76" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A7"/>
<wire x1="-33.02" y1="-2.54" x2="-12.7" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="-33.02" y1="-2.54" x2="-33.02" y2="20.32" width="0.1524" layer="91"/>
<pinref part="IC13" gate="A" pin="Q7"/>
<wire x1="-33.02" y1="20.32" x2="-35.56" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A3"/>
<wire x1="-22.86" y1="7.62" x2="-12.7" y2="7.62" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="30.48" x2="-22.86" y2="7.62" width="0.1524" layer="91"/>
<pinref part="IC13" gate="A" pin="Q3"/>
<wire x1="-22.86" y1="30.48" x2="-35.56" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$71" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A1"/>
<wire x1="-12.7" y1="12.7" x2="-17.78" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="12.7" x2="-17.78" y2="35.56" width="0.1524" layer="91"/>
<pinref part="IC13" gate="A" pin="Q1"/>
<wire x1="-17.78" y1="35.56" x2="-35.56" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$77" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="A2"/>
<wire x1="-12.7" y1="10.16" x2="-20.32" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-20.32" y1="10.16" x2="-20.32" y2="33.02" width="0.1524" layer="91"/>
<pinref part="IC13" gate="A" pin="Q2"/>
<wire x1="-20.32" y1="33.02" x2="-35.56" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$78" class="0">
<segment>
<pinref part="IC14" gate="A" pin="P1"/>
<wire x1="119.38" y1="35.56" x2="109.22" y2="35.56" width="0.1524" layer="91"/>
<wire x1="109.22" y1="35.56" x2="109.22" y2="43.18" width="0.1524" layer="91"/>
<wire x1="109.22" y1="43.18" x2="165.1" y2="43.18" width="0.1524" layer="91"/>
<wire x1="165.1" y1="43.18" x2="165.1" y2="15.24" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="A0"/>
<wire x1="165.1" y1="15.24" x2="167.64" y2="15.24" width="0.1524" layer="91"/>
<wire x1="109.22" y1="35.56" x2="109.22" y2="-71.12" width="0.1524" layer="91"/>
<junction x="109.22" y="35.56"/>
<pinref part="IC15" gate="A" pin="1Y"/>
<wire x1="109.22" y1="-71.12" x2="-15.24" y2="-71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$79" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="A1"/>
<wire x1="167.64" y1="12.7" x2="162.56" y2="12.7" width="0.1524" layer="91"/>
<wire x1="162.56" y1="12.7" x2="162.56" y2="35.56" width="0.1524" layer="91"/>
<wire x1="162.56" y1="35.56" x2="144.78" y2="35.56" width="0.1524" layer="91"/>
<pinref part="IC14" gate="A" pin="Q1"/>
</segment>
</net>
<net name="N$80" class="0">
<segment>
<pinref part="IC14" gate="A" pin="Q2"/>
<wire x1="144.78" y1="33.02" x2="160.02" y2="33.02" width="0.1524" layer="91"/>
<wire x1="160.02" y1="33.02" x2="160.02" y2="10.16" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="A2"/>
<wire x1="160.02" y1="10.16" x2="167.64" y2="10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$81" class="0">
<segment>
<pinref part="IC14" gate="A" pin="Q3"/>
<wire x1="144.78" y1="30.48" x2="157.48" y2="30.48" width="0.1524" layer="91"/>
<wire x1="157.48" y1="30.48" x2="157.48" y2="7.62" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="A3"/>
<wire x1="157.48" y1="7.62" x2="167.64" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$82" class="0">
<segment>
<pinref part="IC14" gate="A" pin="Q4"/>
<wire x1="144.78" y1="27.94" x2="154.94" y2="27.94" width="0.1524" layer="91"/>
<wire x1="154.94" y1="27.94" x2="154.94" y2="5.08" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="A4"/>
<wire x1="154.94" y1="5.08" x2="167.64" y2="5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$83" class="0">
<segment>
<pinref part="IC14" gate="A" pin="Q5"/>
<wire x1="144.78" y1="25.4" x2="152.4" y2="25.4" width="0.1524" layer="91"/>
<wire x1="152.4" y1="25.4" x2="152.4" y2="2.54" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="A5"/>
<wire x1="152.4" y1="2.54" x2="167.64" y2="2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$84" class="0">
<segment>
<pinref part="IC14" gate="A" pin="Q6"/>
<wire x1="144.78" y1="22.86" x2="149.86" y2="22.86" width="0.1524" layer="91"/>
<wire x1="149.86" y1="22.86" x2="149.86" y2="0" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="A6"/>
<wire x1="149.86" y1="0" x2="167.64" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$85" class="0">
<segment>
<pinref part="IC2" gate="IC$1" pin="A7"/>
<wire x1="167.64" y1="-2.54" x2="147.32" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="147.32" y1="-2.54" x2="147.32" y2="20.32" width="0.1524" layer="91"/>
<pinref part="IC14" gate="A" pin="Q7"/>
<wire x1="147.32" y1="20.32" x2="144.78" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VIDEO_CLKX" class="0">
<segment>
<pinref part="IC15" gate="A" pin="1B"/>
<wire x1="-40.64" y1="-73.66" x2="-43.18" y2="-73.66" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-73.66" x2="-43.18" y2="-76.2" width="0.1524" layer="91"/>
<pinref part="IC15" gate="A" pin="2A"/>
<wire x1="-43.18" y1="-76.2" x2="-40.64" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-73.66" x2="-78.74" y2="-73.66" width="0.1524" layer="91"/>
<junction x="-43.18" y="-73.66"/>
<wire x1="-78.74" y1="-73.66" x2="-78.74" y2="-101.6" width="0.1524" layer="91"/>
<wire x1="-78.74" y1="-101.6" x2="-205.74" y2="-101.6" width="0.1524" layer="91"/>
<label x="-200.914" y="-100.838" size="1.27" layer="95"/>
<pinref part="JP5" gate="A" pin="2"/>
</segment>
</net>
<net name="DATA_CLKX" class="0">
<segment>
<pinref part="IC15" gate="A" pin="1A"/>
<wire x1="-40.64" y1="-71.12" x2="-45.72" y2="-71.12" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="-71.12" x2="-45.72" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="IC15" gate="A" pin="2B"/>
<wire x1="-45.72" y1="-78.74" x2="-40.64" y2="-78.74" width="0.1524" layer="91"/>
<junction x="-45.72" y="-71.12"/>
<wire x1="-45.72" y1="-71.12" x2="-205.74" y2="-71.12" width="0.1524" layer="91"/>
<label x="-200.914" y="-70.358" size="1.27" layer="95"/>
<pinref part="JP4" gate="A" pin="3"/>
</segment>
</net>
<net name="VIDEO_RESX" class="0">
<segment>
<pinref part="IC15" gate="A" pin="3B"/>
<wire x1="-40.64" y1="-83.82" x2="-43.18" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-83.82" x2="-43.18" y2="-86.36" width="0.1524" layer="91"/>
<pinref part="IC15" gate="A" pin="4A"/>
<wire x1="-43.18" y1="-86.36" x2="-40.64" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-83.82" x2="-76.2" y2="-83.82" width="0.1524" layer="91"/>
<junction x="-43.18" y="-83.82"/>
<wire x1="-76.2" y1="-83.82" x2="-76.2" y2="-104.14" width="0.1524" layer="91"/>
<wire x1="-76.2" y1="-104.14" x2="-205.74" y2="-104.14" width="0.1524" layer="91"/>
<label x="-200.914" y="-103.378" size="1.27" layer="95"/>
<pinref part="JP5" gate="A" pin="3"/>
</segment>
</net>
<net name="DATA_RESX" class="0">
<segment>
<pinref part="IC15" gate="A" pin="3A"/>
<wire x1="-40.64" y1="-81.28" x2="-45.72" y2="-81.28" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="-81.28" x2="-45.72" y2="-88.9" width="0.1524" layer="91"/>
<pinref part="IC15" gate="A" pin="4B"/>
<wire x1="-45.72" y1="-88.9" x2="-40.64" y2="-88.9" width="0.1524" layer="91"/>
<junction x="-45.72" y="-81.28"/>
<wire x1="-45.72" y1="-81.28" x2="-91.44" y2="-81.28" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="-81.28" x2="-91.44" y2="-73.66" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="-73.66" x2="-205.74" y2="-73.66" width="0.1524" layer="91"/>
<label x="-200.914" y="-72.898" size="1.27" layer="95"/>
<pinref part="JP4" gate="A" pin="4"/>
</segment>
</net>
<net name="N$87" class="0">
<segment>
<pinref part="IC15" gate="A" pin="3Y"/>
<wire x1="-15.24" y1="-81.28" x2="111.76" y2="-81.28" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-81.28" x2="111.76" y2="7.62" width="0.1524" layer="91"/>
<pinref part="IC14" gate="A" pin="RES"/>
<wire x1="111.76" y1="7.62" x2="119.38" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$88" class="0">
<segment>
<pinref part="IC15" gate="A" pin="4Y"/>
<wire x1="-15.24" y1="-86.36" x2="-12.7" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="-86.36" x2="-12.7" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="-106.68" x2="-68.58" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="-68.58" y1="-106.68" x2="-68.58" y2="7.62" width="0.1524" layer="91"/>
<pinref part="IC13" gate="A" pin="RES"/>
<wire x1="-68.58" y1="7.62" x2="-60.96" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="IC16" gate="A" pin="2Y"/>
<pinref part="IC1" gate="IC$1" pin="WE"/>
<wire x1="22.86" y1="-22.86" x2="33.02" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-22.86" x2="33.02" y2="-167.64" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-167.64" x2="-15.24" y2="-167.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$47" class="0">
<segment>
<pinref part="IC16" gate="A" pin="1Y"/>
<wire x1="-15.24" y1="-162.56" x2="213.36" y2="-162.56" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="WE"/>
<wire x1="203.2" y1="-22.86" x2="213.36" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="213.36" y1="-22.86" x2="213.36" y2="-162.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="DATA_WE" class="0">
<segment>
<pinref part="IC16" gate="A" pin="1A"/>
<wire x1="-40.64" y1="-162.56" x2="-45.72" y2="-162.56" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="-162.56" x2="-45.72" y2="-170.18" width="0.1524" layer="91"/>
<pinref part="IC16" gate="A" pin="2B"/>
<wire x1="-45.72" y1="-170.18" x2="-40.64" y2="-170.18" width="0.1524" layer="91"/>
<junction x="-45.72" y="-162.56"/>
<wire x1="-45.72" y1="-162.56" x2="-99.06" y2="-162.56" width="0.1524" layer="91"/>
<wire x1="-99.06" y1="-162.56" x2="-99.06" y2="-68.58" width="0.1524" layer="91"/>
<wire x1="-99.06" y1="-68.58" x2="-180.34" y2="-68.58" width="0.1524" layer="91"/>
<label x="-200.914" y="-67.818" size="1.27" layer="95"/>
<pinref part="IC11" gate="C" pin="I"/>
<wire x1="-180.34" y1="-68.58" x2="-205.74" y2="-68.58" width="0.1524" layer="91"/>
<wire x1="-180.34" y1="-58.42" x2="-180.34" y2="-68.58" width="0.1524" layer="91"/>
<junction x="-180.34" y="-68.58"/>
<pinref part="JP4" gate="A" pin="2"/>
</segment>
</net>
<net name="COPY_DIR_DATA_TO_VIDEO_HIGH" class="0">
<segment>
<pinref part="IC16" gate="A" pin="3B"/>
<wire x1="-40.64" y1="-175.26" x2="-66.04" y2="-175.26" width="0.1524" layer="91"/>
<wire x1="-66.04" y1="-175.26" x2="-66.04" y2="-180.34" width="0.1524" layer="91"/>
<wire x1="-66.04" y1="-180.34" x2="-91.44" y2="-180.34" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="-180.34" x2="-91.44" y2="-172.72" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="-172.72" x2="-111.76" y2="-172.72" width="0.1524" layer="91"/>
<wire x1="-111.76" y1="-172.72" x2="-111.76" y2="-127" width="0.1524" layer="91"/>
<wire x1="-111.76" y1="-127" x2="-205.74" y2="-127" width="0.1524" layer="91"/>
<pinref part="IC11" gate="B" pin="I"/>
<wire x1="-88.9" y1="-172.72" x2="-91.44" y2="-172.72" width="0.1524" layer="91"/>
<junction x="-91.44" y="-172.72"/>
<label x="-200.66" y="-126.238" size="1.27" layer="95"/>
<pinref part="JP6" gate="G$1" pin="1"/>
</segment>
</net>
<net name="DATA_RESY1" class="0">
<segment>
<pinref part="IC16" gate="A" pin="3A"/>
<wire x1="-40.64" y1="-172.72" x2="-68.58" y2="-172.72" width="0.1524" layer="91"/>
<pinref part="IC11" gate="B" pin="O"/>
</segment>
</net>
<net name="COPY_ENABLE_LOW" class="0">
<segment>
<pinref part="IC12" gate="A" pin="G"/>
<wire x1="76.2" y1="27.94" x2="76.2" y2="-157.48" width="0.1524" layer="91"/>
<wire x1="76.2" y1="-157.48" x2="-109.22" y2="-157.48" width="0.1524" layer="91"/>
<wire x1="-109.22" y1="-157.48" x2="-109.22" y2="-129.54" width="0.1524" layer="91"/>
<wire x1="-109.22" y1="-129.54" x2="-205.74" y2="-129.54" width="0.1524" layer="91"/>
<label x="-200.66" y="-128.778" size="1.27" layer="95"/>
<pinref part="JP6" gate="G$1" pin="2"/>
</segment>
</net>
<net name="INTERNAL_COPY_DIRECTION" class="0">
<segment>
<pinref part="IC12" gate="A" pin="DIR"/>
<wire x1="78.74" y1="27.94" x2="78.74" y2="-172.72" width="0.1524" layer="91"/>
<wire x1="78.74" y1="-172.72" x2="-15.24" y2="-172.72" width="0.1524" layer="91"/>
<pinref part="IC16" gate="A" pin="3Y"/>
<label x="-12.7" y="-172.72" size="1.27" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="IC15" gate="A" pin="G"/>
<wire x1="-40.64" y1="-96.52" x2="-48.26" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="-48.26" y1="-96.52" x2="-48.26" y2="-142.24" width="0.1524" layer="91"/>
<pinref part="IC9" gate="A" pin="G"/>
<wire x1="-48.26" y1="-142.24" x2="-40.64" y2="-142.24" width="0.1524" layer="91"/>
<wire x1="-48.26" y1="-142.24" x2="-48.26" y2="-187.96" width="0.1524" layer="91"/>
<junction x="-48.26" y="-142.24"/>
<wire x1="-48.26" y1="-187.96" x2="-48.26" y2="-190.5" width="0.1524" layer="91"/>
<pinref part="IC16" gate="A" pin="G"/>
<wire x1="-40.64" y1="-187.96" x2="-48.26" y2="-187.96" width="0.1524" layer="91"/>
<junction x="-48.26" y="-187.96"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="IC$1" pin="OE"/>
<wire x1="22.86" y1="-25.4" x2="25.4" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-25.4" x2="25.4" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="IC1" gate="IC$1" pin="CS1"/>
<wire x1="25.4" y1="-30.48" x2="22.86" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="IC1" gate="IC$1" pin="VSS"/>
<wire x1="22.86" y1="-15.24" x2="25.4" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-25.4" x2="25.4" y2="-15.24" width="0.1524" layer="91"/>
<junction x="25.4" y="-25.4"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="25.4" y1="-30.48" x2="25.4" y2="-33.02" width="0.1524" layer="91"/>
<junction x="25.4" y="-30.48"/>
</segment>
<segment>
<pinref part="IC2" gate="IC$1" pin="OE"/>
<wire x1="203.2" y1="-25.4" x2="205.74" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="205.74" y1="-25.4" x2="205.74" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="CS1"/>
<wire x1="205.74" y1="-30.48" x2="203.2" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="205.74" y1="-25.4" x2="205.74" y2="-15.24" width="0.1524" layer="91"/>
<junction x="205.74" y="-25.4"/>
<pinref part="IC2" gate="IC$1" pin="VSS"/>
<wire x1="205.74" y1="-15.24" x2="203.2" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="205.74" y1="-30.48" x2="205.74" y2="-33.02" width="0.1524" layer="91"/>
<junction x="205.74" y="-30.48"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="IC3" gate="P" pin="GND"/>
<wire x1="-175.26" y1="104.14" x2="-175.26" y2="101.6" width="0.1524" layer="91"/>
<pinref part="IC4" gate="P" pin="GND"/>
<wire x1="-175.26" y1="101.6" x2="-167.64" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-167.64" y1="101.6" x2="-167.64" y2="104.14" width="0.1524" layer="91"/>
<pinref part="IC5" gate="P" pin="GND"/>
<wire x1="-167.64" y1="101.6" x2="-160.02" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-160.02" y1="101.6" x2="-160.02" y2="104.14" width="0.1524" layer="91"/>
<junction x="-167.64" y="101.6"/>
<pinref part="IC6" gate="P" pin="GND"/>
<wire x1="-160.02" y1="101.6" x2="-152.4" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-152.4" y1="101.6" x2="-152.4" y2="104.14" width="0.1524" layer="91"/>
<junction x="-160.02" y="101.6"/>
<pinref part="IC7" gate="P" pin="VSS"/>
<wire x1="-152.4" y1="101.6" x2="-144.78" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-144.78" y1="101.6" x2="-144.78" y2="104.14" width="0.1524" layer="91"/>
<junction x="-152.4" y="101.6"/>
<pinref part="IC8" gate="P" pin="VSS"/>
<wire x1="-144.78" y1="101.6" x2="-137.16" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-137.16" y1="101.6" x2="-137.16" y2="104.14" width="0.1524" layer="91"/>
<junction x="-144.78" y="101.6"/>
<pinref part="IC9" gate="P" pin="GND"/>
<wire x1="-137.16" y1="101.6" x2="-129.54" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-129.54" y1="101.6" x2="-129.54" y2="104.14" width="0.1524" layer="91"/>
<junction x="-137.16" y="101.6"/>
<junction x="-129.54" y="101.6"/>
<pinref part="IC11" gate="P" pin="GND"/>
<wire x1="-129.54" y1="101.6" x2="-121.92" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="101.6" x2="-121.92" y2="104.14" width="0.1524" layer="91"/>
<pinref part="IC12" gate="P" pin="GND"/>
<wire x1="-121.92" y1="101.6" x2="-114.3" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="101.6" x2="-114.3" y2="104.14" width="0.1524" layer="91"/>
<junction x="-121.92" y="101.6"/>
<pinref part="IC13" gate="P" pin="VSS"/>
<wire x1="-114.3" y1="101.6" x2="-106.68" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-106.68" y1="101.6" x2="-106.68" y2="104.14" width="0.1524" layer="91"/>
<junction x="-114.3" y="101.6"/>
<pinref part="IC14" gate="P" pin="VSS"/>
<wire x1="-106.68" y1="101.6" x2="-99.06" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-99.06" y1="101.6" x2="-99.06" y2="104.14" width="0.1524" layer="91"/>
<junction x="-106.68" y="101.6"/>
<pinref part="IC15" gate="P" pin="GND"/>
<wire x1="-99.06" y1="101.6" x2="-91.44" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="101.6" x2="-91.44" y2="104.14" width="0.1524" layer="91"/>
<junction x="-99.06" y="101.6"/>
<pinref part="IC16" gate="P" pin="GND"/>
<wire x1="-91.44" y1="101.6" x2="-83.82" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-83.82" y1="101.6" x2="-83.82" y2="104.14" width="0.1524" layer="91"/>
<junction x="-91.44" y="101.6"/>
<wire x1="-175.26" y1="101.6" x2="-193.04" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-193.04" y1="101.6" x2="-193.04" y2="109.22" width="0.1524" layer="91"/>
<junction x="-175.26" y="101.6"/>
<pinref part="JP7" gate="G$1" pin="2"/>
<wire x1="-193.04" y1="109.22" x2="-205.74" y2="109.22" width="0.1524" layer="91"/>
<wire x1="-193.04" y1="101.6" x2="-193.04" y2="99.06" width="0.1524" layer="91"/>
<junction x="-193.04" y="101.6"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
</net>
<net name="VCC" class="0">
<segment>
<pinref part="IC1" gate="IC$1" pin="CS2"/>
<wire x1="22.86" y1="-27.94" x2="27.94" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="27.94" y1="-27.94" x2="27.94" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="IC1" gate="IC$1" pin="VCC"/>
<wire x1="27.94" y1="-12.7" x2="22.86" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="27.94" y1="-12.7" x2="27.94" y2="-10.16" width="0.1524" layer="91"/>
<junction x="27.94" y="-12.7"/>
<pinref part="P+2" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="IC2" gate="IC$1" pin="CS2"/>
<wire x1="203.2" y1="-27.94" x2="208.28" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="208.28" y1="-27.94" x2="208.28" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="IC2" gate="IC$1" pin="VCC"/>
<wire x1="208.28" y1="-12.7" x2="203.2" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="208.28" y1="-12.7" x2="208.28" y2="-10.16" width="0.1524" layer="91"/>
<junction x="208.28" y="-12.7"/>
<pinref part="P+3" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="IC16" gate="P" pin="VCC"/>
<wire x1="-83.82" y1="119.38" x2="-83.82" y2="121.92" width="0.1524" layer="91"/>
<pinref part="IC15" gate="P" pin="VCC"/>
<wire x1="-83.82" y1="121.92" x2="-91.44" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="121.92" x2="-91.44" y2="119.38" width="0.1524" layer="91"/>
<pinref part="IC14" gate="P" pin="VDD"/>
<wire x1="-91.44" y1="121.92" x2="-99.06" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-99.06" y1="121.92" x2="-99.06" y2="119.38" width="0.1524" layer="91"/>
<junction x="-91.44" y="121.92"/>
<pinref part="IC13" gate="P" pin="VDD"/>
<wire x1="-99.06" y1="121.92" x2="-106.68" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-106.68" y1="121.92" x2="-106.68" y2="119.38" width="0.1524" layer="91"/>
<junction x="-99.06" y="121.92"/>
<pinref part="IC12" gate="P" pin="VCC"/>
<wire x1="-106.68" y1="121.92" x2="-114.3" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="121.92" x2="-114.3" y2="119.38" width="0.1524" layer="91"/>
<junction x="-106.68" y="121.92"/>
<pinref part="IC11" gate="P" pin="VCC"/>
<wire x1="-114.3" y1="121.92" x2="-121.92" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="121.92" x2="-121.92" y2="119.38" width="0.1524" layer="91"/>
<junction x="-114.3" y="121.92"/>
<junction x="-121.92" y="121.92"/>
<pinref part="IC9" gate="P" pin="VCC"/>
<wire x1="-121.92" y1="121.92" x2="-129.54" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-129.54" y1="121.92" x2="-129.54" y2="119.38" width="0.1524" layer="91"/>
<pinref part="IC8" gate="P" pin="VDD"/>
<wire x1="-129.54" y1="121.92" x2="-137.16" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-137.16" y1="121.92" x2="-137.16" y2="119.38" width="0.1524" layer="91"/>
<junction x="-129.54" y="121.92"/>
<pinref part="IC7" gate="P" pin="VDD"/>
<wire x1="-137.16" y1="121.92" x2="-144.78" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-144.78" y1="121.92" x2="-144.78" y2="119.38" width="0.1524" layer="91"/>
<junction x="-137.16" y="121.92"/>
<pinref part="IC6" gate="P" pin="VCC"/>
<wire x1="-144.78" y1="121.92" x2="-152.4" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-152.4" y1="121.92" x2="-152.4" y2="119.38" width="0.1524" layer="91"/>
<junction x="-144.78" y="121.92"/>
<pinref part="IC5" gate="P" pin="VCC"/>
<wire x1="-152.4" y1="121.92" x2="-160.02" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-160.02" y1="121.92" x2="-160.02" y2="119.38" width="0.1524" layer="91"/>
<junction x="-152.4" y="121.92"/>
<pinref part="IC4" gate="P" pin="VCC"/>
<wire x1="-160.02" y1="121.92" x2="-167.64" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-167.64" y1="121.92" x2="-167.64" y2="119.38" width="0.1524" layer="91"/>
<junction x="-160.02" y="121.92"/>
<pinref part="IC3" gate="P" pin="VCC"/>
<wire x1="-167.64" y1="121.92" x2="-175.26" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-175.26" y1="121.92" x2="-175.26" y2="119.38" width="0.1524" layer="91"/>
<junction x="-167.64" y="121.92"/>
<pinref part="JP7" gate="G$1" pin="1"/>
<wire x1="-205.74" y1="111.76" x2="-193.04" y2="111.76" width="0.1524" layer="91"/>
<wire x1="-193.04" y1="111.76" x2="-193.04" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-193.04" y1="121.92" x2="-175.26" y2="121.92" width="0.1524" layer="91"/>
<junction x="-175.26" y="121.92"/>
<wire x1="-193.04" y1="121.92" x2="-193.04" y2="124.46" width="0.1524" layer="91"/>
<junction x="-193.04" y="121.92"/>
<pinref part="P+4" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="IC16" gate="A" pin="1B"/>
<wire x1="-40.64" y1="-165.1" x2="-43.18" y2="-165.1" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-165.1" x2="-43.18" y2="-167.64" width="0.1524" layer="91"/>
<pinref part="IC16" gate="A" pin="2A"/>
<wire x1="-43.18" y1="-167.64" x2="-40.64" y2="-167.64" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-165.1" x2="-43.18" y2="-149.86" width="0.1524" layer="91"/>
<junction x="-43.18" y="-165.1"/>
<pinref part="P+5" gate="VCC" pin="VCC"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="IC7" gate="A" pin="Q1"/>
<pinref part="IC1" gate="IC$1" pin="A9"/>
<wire x1="-12.7" y1="-7.62" x2="-35.56" y2="-7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<pinref part="IC7" gate="A" pin="Q2"/>
<pinref part="IC1" gate="IC$1" pin="A10"/>
<wire x1="-12.7" y1="-10.16" x2="-35.56" y2="-10.16" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="104,1,22.86,-15.24,IC1,VSS,GND,,,"/>
<approved hash="104,1,203.2,-15.24,IC2,VSS,GND,,,"/>
<approved hash="114,1,-160.02,-45.7835,IC11,D,I,,,"/>
<approved hash="114,1,-160.02,-45.7835,IC11,E,I,,,"/>
<approved hash="114,1,-160.02,-45.7835,IC11,F,I,,,"/>
<approved hash="104,1,-144.78,104.14,IC7P,VSS,GND,,,"/>
<approved hash="104,1,-144.78,119.38,IC7P,VDD,VCC,,,"/>
<approved hash="104,1,-137.16,104.14,IC8P,VSS,GND,,,"/>
<approved hash="104,1,-137.16,119.38,IC8P,VDD,VCC,,,"/>
<approved hash="104,1,-106.68,104.14,IC13P,VSS,GND,,,"/>
<approved hash="104,1,-106.68,119.38,IC13P,VDD,VCC,,,"/>
<approved hash="104,1,-99.06,104.14,IC14P,VSS,GND,,,"/>
<approved hash="104,1,-99.06,119.38,IC14P,VDD,VCC,,,"/>
<approved hash="202,1,-40.64,-180.34,IC16,4B,,,,"/>
<approved hash="202,1,-40.64,-177.8,IC16,4A,,,,"/>
</errors>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
