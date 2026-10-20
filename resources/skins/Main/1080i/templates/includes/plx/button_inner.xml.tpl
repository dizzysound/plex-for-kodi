{# params: attr, name, id, gw, gh, d. The play button of the big button rows is a labelled pill, the rest are round glass icons. #}
<control type="group" id="{{ id|calc(10000) }}">
    {% if visible %}<visible{% if allowhiddenfocus %} allowhiddenfocus="true"{% endif %}>{{ visible }}</visible>{% endif %}
    <width>{% if name == "play" and gw > 150 %}250{% else %}{{ gw }}{% endif %}</width>
    <height>{{ vscale(gh) }}</height>
    {% if name == "play" and gw > 150 %}
    <control type="image">
        <posx>25</posx>
        <posy>{{ gh|calc(d, "sub")|vscale|calc(2, "truediv") }}</posy>
        <width>200</width>
        <height>{{ vscale(d) }}</height>
        <texture border="32" colordiffuse="{{ theme.colors.accent_alt }}">script.plex/plx/pill.png</texture>
        <visible>!Control.HasFocus({{ id }})</visible>
    </control>
    <control type="image">
        <posx>25</posx>
        <posy>{{ gh|calc(d, "sub")|vscale|calc(2, "truediv") }}</posy>
        <width>200</width>
        <height>{{ vscale(d) }}</height>
        <texture border="32" colordiffuse="{{ theme.colors.focus }}">script.plex/plx/pill.png</texture>
        <visible>Control.HasFocus({{ id }})</visible>
    </control>
    <control type="image">
        <posx>0</posx>
        <posy>0</posy>
        <width>{{ gw }}</width>
        <height>{{ vscale(gh) }}</height>
        <texture colordiffuse="{{ theme.colors.text_on_focus }}">{{ theme.assets.buttons.base }}{{ name }}.png</texture>
    </control>
    <control type="label">
        <posx>108</posx>
        <posy>0</posy>
        <width>110</width>
        <height>{{ vscale(gh) }}</height>
        <aligny>center</aligny>
        <font>{{ font|default("font12") }}</font>
        <textcolor>{{ theme.colors.text_on_focus }}</textcolor>
        <label>$LOCALIZE[208]</label>
    </control>
    {% else %}
    <control type="image">
        <posx>{{ gw|calc(d, "sub")|calc(2, "truediv") }}</posx>
        <posy>{{ gh|calc(d, "sub")|vscale|calc(2, "truediv") }}</posy>
        <width>{{ d }}</width>
        <height>{{ vscale(d) }}</height>
        <texture colordiffuse="{{ theme.colors.glass }}">script.plex/plx/circle.png</texture>
        <visible>!Control.HasFocus({{ id }})</visible>
    </control>
    <control type="image">
        <posx>{{ gw|calc(d, "sub")|calc(2, "truediv") }}</posx>
        <posy>{{ gh|calc(d, "sub")|vscale|calc(2, "truediv") }}</posy>
        <width>{{ d }}</width>
        <height>{{ vscale(d) }}</height>
        <texture colordiffuse="{{ theme.colors.glass_hi }}">script.plex/plx/circle-outline.png</texture>
        <visible>!Control.HasFocus({{ id }})</visible>
    </control>
    <control type="image">
        <posx>{{ gw|calc(d, "sub")|calc(2, "truediv") }}</posx>
        <posy>{{ gh|calc(d, "sub")|vscale|calc(2, "truediv") }}</posy>
        <width>{{ d }}</width>
        <height>{{ vscale(d) }}</height>
        <texture colordiffuse="{{ theme.colors.focus }}">script.plex/plx/circle.png</texture>
        <visible>Control.HasFocus({{ id }})</visible>
    </control>
    {% endif %}
    <control type="button" id="{{ id }}">
        {% if enable %}<enable>{{ enable }}</enable>{% endif %}
        {% if hitrect %}<hitrect x="{{ hitrect.x|default(40) }}" y="{{ hitrect.y|default(40)|vscale }}" w="{{ hitrect.w|default(96) }}" h="{{ hitrect.h|default(60)|vscale }}" />{% endif %}
        {% if elements %}{% spaceless %}
            {% for var, value in elements %}<{{ var }}>{{ value }}</{{ var }}>{% endfor %}{% endspaceless %}
        {% endif %}
        {% for direction in ("onleft", "onright", "onup", "ondown") %}{% spaceless %}
            {% if resolve("direction") %}<{{ direction }}>{{ resolve("direction") }}</{{ direction }}>
            {% elif navids and direction == "onleft" and navids|plx_nav(id, -1, navl) %}<onleft>{{ navids|plx_nav(id, -1, navl) }}</onleft>
            {% elif navids and direction == "onright" and navids|plx_nav(id, 1, navr) %}<onright>{{ navids|plx_nav(id, 1, navr) }}</onright>
            {% elif navup and direction == "onup" %}<onup>{{ navup }}</onup>
            {% elif navdown and direction == "ondown" %}<ondown>{{ navdown }}</ondown>
            {% endif %}
        {% endspaceless %}{% endfor %}
        <posx>0</posx>
        <posy>0</posy>
        <width>{% if name == "play" and gw > 150 %}250{% else %}{{ gw }}{% endif %}</width>
        <height>{{ vscale(gh) }}</height>
        <font>{{ font|default("font12") }}</font>
        {% if name == "play" and gw > 150 %}
        <texturefocus colordiffuse="00FFFFFF">script.plex/white-square.png</texturefocus>
        <texturenofocus colordiffuse="00FFFFFF">script.plex/white-square.png</texturenofocus>
        <label> </label>
        {% else %}
        <texturefocus colordiffuse="{{ theme.colors.text_on_focus }}">{{ theme.assets.buttons.base }}{{ name }}{{ theme.assets.buttons.focusSuffix }}.png</texturefocus>
        <texturenofocus colordiffuse="{{ theme.colors.text }}">{{ theme.assets.buttons.base }}{{ name }}.png</texturenofocus>
        <label> </label>
        {% endif %}
    </control>
</control>
