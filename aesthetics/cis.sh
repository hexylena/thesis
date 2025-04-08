for i in {1..9}; do
	inkscape cis.svg --export-filename=cis/$i.png --select $i --actions='selection-unhide'
done

for i in {1..9}; do
	for j in {1..9}; do
		inkscape cis.svg --export-filename=cis/$j$i.png --select $i,${j}0 --actions='selection-unhide'
	done
done


for i in {1..9}; do
	for j in {1..9}; do
		inkscape cis.svg --export-filename=cis/1$j$i.png --select 100,$i,${j}0 --actions='selection-unhide'
	done
done
