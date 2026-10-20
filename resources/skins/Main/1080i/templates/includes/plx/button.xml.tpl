{# plx round glass icon button (white filled pill for "play" at the default size). Same params as themed_button #}
{% with gw = attr.width|default(180) & gh = attr.height|default(145) %}
{% if gw == 126 %}{% with d = 64 %}{% include "includes/plx/button_inner.xml.tpl" %}{% endwith %}
{% else %}{% with d = 88 %}{% include "includes/plx/button_inner.xml.tpl" %}{% endwith %}{% endif %}
{% endwith %}
