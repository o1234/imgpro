$SRS=$args[0]
$depCity=$args[1]
$arrCity=$args[2]
$discount=$args[3]
$price=$args[4]
$Dst=$args[5]

$discount='{0:n1}' -f $discount

$W1=180
$H1=555
$pointsize1=50
$font="C:/Users/sonia.wang/Pictures/fonts/cutiweiruanyahei.ttf"
$tmp=$Dst+"tmp.jpg"
convert $SRS -font $font -pointsize $pointsize1 -fill white -draw `"text $W1`,$H1 `'$depCity`'`" $tmp
$W2=350
$H2=555
$pointsize2=50
convert $tmp -font $font -pointsize $pointsize2 -fill white -draw `"text $W2`,$H2 `'$arrCity`'`" $tmp
$W3=468
$H3=562
$pointsize3=65
$output=$Dst+$depCity+'_'+$arrCity+'_'+$discount+'折_'+$price+'.jpg'
$font="C:/Users/sonia.wang/Pictures/fonts/arialbd.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#ffd800" -draw `"text $W3`,$H3 `'$discount`'`" $output