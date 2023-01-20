#!/usr/bin/env python
import glob
import subprocess
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

def imageTable(paths, final):
    r = f"<figure><table><tr>"
    for image in paths:
        if '_small.png' in image:
            continue

        try:
            image.index(final)
            extra = "style=\"border:10px solid red\""
        except (ValueError, TypeError):
            extra = ""

        thumb = image + "_small.png"
        r += f"<a href=\"{image}\"><img src=\"{thumb}\" width=220 {extra}/></a>"

        if not os.path.exists(thumb):
            print(f"Generating thumb: {image}")
            subprocess.check_call(['convert', '-resize', '220x', image, thumb])

    r += f"</tr></figure></table>"
    return r

def selectMatching(images, prompt):
    p = prompt.replace(" ", "_").replace(",", "").replace("!", "").replace(":", "")
    non_thumbs = [x for x in images if '_small.png' not in x]
    return [i for i in non_thumbs if i.split('/')[1][len('hexylena_'):-41] in p]


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
