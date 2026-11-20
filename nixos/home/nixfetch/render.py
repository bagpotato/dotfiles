import sys, math
import numpy as np
from PIL import Image, ImageOps

src, out = sys.argv[1], sys.argv[2]
FRAMES = 30
COLS, ROWS = 36, 18          # tamaño final en celdas (cada celda = 1x2 píxeles)
SS = 8                        # supersampling
D = 3.0                       # distancia de cámara (perspectiva)

img = Image.open(src).convert("RGBA")
side = max(img.size)
sq = Image.new("RGBA", (side, side), (0, 0, 0, 0))
sq.paste(img, ((side - img.width) // 2, (side - img.height) // 2))
img = sq
img = img.resize((COLS * SS, COLS * SS), Image.LANCZOS)

# Recolorear a rosas claros según luminosidad, conservando el alpha
alpha = img.getchannel("A")
gray = ImageOps.autocontrast(img.convert("L"))
pink = ImageOps.colorize(gray, black="#ff8fb5", white="#ffe0ea").convert("RGBA")
pink.putalpha(alpha)
base = pink

def coeffs(dst, srcp):
    A = []
    for (x, y), (u, v) in zip(dst, srcp):
        A.append([x, y, 1, 0, 0, 0, -u * x, -u * y])
        A.append([0, 0, 0, x, y, 1, -v * x, -v * y])
    A = np.array(A, dtype=float)
    B = np.array(srcp, dtype=float).reshape(8)
    return np.linalg.solve(A, B)

N = COLS * SS
half = N / 2
frames = []
for f in range(FRAMES):
    th = 2 * math.pi * f / FRAMES
    c, s = math.cos(th), math.sin(th)
    dst = []
    for (x, y) in [(-1, -1), (1, -1), (1, 1), (-1, 1)]:
        z = x * s
        k = D / (D - z)
        dst.append((half + x * c * k * half * 0.85, half + y * k * half * 0.85))
    srcp = [(0, 0), (N, 0), (N, N), (0, N)]
    cf = coeffs(dst, srcp)
    fr = base.transform((N, N), Image.PERSPECTIVE, tuple(cf), Image.BICUBIC)
    fr = fr.convert("RGBa").resize((COLS, ROWS * 2), Image.LANCZOS).convert("RGBA")
    px = np.array(fr)
    lines = []
    for r in range(ROWS):
        out_l = []
        for col in range(COLS):
            t = px[2 * r, col]; b = px[2 * r + 1, col]
            ta, ba = t[3] > 60, b[3] > 60
            if ta and ba:
                out_l.append("\x1b[38;2;%d;%d;%d;48;2;%d;%d;%dm▀" % (*t[:3], *b[:3]))
            elif ta:
                out_l.append("\x1b[49;38;2;%d;%d;%dm▀" % tuple(t[:3]))
            elif ba:
                out_l.append("\x1b[49;38;2;%d;%d;%dm▄" % tuple(b[:3]))
            else:
                out_l.append("\x1b[0m ")
        lines.append("".join(out_l) + "\x1b[0m")
    frames.append("\n".join(lines))

with open(out, "w") as fh:
    fh.write("\0".join(frames) + "\0")
print("ok", len(frames), "frames")
