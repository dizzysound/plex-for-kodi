{# plx home: hero for the focused item plus the section pills. Keeps control ids 100 and 101. #}
<control type="group" id="100">
    <width>2130</width>
    <height>{{ vscale(plx_hero_h) }}</height>
    <control type="group">
        <animation type="Conditional" condition="!String.IsEmpty(Window.Property(hub.focus))">
            <effect type="fade" end="0" time="200"/>
        </animation>
        <control type="image">
            <posx>0</posx>
            <posy>0</posy>
            <width>1920</width>
            <height>{{ vscale(plx_hero_h) }}</height>
            <fadetime>400</fadetime>
            <texture background="true">$INFO[Window.Property(hero.art)]</texture>
            <aspectratio>scale</aspectratio>
        </control>
        <control type="image">
            <posx>0</posx>
            <posy>0</posy>
            <width>1200</width>
            <height>{{ vscale(plx_hero_h) }}</height>
            <texture colordiffuse="{{ theme.colors.bg_d9 }}">script.plex/plx/scrim-left.png</texture>
        </control>
        <control type="image">
            <posx>0</posx>
            <posy>{{ (plx_hero_h - 420)|vscale }}</posy>
            <width>1920</width>
            <height>{{ vscale(420) }}</height>
            <texture colordiffuse="{{ theme.colors.bg }}">script.plex/plx/scrim-up.png</texture>
        </control>
        <control type="image">
            <posx>0</posx>
            <posy>0</posy>
            <width>1920</width>
            <height>{{ vscale(260) }}</height>
            <texture colordiffuse="99000000">script.plex/plx/scrim-down.png</texture>
        </control>
        <control type="image">
            <visible>!String.IsEmpty(Window.Property(clear.logo))</visible>
            <posx>60</posx>
            <posy>{{ (plx_hero_h - 440)|vscale }}</posy>
            <width>640</width>
            <height>{{ vscale(180) }}</height>
            <aspectratio aligny="bottom" align="left">keep</aspectratio>
            <texture background="true">$INFO[Window.Property(clear.logo)]</texture>
        </control>
        <control type="label">
            <visible>String.IsEmpty(Window.Property(clear.logo))</visible>
            <posx>60</posx>
            <posy>{{ (plx_hero_h - 440)|vscale }}</posy>
            <width>900</width>
            <height>{{ vscale(180) }}</height>
            <font>font45</font>
            <aligny>bottom</aligny>
            <textcolor>{{ theme.colors.text }}</textcolor>
            <label>$INFO[Window.Property(hero.title)]</label>
        </control>
        <control type="label">
            <posx>60</posx>
            <posy>{{ (plx_hero_h - 250)|vscale }}</posy>
            <width>900</width>
            <height>{{ vscale(40) }}</height>
            <font>font12</font>
            <aligny>center</aligny>
            <textcolor>{{ theme.colors.text_d8 }}</textcolor>
            <label>$INFO[Window.Property(hero.meta)]</label>
        </control>
        <control type="textbox">
            <posx>60</posx>
            <posy>{{ (plx_hero_h - 200)|vscale }}</posy>
            <width>760</width>
            <height>{{ vscale(105) }}</height>
            <font>font12</font>
            <textcolor>{{ theme.colors.text_b8 }}</textcolor>
            <label>$INFO[Window.Property(hero.summary)]</label>
        </control>
    </control>
    <control type="list" id="101">
        <posx>55</posx>
        <posy>{{ vscale(125) }}</posy>
        <width>1800</width>
        <height>{{ vscale(70) }}</height>
        <onup condition="!Player.HasAudio">203</onup>
        <onup condition="Player.HasAudio">204</onup>
        <ondown>400</ondown>
        <scrolltime>200</scrolltime>
        <orientation>horizontal</orientation>
        <itemlayout width="190" height="{{ vscale(70) }}">
            <control type="group">
                <visible>!String.IsEmpty(ListItem.Property(item))</visible>
                <posx>0</posx>
                <posy>{{ vscale(3) }}</posy>
                <control type="image">
                    <posx>0</posx>
                    <posy>0</posy>
                    <width>180</width>
                    <height>{{ vscale(64) }}</height>
                    <texture border="32" colordiffuse="{{ theme.colors.glass }}">script.plex/plx/pill.png</texture>
                </control>
                <control type="label">
                    <scroll>false</scroll>
                    <posx>10</posx>
                    <posy>0</posy>
                    <width>160</width>
                    <height>{{ vscale(64) }}</height>
                    <font>font12</font>
                    <align>center</align>
                    <aligny>center</aligny>
                    <textcolor>{{ theme.colors.text_d8 }}</textcolor>
                    <label>$INFO[ListItem.Label]</label>
                </control>
            </control>
        </itemlayout>
        <focusedlayout width="190" height="{{ vscale(70) }}">
            <control type="group">
                <visible>!String.IsEmpty(ListItem.Property(item))</visible>
                <posx>0</posx>
                <posy>{{ vscale(3) }}</posy>
                <control type="group">
                    <visible>Control.HasFocus(101)</visible>
                    <animation effect="zoom" start="100" end="106" time="100" center="90,{{ vscale(32) }}" reversible="false">Focus</animation>
                    <animation effect="zoom" start="106" end="100" time="100" center="90,{{ vscale(32) }}" reversible="false">UnFocus</animation>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>180</width>
                        <height>{{ vscale(64) }}</height>
                        <texture border="32" colordiffuse="{{ theme.colors.focus }}">script.plex/plx/pill.png</texture>
                    </control>
                    <control type="label">
                        <scroll>false</scroll>
                        <posx>10</posx>
                        <posy>0</posy>
                        <width>160</width>
                        <height>{{ vscale(64) }}</height>
                        <font>font12</font>
                        <align>center</align>
                        <aligny>center</aligny>
                        <textcolor>{{ theme.colors.text_on_focus }}</textcolor>
                        <label>[B]$INFO[ListItem.Label][/B]</label>
                    </control>
                </control>
                <control type="group">
                    <visible>!Control.HasFocus(101)</visible>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>180</width>
                        <height>{{ vscale(64) }}</height>
                        <texture border="32" colordiffuse="{{ theme.colors.glass_hi }}">script.plex/plx/pill.png</texture>
                    </control>
                    <control type="label">
                        <scroll>false</scroll>
                        <posx>10</posx>
                        <posy>0</posy>
                        <width>160</width>
                        <height>{{ vscale(64) }}</height>
                        <font>font12</font>
                        <align>center</align>
                        <aligny>center</aligny>
                        <textcolor>{{ theme.colors.text }}</textcolor>
                        <label>[B]$INFO[ListItem.Label][/B]</label>
                    </control>
                </control>
            </control>
        </focusedlayout>
    </control>
</control>
