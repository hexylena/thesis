all: cell.pdf hospital.pdf world.pdf

%.pdf: %.svg
	inkscape --export-type=pdf --export-area-page --export-dpi=400 $<
