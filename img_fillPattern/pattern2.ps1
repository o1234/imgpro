$SRS=$args[0]

$depCity1=$args[1]
$arrCity1=$args[2]
$price1=$args[3]

$depCity2=$args[4]
$arrCity2=$args[5]
$price2=$args[6]

$depCity3=$args[7]
$arrCity3=$args[8]
$price3=$args[9]

$depCity4=$args[10]
$arrCity4=$args[11]
$price4=$args[12]

$depCity5=$args[13]
$arrCity5=$args[14]
$price5=$args[15]

$depCity6=$args[16]
$arrCity6=$args[17]
$price6=$args[18]

$Dst=$args[19]

$output=$Dst+$depCity1+'_'+$depCity2+'_'+$depCity3+'_'+$depCity4+'_'+$depCity5+'_'+$depCity6+'.jpg'
Write-Host $output
#config
$delta_W=308
$delta_H=165

## line 1
$W1=388
$H1=414
$pointsize1=50
$font="C:/Users/sonia.wang/Pictures/fonts/cutiweiruanyahei.ttf"
$tmp=$Dst+"tmp.jpg"
convert $SRS -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity1`'`" $tmp
$W2=538
$H2=414
$pointsize2=50
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity1`'`" $tmp
$W3=448
$H3=475
$pointsize3=65
$font="C:/Users/sonia.wang/Pictures/fonts/arialbd.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#e42f38" -draw `"text $W3`,$H3 `'$price1`'`" $tmp

$W1=$W1+$delta_W
$H1=$H1
$pointsize1=50
$font="C:/Users/sonia.wang/Pictures/fonts/cutiweiruanyahei.ttf"
convert $tmp -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity2`'`" $tmp
$W2=$W2+$delta_W
$H2=$H2
$pointsize2=50
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity2`'`" $tmp
$W3=$W3+$delta_W
$H3=$H3
$pointsize3=65
$font="C:/Users/sonia.wang/Pictures/fonts/arialbd.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#e42f38" -draw `"text $W3`,$H3 `'$price2`'`" $tmp

$W1=$W1+$delta_W
$H1=$H1
$pointsize1=50
$font="C:/Users/sonia.wang/Pictures/fonts/cutiweiruanyahei.ttf"
convert $tmp -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity3`'`" $tmp
$W2=$W2+$delta_W
$H2=$H2
$pointsize2=50
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity3`'`" $tmp
$W3=$W3+$delta_W
$H3=$H3
$pointsize3=65
$font="C:/Users/sonia.wang/Pictures/fonts/arialbd.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#e42f38" -draw `"text $W3`,$H3 `'$price3`'`" $tmp

##line2

$W1=$W1
$H1=$H1+$delta_H
$pointsize1=50
$font="C:/Users/sonia.wang/Pictures/fonts/cutiweiruanyahei.ttf"
convert $tmp -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity6`'`" $tmp
$W2=$W2
$H2=$H2+$delta_H
$pointsize2=50
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity6`'`" $tmp
$W3=$W3
$H3=$H3+$delta_H
$pointsize3=65
$font="C:/Users/sonia.wang/Pictures/fonts/arialbd.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#e42f38" -draw `"text $W3`,$H3 `'$price6`'`" $tmp

$W1=$W1-$delta_W
$H1=$H1
$pointsize1=50
$font="C:/Users/sonia.wang/Pictures/fonts/cutiweiruanyahei.ttf"
convert $tmp -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity5`'`" $tmp
$W2=$W2-$delta_W
$H2=$H2
$pointsize2=50
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity5`'`" $tmp
$W3=$W3-$delta_W
$H3=$H3
$pointsize3=65
$font="C:/Users/sonia.wang/Pictures/fonts/arialbd.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#e42f38" -draw `"text $W3`,$H3 `'$price5`'`" $tmp

$W1=$W1-$delta_W
$H1=$H1
$pointsize1=50
$font="C:/Users/sonia.wang/Pictures/fonts/cutiweiruanyahei.ttf"
convert $tmp -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity4`'`" $tmp
$W2=$W2-$delta_W
$H2=$H2
$pointsize2=50
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity4`'`" $tmp
$W3=$W3-$delta_W
$H3=$H3
$pointsize3=65
$font="C:/Users/sonia.wang/Pictures/fonts/arialbd.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#e42f38" -draw `"text $W3`,$H3 `'$price4`'`" $output