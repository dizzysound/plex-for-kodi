{# plx hub card. params: display (poster|square|ar16x9), mask, cw, ch, focused. uses hub_id #}
<{% if focused %}focusedlayout{% else %}itemlayout{% endif %} width="287" condition="String.IsEqual(Window.Property(hub.display.{{ hub_id }}),{{ display }})">
    <control type="group">
        <posx>55</posx>
        <posy>{{ vscale(72) }}</posy>
        <control type="group">
            {% if focused %}
            <animation effect="zoom" start="100" end="112" time="120" tween="sine" easing="out" center="{{ cw / 2 + 5 }},{{ (ch / 2 + 5)|vscale }}" reversible="false">Focus</animation>
            <animation effect="zoom" start="112" end="100" time="120" tween="sine" easing="out" center="{{ cw / 2 + 5 }},{{ (ch / 2 + 5)|vscale }}" reversible="false">UnFocus</animation>
            <control type="image">
                <visible>Control.HasFocus({{ hub_id }})</visible>
                <posx>-35</posx>
                <posy>{{ vscale(-35) }}</posy>
                <width>{{ cw + 90 }}</width>
                <height>{{ (ch + 100)|vscale }}</height>
                <texture border="42">script.plex/drop-shadow.png</texture>
            </control>
            {% endif %}
            <control type="group">
                <posx>5</posx>
                <posy>5</posy>
                <control type="group">
                    <visible>!String.IsEmpty(ListItem.Property(is.end))</visible>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>{{ cw }}</width>
                        <height>{{ vscale(ch) }}</height>
                        <texture border="20" colordiffuse="{{ theme.colors.surface_hi }}">script.plex/plx/card.png</texture>
                    </control>
                    <control type="image">
                        <visible>String.IsEmpty(ListItem.Property(is.updating))</visible>
                        <posx>{{ cw / 2 - 30 }}</posx>
                        <posy>{{ (ch / 2 - 50)|vscale }}</posy>
                        <width>61</width>
                        <height>{{ vscale(100) }}</height>
                        <texture colordiffuse="{{ theme.colors.text_a0 }}">script.plex/indicators/chevron-white.png</texture>
                    </control>
                    <control type="image">
                        <visible>!String.IsEmpty(ListItem.Property(is.updating))</visible>
                        <posx>{{ cw / 2 - 64 }}</posx>
                        <posy>{{ (ch / 2 - 64)|vscale }}</posy>
                        <width>128</width>
                        <height>{{ vscale(128) }}</height>
                        <texture>script.plex/home/busy.gif</texture>
                    </control>
                </control>
                <control type="image">
                    <posx>0</posx>
                    <posy>0</posy>
                    <width>{{ cw }}</width>
                    <height>{{ vscale(ch) }}</height>
                    <texture diffuse="script.plex/plx/{{ mask }}">$INFO[ListItem.Property(thumb.fallback)]</texture>
                </control>
                <control type="image">
                    <posx>0</posx>
                    <posy>0</posy>
                    <width>{{ cw }}</width>
                    <height>{{ vscale(ch) }}</height>
                    <texture background="true" diffuse="script.plex/plx/{{ mask }}">$INFO[ListItem.Thumb]</texture>
                    <aspectratio>scale</aspectratio>
                </control>
                <control type="group">
                    <visible>!String.IsEmpty(ListItem.Property(progress))</visible>
                    <posx>16</posx>
                    <posy>{{ (ch - 20)|vscale }}</posy>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>{{ cw - 32 }}</width>
                        <height>{{ vscale(6) }}</height>
                        <texture>script.plex/white-square.png</texture>
                        <colordiffuse>{{ theme.colors.scrim }}</colordiffuse>
                    </control>
                    <control type="image">
                        <posx>0</posx>
                        <posy>0</posy>
                        <width>{{ cw - 32 }}</width>
                        <height>{{ vscale(6) }}</height>
                        <texture>$INFO[ListItem.Property(progress)]</texture>
                        <colordiffuse>{{ theme.colors.progress }}</colordiffuse>
                    </control>
                </control>
                {% if focused %}
                <control type="group">
                    <visible>Control.HasFocus({{ hub_id }})</visible>
                    <control type="label">
                        <scroll>true</scroll>
                        <posx>-20</posx>
                        <posy>{{ (ch + 6)|vscale }}</posy>
                        <width>{{ cw + 40 }}</width>
                        <height>{{ vscale(35) }}</height>
                        <font>font12</font>
                        <align>center</align>
                        <textcolor>{{ theme.colors.text }}</textcolor>
                        <label>$INFO[ListItem.Label]</label>
                    </control>
                    <control type="label">
                        <scroll>true</scroll>
                        <visible>!String.IsEmpty(Window.Property(hub.text2lines.{{ hub_id }}))</visible>
                        <posx>-20</posx>
                        <posy>{{ (ch + 34)|vscale }}</posy>
                        <width>{{ cw + 40 }}</width>
                        <height>{{ vscale(35) }}</height>
                        <font>font10</font>
                        <align>center</align>
                        <textcolor>{{ theme.colors.text_b8 }}</textcolor>
                        <label>$INFO[ListItem.Label2]</label>
                    </control>
                </control>
                {% endif %}
                {% include "includes/watched_indicator.xml.tpl" with xoff=cw - 8 & yoff=8 & uw_size=48 & with_count=True & scale="medium" %}
            </control>
        </control>
    </control>
</{% if focused %}focusedlayout{% else %}itemlayout{% endif %}>
