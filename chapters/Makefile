montage.png: platform-front.png training-front.png cancer-front.png annotation-front.png platform-back.png training-back.png cancer-back.png annotation-back.png
	montage -resize 50% platform-front.png training-front.png cancer-front.png annotation-front.png platform-back.png training-back.png cancer-back.png annotation-back.png -geometry +0+0 montage.png

platform-front.png training-front.png cancer-front.png annotation-front.png platform-back.png training-back.png cancer-back.png annotation-back.png: platform-front.svg training-front.svg cancer-front.svg annotation-front.svg platform-back.svg training-back.svg cancer-back.svg annotation-back.svg
	inkscape --export-type=png --export-dpi=200 --export-area-page *.svg
