for i in {1..9}; do
	echo $i
	inkscape cis.svg --export-filename=cis/$i.png --select $i --actions='selection-unhide'
done


for j in {1..9}; do
	echo ${j}0
	inkscape cis.svg --export-filename=cis/${j}0.png --select ${j}0 --actions='selection-unhide'
done


for i in {1..9}; do
	for j in {1..9}; do
		echo ${j}${i}
		inkscape cis.svg --export-filename=cis/$j$i.png --select $i,${j}0 --actions='selection-unhide'
	done
done


echo 100
inkscape cis.svg --export-filename=cis/100.png --select 100 --actions='selection-unhide'
echo 200
inkscape cis.svg --export-filename=cis/200.png --select 200 --actions='selection-unhide'

for j in {1..9}; do
	echo 1${j}0
	inkscape cis.svg --export-filename=cis/1${j}0.png --select 100,${j}0 --actions='selection-unhide'
done

for i in {1..9}; do
	for j in {1..9}; do
		echo 1${j}${i}
		inkscape cis.svg --export-filename=cis/1$j$i.png --select 100,${j}0,$i --actions='selection-unhide'
	done
done

for i in {1..9}; do
	echo 10${i}
	inkscape cis.svg --export-filename=cis/10$i.png --select 100,$i --actions='selection-unhide'
done
