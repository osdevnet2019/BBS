EXS=exams
HWS=homeworks
OUT=h+e
set -x
>$OUT

round() {
  printf "%.${2}f" "${1}"
}

while read line
do
  NAME=`echo $line | awk {' print $1 '}`
  GRDE=`echo $line | awk {' print $4 '}`
  GRDH=`cat $HWS | grep $NAME | awk {' print $4 '}`
  
  GRD0=`echo "($GRDE * 0.4 + $GRDH * 0.6)" | bc -l`
  GRD1=`echo "$GRD0/2" | bc -l`
  ROUNDED=$(round $GRD1 0)
  echo "$NAME    $ROUNDED" >> $OUT

done < $EXS
