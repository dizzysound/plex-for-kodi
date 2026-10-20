{# round glass chip behind an icon button of the stock header. param: chip (id of the button) #}
<control type="image">
    <posx>0</posx>
    <posy>0</posy>
    <width>64</width>
    <height>{{ vscale(64) }}</height>
    <texture colordiffuse="{{ theme.colors.glass }}">script.plex/plx/circle.png</texture>
</control>
<control type="image">
    <visible>!Control.HasFocus({{ chip }})</visible>
    <posx>0</posx>
    <posy>0</posy>
    <width>64</width>
    <height>{{ vscale(64) }}</height>
    <texture colordiffuse="{{ theme.colors.glass_hi }}">script.plex/plx/circle-outline.png</texture>
</control>
<control type="image">
    <visible>Control.HasFocus({{ chip }})</visible>
    <posx>0</posx>
    <posy>0</posy>
    <width>64</width>
    <height>{{ vscale(64) }}</height>
    <texture colordiffuse="{{ theme.colors.focus }}">script.plex/plx/circle.png</texture>
</control>
