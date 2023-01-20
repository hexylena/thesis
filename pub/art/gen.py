#!/usr/bin/env python
import glob
import yaml
import os
out = open('index.html', 'w')


out.write("""<!DOCTYPE HTML>
<html>
    <head>
        <link rel="stylesheet" href="pico.min.css">
    </head>
    <body>
        <main class="container">
        <h1>hexylena's Thesis Art</h1>
""")

def imageTable(paths, final):
    r = f"<figure><table><tr>"
    for image in paths:
        try:
            image.index(final)
            extra = "style=\"border:10px solid red\""
        except (ValueError, TypeError):
            extra = ""
        r += f"<a href=\"{image}\"><img src=\"{image}\" width=200 {extra}/></a>"
    r += f"</tr></figure></table>"
    return r

def selectMatching(images, prompt):
    p = prompt.replace(" ", "_")
    return [i for i in images if i.split('/')[1][len('hexylena_'):-41] in p]


def important(text):
    style = "ink, white background, red and black minimalist"
    t = text.split(style, 1)
    return f"<b>{t[0]}</b> {style}{t[1]}"


for folder in glob.glob("*"):
    if not os.path.isdir(folder):
        continue

    with open(os.path.join(folder, 'meta.yaml'), 'r') as handle:
        data = yaml.safe_load(handle)
    doi = data['doi']

    out.write(f"<h2><a href=\"https://dx.doi.org/{doi}\">{data['title']}</a></h2>")

    out.write(f"Model: MidJourney v4<br/><br/>")

    if 'prompt' in data:
        out.write(f"<i>{important(data['prompt'])}</i>")
        images = glob.glob(os.path.join(folder, '*.png'))
        out.write(imageTable(images, data['final']))
    else:
        images = glob.glob(os.path.join(folder, '*.png'))
        for prompt in data['prompts']:
            out.write(f"<i>{important(prompt)}</i>")
            selected = selectMatching(images, prompt)
            out.write(imageTable(selected, data['final']))


out.write("</main></body></html>")
