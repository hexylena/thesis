import sys


def y_mm(x):
    # ŷ = 0.05631x + 0.60417
    y = round(100 * ((0.05631 * x) + 0.6041)) / 100.0
    sys.stderr.write(f"Spine: {y}")
    return y

def guide(mm):
    return f"""
    <sodipodi:guide
       position="{mm},0"
       orientation="-1,0"
       id="guide3"
       inkscape:locked="false"
       inkscape:label=""
       inkscape:color="rgb(0,134,229)" />
   """

width = [0, 172, y_mm(181), 172, 64]
guides = []

s = 0
for x in width:
    # Update offset
    s += x

    guides.append(guide(s))



guides = ''.join(guides)

svg = f"""
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->
<svg
   width="{s}mm" height="244mm"
   viewBox="0 0 418.17999 244" version="1.1"
   id="svg1" inkscape:version="1.4 (e7c3feb100, 2024-10-09)"
   sodipodi:docname="omslag2.svg"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  <sodipodi:namedview
     id="namedview1"
     pagecolor="#ffffff"
     bordercolor="#000000"
     borderopacity="0.25"
     inkscape:showpageshadow="2"
     inkscape:pageopacity="0.0"
     inkscape:pagecheckerboard="0"
     inkscape:deskcolor="#d1d1d1"
     inkscape:document-units="mm"
     showguides="true"
     inkscape:zoom="0.54740759"
     inkscape:cx="648.51129"
     inkscape:cy="505.10809"
     inkscape:window-width="1912"
     inkscape:window-height="1024"
     inkscape:window-x="4"
     inkscape:window-y="52"
     inkscape:window-maximized="1"
     inkscape:current-layer="layer1">
    {guides}
  </sodipodi:namedview>
  <defs
     id="defs1" />
  <g
     inkscape:label="Layer 1"
     inkscape:groupmode="layer"
     id="layer1" />
</svg>
"""
print(svg)
