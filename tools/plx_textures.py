# coding=utf-8
"""
Generates the plx theme textures into resources/skins/Main/media/script.plex/plx/.
Everything is drawn from scratch: white shapes with alpha, tinted in the skin via colordiffuse.

    python tools/plx_textures.py
"""
import os

from PIL import Image, ImageDraw

OUT = os.path.join(os.path.dirname(__file__), "..", "resources", "skins", "Main", "media", "script.plex", "plx")
SS = 4  # supersampling factor for anti-aliased edges


def save(img, name):
    img.save(os.path.join(OUT, name), optimize=True)


def rounded(w, h, r, name, outline=0):
    big = Image.new("L", (w * SS, h * SS), 0)
    d = ImageDraw.Draw(big)
    d.rounded_rectangle((0, 0, w * SS - 1, h * SS - 1), radius=r * SS, fill=255)
    if outline:
        d.rounded_rectangle((outline * SS, outline * SS, w * SS - 1 - outline * SS, h * SS - 1 - outline * SS),
                            radius=max(r - outline, 0) * SS, fill=0)
    alpha = big.resize((w, h), Image.LANCZOS)
    img = Image.new("RGBA", (w, h), (255, 255, 255, 0))
    img.putalpha(alpha)
    save(img, name)


def ease(t):
    return t * t * (3 - 2 * t)


def gradient(w, h, vertical, name, reverse=False):
    n = h if vertical else w
    img = Image.new("RGBA", (w, h), (255, 255, 255, 0))
    px = img.load()
    for i in range(n):
        t = i / float(n - 1)
        a = int(round(255 * ease(1 - t if reverse else t)))
        for j in range(w if vertical else h):
            px[(j, i) if vertical else (i, j)] = (255, 255, 255, a)
    save(img, name)


def main():
    if not os.path.isdir(OUT):
        os.makedirs(OUT)
    # card masks, applied as <texture diffuse=...> on artwork
    rounded(488, 722, 28, "mask-poster.png")
    rounded(488, 488, 28, "mask-square.png")
    rounded(532, 299, 16, "mask-16x9.png")
    # 9-slice shapes: use with border="32" on controls about 64px high
    rounded(128, 64, 32, "pill.png")
    rounded(128, 64, 32, "pill-outline.png", outline=3)
    rounded(100, 100, 20, "card.png")
    # circle for avatars / round buttons
    rounded(256, 256, 128, "circle.png")
    rounded(256, 256, 128, "circle-outline.png", outline=4)
    # alpha ramps, tinted via colordiffuse: opaque at one edge, clear at the other
    gradient(4, 256, True, "scrim-up.png", reverse=False)    # clear at top, opaque at bottom
    gradient(4, 256, True, "scrim-down.png", reverse=True)   # opaque at top, clear at bottom
    gradient(256, 4, False, "scrim-left.png", reverse=True)  # opaque at left, clear at right


if __name__ == "__main__":
    main()
