#!/usr/bin/env python
import glob
import subprocess
import yaml
import os
out = open('index.html', 'w')


out.write("""<!DOCTYPE HTML>
<html>
    <head>
        <link rel="stylesheet" href="https://hexylena.galaxians.org/hexylena.css/hexylena-i.css">
        <link rel="icon" type="image/x-icon" href="../favicon.png">
        <style>table img { max-width: 500px; }a img{width: 30%;}</style>
    </head>
    <body>
        <main class="container">
        <h1>hexylena's thesis' art</h1>
        <p>Helena's favourite reviews<br/>
        <i>"Woah the style here is sexy as hell, in a kind of Arcane bloody, deadly, sharp kind of way"</i> -M<br/>
        <i>"color palette: anarchy"</i> -N<br/>
        <i>"can you change the background to the same white as the paper white? Why aren't these draft images final versions? Fix your text in inkscape Helena"</i> -D<br/>
        </p>
        <h2>Cover</h2>
        Model: MidJourney v4<br/><br/>

        <table>
            <thead>
                <tr>
                    <th>Front</th>
                    <th>Back</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img src="cover-front.png"></td>
                    <td><img src="cover-back.png"></td>
                </tr>
                <tr>
                    <td><i><b>magic server computer in a server room, DNA and genomes, double helix,</b> ink, minimalist aesthetic white background, black and red</i>. Font is <a href="https://github.com/hodefoting/0xA000/">0xA000</a></td>
                    <td><i><b>witch in the server room,</b> ink, white background black and red minimalist</i></td>
                </tr>
            </tbody>
        </table>
        <h2>Chapters</h2>
""")

def imageTable(paths, final, caption):
    r = f"<figure>"
    for image in paths:
        if '_small.png' in image:
            continue

        try:
            image.index(final)
            extra = "style=\"outline:5px solid black; z-index: 3; position: relative;\""
        except (ValueError, TypeError):
            extra = ""

        thumb = image + "_small.png"
        r += f"<a href=\"{image}\"><img src=\"{thumb}\" width=220 {extra}/></a>"

        if not os.path.exists(thumb):
            print(f"Generating thumb: {image}")
            subprocess.check_call(['convert', '-resize', '220x', image, thumb])

    r += f"<figcaption>{caption}</figcaption></figure>"
    return r

def selectMatching(images, prompt):
    p = prompt.replace(" ", "_").replace(",", "").replace("!", "").replace(":", "").replace("(", "").replace(")", "")
    non_thumbs = [x for x in images if '_small.png' not in x]
    matches = [i for i in non_thumbs if i.split('/')[1][len('hexylena_'):-41] in p]
    if len(matches) == 0:
        print(f"no matches for {p}")

    return matches


def important(text):
    styleA = "ink, white background, red and black minimalist"
    styleB = "ink, white background, black and red minamalist"
    if styleA in text:
        t = text.split(styleA, 1)
        return f"<b>{t[0]}</b> {styleA}{t[1]}"
    elif styleB in text:
        t = text.split(styleB, 1)
        return f"<b>{t[0]}</b> {styleB}{t[1]}"
    else:
        return text


for folder in sorted(glob.glob("*")):
    if not os.path.isdir(folder):
        continue
    print(f"processing {folder}")

    with open(os.path.join(folder, 'meta.yaml'), 'r') as handle:
        data = yaml.safe_load(handle)

    if data['doi']:
        doi = data['doi']
        out.write(f"<h2><a href=\"https://dx.doi.org/{doi}\">{data['title']}</a></h2>")
    else:
        out.write(f"<h2>{data['title']} (Manuscript In Preparation)</h2>")

    out.write(f"Model: MidJourney v4<br/><br/>")

    if 'prompt' in data:
        images = glob.glob(os.path.join(folder, '*.png'))
        out.write(imageTable(images, data['final'], important(prompt)))
    else:
        images = glob.glob(os.path.join(folder, '*.png'))
        for prompt in data['prompts']:
            selected = selectMatching(images, prompt)
            out.write(imageTable(selected, data['final'], important(prompt)))


out.write("</main></body></html>")
