{% extends "library.xml.tpl" %}
{% block filteropts_grouplist %}
<control type="grouplist" id="600">
    <visible>String.IsEmpty(Window.Property(hide.filteroptions))</visible>
    <visible>!Integer.IsGreater(Container(101).ListItem.Property(index),{% block hide_filter_from_index %}5{% endblock %}) + String.IsEmpty(Window.Property(no.content)) + !String.IsEmpty(Window.Property(initialized))</visible>
    <animation effect="slide" time="200" end="0,{{ vscale(-115) }}" tween="quadratic" easing="out" condition="Integer.IsGreater(Container(101).ListItem.Property(index),{% block hide_filter_from_index %}5{% endblock %}) + String.IsEmpty(Window.Property(content.filling))">Conditional</animation>
    {% block filteropts_animation %}
        <animation effect="fade" start="0" end="100" time="200" reversible="true">VisibleChange</animation>
    {% endblock %}
    <right>{% if theme.plx %}100{% else %}170{% endif %}</right>
    <posy>{{ vscale(135) }}</posy>
    <width>870</width>
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
        <visible>!String.IsEqual(Window.Property(media.itemType),folder)</visible>
        <enable>false</enable>
        <width max="300">auto</width>
        <height>{{ vscale(65) }}</height>
        <font>font10</font>
        <textcolor>{{ theme.colors.text_a0 }}</textcolor>
        <focusedcolor>A0FFFFFF</focusedcolor>
        <disabledcolor>A0FFFFFF</disabledcolor>
        <align>center</align>
        <aligny>center</aligny>
        <texturefocus>-</texturefocus>
        <texturenofocus>-</texturenofocus>
        <textoffsetx>0</textoffsetx>
        <textoffsety>0</textoffsety>
        <label>{% if theme.plx %}$INFO[Window.Property(filter2.display)]{% else %}[UPPERCASE]$INFO[Window.Property(filter2.display)][/UPPERCASE]{% endif %}</label>
    </control>
    <control type="button" id="211">
        <visible>!String.IsEqual(Window.Property(media.itemType),folder)</visible>
        <width max="400">auto</width>
        <height>{{ vscale(65) }}</height>
        <font>font10</font>
        <textcolor>{{ theme.colors.text_a0 }}</textcolor>
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
        <visible>String.IsEqual(Window.Property(subDir),1) | ![String.IsEqual(Window.Property(media),show) | String.IsEqual(Window.Property(media),movie) | String.IsEqual(Window.Property(media),movies_shows)]</visible>
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
        <visible>!String.IsEqual(Window.Property(subDir),1) + [String.IsEqual(Window.Property(media),show) | String.IsEqual(Window.Property(media),movie) | String.IsEqual(Window.Property(media),movies_shows)]</visible>
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
        <visible>!String.IsEqual(Window.Property(media.itemType),folder)</visible>
        <width max="300">auto</width>
        <height>{{ vscale(65) }}</height>
        <font>font10</font>
        <textcolor>{{ theme.colors.text_a0 }}</textcolor>
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