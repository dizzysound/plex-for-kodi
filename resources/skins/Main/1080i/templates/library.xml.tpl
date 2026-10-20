{% extends "default.xml.tpl" %}
{% block headers %}<defaultcontrol>100</defaultcontrol>{% endblock %}

{% block header %}
<control type="group" id="200">
    {% block header_animation %}<animation effect="slide" end="0,{{ vscale(-135) }}" time="200" tween="quadratic" easing="out" condition="Integer.IsGreater(Container(101).ListItem.Property(index),5) + !ControlGroup(200).HasFocus(0) + String.IsEmpty(Window.Property(content.filling))">Conditional</animation>{% endblock %}
    <defaultcontrol always="true">201</defaultcontrol>
    <posx>0</posx>
    <posy>0</posy>
    <width>1920</width>
    <height>{{ vscale(135) }}</height>
    <visible>!String.IsEmpty(Window.Property(initialized))</visible>
    {% block header_bg %}
    <control type="image">
        <animation effect="fade" start="0" end="100" time="200" tween="quadratic" easing="out" reversible="true">VisibleChange</animation>
        <visible>ControlGroup(200).HasFocus(0) + Integer.IsGreater(Container(101).ListItem.Property(index),5)</visible>
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>{{ vscale(135) }}</height>
        <texture>script.plex/white-square.png</texture>
        <colordiffuse>{{ theme.colors.scrim }}</colordiffuse>
    </control>
    {% endblock %}
    <control type="grouplist">
        <posx>60</posx>
        <posy>{% if theme.plx %}{{ vscale(35.5) }}{% else %}{{ vscale(47.5) }}{% endif %}</posy>
        <width>1000</width>
        <height>{% if theme.plx %}{{ vscale(64) }}{% else %}{{ vscale(40) }}{% endif %}</height>
        <align>left</align>
        <itemgap>60</itemgap>
        <orientation>horizontal</orientation>
        <ondown condition="String.IsEmpty(Window.Property(no.content.filtered))">50</ondown>
        <ondown condition="!String.IsEmpty(Window.Property(no.content.filtered))">600</ondown>
        <control type="group">
            <width>{% if theme.plx %}64{% else %}40{% endif %}</width>
            <height>{% if theme.plx %}{{ vscale(64) }}{% else %}{{ vscale(40) }}{% endif %}</height>
            {% if theme.plx %}
            {% with chip = "201" %}{% include "includes/plx/chip.xml.tpl" %}{% endwith %}
            {% endif %}
            <control type="button" id="201">
                <animation effect="zoom" start="100" end="144" time="100" center="{% if theme.plx %}32,{{ vscale(32) }}{% else %}20,{{ vscale(20) }}{% endif %}" reversible="false">Focus</animation>
                <animation effect="zoom" start="144" end="100" time="100" center="{% if theme.plx %}32,{{ vscale(32) }}{% else %}20,{{ vscale(20) }}{% endif %}" reversible="false">UnFocus</animation>
                {% if theme.plx %}<posx>12</posx><posy>{{ vscale(12) }}</posy>{% endif %}
                <width>40</width>
                <height>{{ vscale(40) }}</height>
                <onright>202</onright>
                <ondown condition="String.IsEmpty(Window.Property(no.content.filtered))">50</ondown>
                <ondown condition="!String.IsEmpty(Window.Property(no.content.filtered))">600</ondown>
                <font>font12</font>
                <focusedcolor>{{ theme.colors.text_on_focus }}</focusedcolor>
                <texturefocus colordiffuse="{{ theme.colors.focus }}">script.plex/buttons/home-focus.png</texturefocus>
                <texturenofocus colordiffuse="99FFFFFF">script.plex/buttons/home.png</texturenofocus>
                <label> </label>
            </control>
        </control>
        <control type="label">
            <width max="300">auto</width>
            <height>{% if theme.plx %}{{ vscale(64) }}{% else %}{{ vscale(40) }}{% endif %}</height>
            <font>{% if theme.plx %}font13{% else %}font12{% endif %}</font>
            <align>left</align>
            <aligny>center</aligny>
            <textcolor>{{ theme.colors.text }}</textcolor>
            <label>{% if theme.plx %}[B]$INFO[Window.Property(screen.title)][/B][COLOR=gray]$INFO[Window.Property(items.count),  (,)][/COLOR]{% else %}[UPPERCASE]$INFO[Window.Property(screen.title)][/UPPERCASE][COLOR=gray]$INFO[Window.Property(items.count),  (,)][/COLOR]{% endif %}</label>
            <scroll>true</scroll>
        </control>
        <control type="group">
            <width>{% if theme.plx %}64{% else %}40{% endif %}</width>
            <height>{% if theme.plx %}{{ vscale(64) }}{% else %}{{ vscale(40) }}{% endif %}</height>
            {% if theme.plx %}
            {% with chip = "202" %}{% include "includes/plx/chip.xml.tpl" %}{% endwith %}
            {% endif %}
            <control type="button" id="202">
                <animation effect="zoom" start="100" end="144" time="100" center="{% if theme.plx %}32,{{ vscale(32) }}{% else %}20,{{ vscale(20) }}{% endif %}" reversible="false">Focus</animation>
                <animation effect="zoom" start="144" end="100" time="100" center="{% if theme.plx %}32,{{ vscale(32) }}{% else %}20,{{ vscale(20) }}{% endif %}" reversible="false">UnFocus</animation>
                {% if theme.plx %}<posx>12</posx><posy>{{ vscale(12) }}</posy>{% endif %}
                <width>40</width>
                <height>{{ vscale(40) }}</height>
                <onright condition="String.IsEmpty(Window.Property(no.content.filtered))">204</onright>
                <onright condition="!String.IsEmpty(Window.Property(no.content.filtered))">600</onright>
                <onleft>201</onleft>
                <ondown condition="String.IsEmpty(Window.Property(no.content.filtered))">50</ondown>
                <ondown condition="!String.IsEmpty(Window.Property(no.content.filtered))">600</ondown>
                <font>font12</font>
                <focusedcolor>{{ theme.colors.text_on_focus }}</focusedcolor>
                <texturefocus colordiffuse="{{ theme.colors.focus }}">script.plex/buttons/search-focus.png</texturefocus>
                <texturenofocus colordiffuse="99FFFFFF">script.plex/buttons/search.png</texturenofocus>
                <label> </label>
            </control>
        </control>
    </control>
    <control type="group">
        <visible>Player.HasAudio + String.IsEmpty(Window(10000).Property(script.plex.theme_playing))</visible>
        <posx>620</posx>
        <posy>0</posy>
        <control type="button" id="204">
            <visible>Player.HasAudio + String.IsEmpty(Window(10000).Property(script.plex.theme_playing))</visible>
            <posx>-10</posx>
            <posy>{{ vscale(38) }}</posy>
            <width>260</width>
            <height>{{ vscale(75) }}</height>
            <onleft>202</onleft>
            <ondown>50</ondown>
            <font>font12</font>
            <textcolor>{{ theme.colors.text }}</textcolor>
            <focusedcolor>{{ theme.colors.text_on_focus }}</focusedcolor>
            <align>right</align>
            <aligny>center</aligny>
            {% if theme.plx %}
            <texturefocus colordiffuse="{{ theme.colors.focus }}" border="32">script.plex/plx/pill.png</texturefocus>
            <texturenofocus colordiffuse="{{ theme.colors.glass }}" border="32">script.plex/plx/pill.png</texturenofocus>
            {% else %}
            <texturefocus colordiffuse="{{ theme.colors.focus }}" border="10">script.plex/white-square-rounded.png</texturefocus>
            <texturenofocus>-</texturenofocus>
            {% endif %}
            <textoffsetx>100</textoffsetx>
            <textoffsety>0</textoffsety>
            <label> </label>
        </control>
        <control type="image">
            <posx>0</posx>
            <posy>{{ vscale(48) }}</posy>
            <width>42</width>
            <height>{{ vscale(42) }}</height>
            <texture>$INFO[Player.Art(thumb)]</texture>
        </control>

        <control type="group">
            <visible>!Control.HasFocus(204)</visible>
            <control type="label">
                <posx>53</posx>
                <posy>{{ vscale(48) }}</posy>
                <width>187</width>
                <height>{{ vscale(20) }}</height>
                <font>font10</font>
                <align>left</align>
                <aligny>center</aligny>
                <textcolor>{{ theme.colors.text }}</textcolor>
                <info>MusicPlayer.Artist</info>
            </control>
            <control type="label">
                <posx>53</posx>
                <posy>{{ vscale(72) }}</posy>
                <width>187</width>
                <height>{{ vscale(20) }}</height>
                <font>font10</font>
                <align>left</align>
                <aligny>center</aligny>
                <textcolor>{{ theme.colors.text }}</textcolor>
                <info>MusicPlayer.Title</info>
            </control>
        </control>
        <control type="group">
            <visible>Control.HasFocus(204)</visible>
            <control type="label">
                <posx>53</posx>
                <posy>{{ vscale(48) }}</posy>
                <width>187</width>
                <height>{{ vscale(20) }}</height>
                <font>font10</font>
                <align>left</align>
                <aligny>center</aligny>
                <textcolor>{{ theme.colors.text_inv }}</textcolor>
                <info>MusicPlayer.Artist</info>
            </control>
            <control type="label">
                <posx>53</posx>
                <posy>{{ vscale(72) }}</posy>
                <width>187</width>
                <height>{{ vscale(20) }}</height>
                <font>font10</font>
                <align>left</align>
                <aligny>center</aligny>
                <textcolor>{{ theme.colors.text_inv }}</textcolor>
                <info>MusicPlayer.Title</info>
            </control>
        </control>

        <control type="progress">
            <description>Progressbar</description>
            <posx>0</posx>
            <posy>{{ vscale(102) }}</posy>
            <width>240</width>
            <height>{{ vscale(1) }}</height>
            <texturebg colordiffuse="9AFFFFFF">script.plex/white-square-1px.png</texturebg>
            <lefttexture>-</lefttexture>
            <midtexture colordiffuse="{{ theme.colors.accent_alt }}">script.plex/white-square-1px.png</midtexture>
            <righttexture>-</righttexture>
            <overlaytexture>-</overlaytexture>
            <info>Player.Progress</info>
        </control>
    </control>
    {% block filteropts_grouplist %}
    <control type="grouplist"{% block filteropts_grouplist_attrs %} id="600"{% endblock %}>
        <visible>String.IsEmpty(Window.Property(hide.filteroptions))</visible>
        <visible>!Integer.IsGreater(Container(101).ListItem.Property(index),{% block hide_filter_from_index %}5{% endblock %}) + String.IsEmpty(Window.Property(no.content)) + !String.IsEmpty(Window.Property(initialized))</visible>
        <animation effect="slide" time="200" end="0,{{ vscale(-115) }}" tween="quadratic" easing="out" condition="Integer.IsGreater(Container(101).ListItem.Property(index),{% block hide_filter_from_index %}5{% endblock %}) + String.IsEmpty(Window.Property(content.filling))">Conditional</animation>
        {% block filteropts_animation %}
            <animation effect="fade" start="0" end="100" time="200" reversible="true">VisibleChange</animation>
        {% endblock %}
        <right>{% if theme.plx %}100{% else %}170{% endif %}</right>
        <posy>{{ vscale(135) }}</posy>
        <width>1000</width>
        <height>{{ vscale(65) }}</height>
        <align>right</align>
        <itemgap>{% if theme.plx %}14{% else %}30{% endif %}</itemgap>
        <orientation>horizontal</orientation>
        <onleft condition="String.IsEmpty(Window.Property(no.content.filtered))">304</onleft>
        <onleft condition="!String.IsEmpty(Window.Property(no.content.filtered))">200</onleft>
        <onright>151</onright>
        <ondown>101</ondown>
        <onup>200</onup>
        <control type="button" id="311">
            <enable>false</enable>
            <width max="300">auto</width>
            <height>{{ vscale(65) }}</height>
            <font>font12</font>
            <textcolor>{{ theme.colors.text }}</textcolor>
            <focusedcolor>{{ theme.colors.text }}</focusedcolor>
            <disabledcolor>{{ theme.colors.text }}</disabledcolor>
            <align>center</align>
            <aligny>center</aligny>
            <texturefocus>-</texturefocus>
            <texturenofocus>-</texturenofocus>
            <textoffsetx>0</textoffsetx>
            <textoffsety>0</textoffsety>
            <label>{% if theme.plx %}$INFO[Window.Property(filter2.display)]{% else %}[UPPERCASE]$INFO[Window.Property(filter2.display)][/UPPERCASE]{% endif %}</label>
        </control>
        <control type="button" id="211">
            <width max="500">auto</width>
            <height>{{ vscale(65) }}</height>
            <font>font12</font>
            <textcolor>{{ theme.colors.text }}</textcolor>
            <focusedcolor>{{ theme.colors.text_on_focus }}</focusedcolor>
            <align>center</align>
            <aligny>center</aligny>
            {% if theme.plx %}
            <texturefocus colordiffuse="{{ theme.colors.focus }}" border="32">script.plex/plx/pill.png</texturefocus>
            <texturenofocus colordiffuse="{{ theme.colors.glass }}" border="32">script.plex/plx/pill.png</texturenofocus>
            {% else %}
            <texturefocus colordiffuse="{{ theme.colors.focus }}" border="10">script.plex/white-square-rounded.png</texturefocus>
            <texturenofocus>-</texturenofocus>
            {% endif %}
            <textoffsetx>{% if theme.plx %}28{% else %}20{% endif %}</textoffsetx>
            <textoffsety>0</textoffsety>
            <label>{% if theme.plx %}$INFO[Window.Property(filter1.display)]{% else %}[UPPERCASE]$INFO[Window.Property(filter1.display)][/UPPERCASE]{% endif %}</label>
        </control>
        <control type="button" id="310">
            <visible>!String.IsEqual(Window.Property(media),artist)</visible>
            <enable>false</enable>
            <width max="300">auto</width>
            <height>{{ vscale(65) }}</height>
            <font>font12</font>
            <textcolor>{{ theme.colors.text }}</textcolor>
            <focusedcolor>{{ theme.colors.text }}</focusedcolor>
            <disabledcolor>{{ theme.colors.text }}</disabledcolor>
            <align>center</align>
            <aligny>center</aligny>
            <texturenofocus>-</texturenofocus>
            <texturenofocus>-</texturenofocus>
            <textoffsetx>{% if theme.plx %}28{% else %}20{% endif %}</textoffsetx>
            <textoffsety>0</textoffsety>
            <label>{% if theme.plx %}$INFO[Window.Property(media.type)]{% else %}[UPPERCASE]$INFO[Window.Property(media.type)][/UPPERCASE]{% endif %}</label>
        </control>
        <control type="button" id="312">
            <visible>String.IsEqual(Window.Property(media),artist)</visible>
            <width max="300">auto</width>
            <height>{{ vscale(65) }}</height>
            <font>font12</font>
            <textcolor>{{ theme.colors.text }}</textcolor>
            <focusedcolor>{{ theme.colors.text_on_focus }}</focusedcolor>
            <disabledcolor>{{ theme.colors.text }}</disabledcolor>
            <align>center</align>
            <aligny>center</aligny>
            {% if theme.plx %}
            <texturefocus colordiffuse="{{ theme.colors.focus }}" border="32">script.plex/plx/pill.png</texturefocus>
            <texturenofocus colordiffuse="{{ theme.colors.glass }}" border="32">script.plex/plx/pill.png</texturenofocus>
            {% else %}
            <texturefocus colordiffuse="{{ theme.colors.focus }}" border="10">script.plex/white-square-rounded.png</texturefocus>
            <texturenofocus>-</texturenofocus>
            {% endif %}
            <textoffsetx>{% if theme.plx %}28{% else %}20{% endif %}</textoffsetx>
            <textoffsety>0</textoffsety>
            <label>{% if theme.plx %}$INFO[Window.Property(media.type)]{% else %}[UPPERCASE]$INFO[Window.Property(media.type)][/UPPERCASE]{% endif %}</label>
        </control>
        <control type="button" id="210">
            <width max="300">auto</width>
            <height>{{ vscale(65) }}</height>
            <font>font12</font>
            <textcolor>{{ theme.colors.text }}</textcolor>
            <focusedcolor>{{ theme.colors.text_on_focus }}</focusedcolor>
            <align>center</align>
            <aligny>center</aligny>
            {% if theme.plx %}
            <texturefocus colordiffuse="{{ theme.colors.focus }}" border="32">script.plex/plx/pill.png</texturefocus>
            <texturenofocus colordiffuse="{{ theme.colors.glass }}" border="32">script.plex/plx/pill.png</texturenofocus>
            {% else %}
            <texturefocus colordiffuse="{{ theme.colors.focus }}" border="10">script.plex/white-square-rounded.png</texturefocus>
            <texturenofocus>-</texturenofocus>
            {% endif %}
            <textoffsetx>{% if theme.plx %}28{% else %}20{% endif %}</textoffsetx>
            <textoffsety>0</textoffsety>
            <label>{% if theme.plx %}$INFO[Window.Property(sort.display)]{% else %}[UPPERCASE]$INFO[Window.Property(sort.display)][/UPPERCASE]{% endif %}</label>
        </control>
    </control>
    {% endblock filteropts_grouplist %}
    {% if not theme.plx %}
    <control type="label">
        <right>213</right>
        <posy>{{ vscale(35) }}</posy>
        <width>200</width>
        <height>{{ vscale(65) }}</height>
        <font>font12</font>
        <align>right</align>
        <aligny>center</aligny>
        <textcolor>{{ theme.colors.text }}</textcolor>
        <label>$INFO[System.Time]</label>
    </control>
    <control type="image">
        <posx>153r</posx>
        <posy>{{ vscale(47.5) }}</posy>
        <width>93</width>
        <height>{{ vscale(43) }}</height>
        <texture>script.plex/home/plex.png</texture>
    </control>
    {% endif %}
</control>

{% block no_content %}
<control type="group">
    <visible>!String.IsEmpty(Window.Property(no.content))</visible>
    <posx>0</posx>
    <posy>{{ vscale(465) }}</posy>
    <control type="label">
        <scroll>false</scroll>
        <posx>60</posx>
        <posy>0</posy>
        <width>1800</width>
        <height>{{ vscale(35) }}</height>
        <font>font13</font>
        <align>center</align>
        <textcolor>{{ theme.colors.text }}</textcolor>
        <label>[B]$ADDON[script.plexmod 32452][/B]</label>
    </control>
    <control type="label">
        <scroll>false</scroll>
        <posx>60</posx>
        <posy>{{ vscale(60) }}</posy>
        <width>1800</width>
        <height>{{ vscale(35) }}</height>
        <font>font13</font>
        <align>center</align>
        <textcolor>FFCCCCCC</textcolor>
        <label>$ADDON[script.plexmod 32453]</label>
    </control>
</control>

<control type="group">
    <visible>!String.IsEmpty(Window.Property(no.content.filtered))</visible>
    <posx>0</posx>
    <posy>{{ vscale(465) }}</posy>
    <control type="label">
        <scroll>false</scroll>
        <posx>60</posx>
        <posy>0</posy>
        <width>1800</width>
        <height>{{ vscale(35) }}</height>
        <font>font13</font>
        <align>center</align>
        <textcolor>{{ theme.colors.text }}</textcolor>
        <label>[B]$ADDON[script.plexmod 32454][/B]</label>
    </control>
    <control type="label">
        <scroll>false</scroll>
        <posx>60</posx>
        <posy>{{ vscale(60) }}</posy>
        <width>1800</width>
        <height>{{ vscale(35) }}</height>
        <font>font13</font>
        <align>center</align>
        <textcolor>FFCCCCCC</textcolor>
        <label>$ADDON[script.plexmod 32455]</label>
    </control>
</control>

<control type="group">
    <visible>!String.IsEmpty(Window.Property(search.dialog))</visible>
    <control type="group" >
        <visible>!String.IsEmpty(Window.Property(search.dialog.hasresults))</visible>
        <control type="image">
            <posx>0</posx>
            <posy>0</posy>
            <width>1920</width>
            <height>1080</height>
            <texture>script.plex/home/background-fallback.png</texture>
        </control>
        <control type="image">
            <posx>0</posx>
            <posy>0</posy>
            <width>1920</width>
            <height>1080</height>
            <texture background="true">$INFO[Window.Property(background)]</texture>
        </control>
    </control>
    <control type="image">
        <posx>0</posx>
        <posy>0</posy>
        <width>1920</width>
        <height>1080</height>
        <texture colordiffuse="99606060">script.plex/white-square.png</texture>
    </control>
</control>
{% endblock %}
{% endblock header %}