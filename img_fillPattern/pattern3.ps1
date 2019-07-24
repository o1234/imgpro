$SRS=$args[0]

$depCity1=$args[1]
$arrCity1=$args[2]
$discount1=$args[3]
$price1=$args[4]

$depCity2=$args[5]
$arrCity2=$args[6]
$discount2=$args[7]
$price2=$args[8]

$depCity3=$args[9]
$arrCity3=$args[10]
$discount3=$args[11]
$price3=$args[12]

$depCity4=$args[13]
$arrCity4=$args[14]
$discount4=$args[15]
$price4=$args[16]

$depCity5=$args[17]
$arrCity5=$args[18]
$discount5=$args[19]
$price5=$args[20]

$depCity6=$args[21]
$arrCity6=$args[22]
$discount6=$args[23]
$price6=$args[24]

$Dst=$args[25]

$output=$Dst+$depCity1+'_'+$depCity2+'_'+$depCity3+'_'+$depCity4+'_'+$depCity5+'_'+$depCity6+'.jpg'

#config
$ini_W=750
$ini_H=95
$delta_H=117


## line1
$W1=$ini_W
$H1=$ini_H-5
$pointsize1=48
$font="C:/Users/sonia.wang/Pictures/fonts/msyh.ttc"
$tmp=$Dst+"tmp.jpg"
Write-Host $tmp
convert $SRS -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity1`'`" $tmp
$W2=$ini_W+190
$H2=$ini_H-5
$pointsize2=48
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity1`'`" $tmp
$W3=$ini_W+120
$H3=$ini_H+3
$pointsize3=23
$discount1='{0:n1}' -f $discount1
$discount1=$discount1+'折'
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W3`,$H3 `'$discount1`'`" $tmp
$W4=$ini_W+340-5*$price1/100*0.1*$price1/100
$H4=$ini_H
$pointsize3=70
$font="C:/Users/sonia.wang/Pictures/fonts/impact.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W4`,$H4 `'$price1`'`" $tmp


#line2
$W1=$W1
$H1=$H1+$delta_H
$pointsize1=48
$font="C:/Users/sonia.wang/Pictures/fonts/msyh.ttc"
convert $tmp -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity2`'`" $tmp
$W2=$W2
$H2=$H2+$delta_H
$pointsize2=48
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity2`'`" $tmp
$W3=$W3
$H3=$H3+$delta_H
$pointsize3=23
$discount2='{0:n1}' -f $discount2
$discount2=$discount2+'折'
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W3`,$H3 `'$discount2`'`" $tmp
$W4=$ini_W+340-5*$price2/100*0.1*$price2/100
$H4=$H4+$delta_H
$pointsize3=70
$font="C:/Users/sonia.wang/Pictures/fonts/impact.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W4`,$H4 `'$price2`'`" $tmp

#line3
$W1=$W1
$H1=$H1+$delta_H
$pointsize1=48
$font="C:/Users/sonia.wang/Pictures/fonts/msyh.ttc"
convert $tmp -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity3`'`" $tmp
$W2=$W2
$H2=$H2+$delta_H
$pointsize2=48
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity3`'`" $tmp
$W3=$W3
$H3=$H3+$delta_H
$pointsize3=23
$discount3='{0:n1}' -f $discount3
$discount3=$discount3+'折'
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W3`,$H3 `'$discount3`'`" $tmp
$W4=$ini_W+340-5*$price3/100*0.1*$price3/100
$H4=$H4+$delta_H
$pointsize3=70
$font="C:/Users/sonia.wang/Pictures/fonts/impact.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W4`,$H4 `'$price3`'`" $tmp

#line4
$W1=$W1
$H1=$H1+$delta_H
$pointsize1=48
$font="C:/Users/sonia.wang/Pictures/fonts/msyh.ttc"
convert $tmp -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity4`'`" $tmp
$W2=$W2
$H2=$H2+$delta_H
$pointsize2=48
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity4`'`" $tmp
$W3=$W3
$H3=$H3+$delta_H
$pointsize3=23
$discount4='{0:n1}' -f $discount4
$discount4=$discount4+'折'
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W3`,$H3 `'$discount4`'`" $tmp
$W4=$ini_W+340-5*$price4/100*0.1*$price4/100
$H4=$H4+$delta_H
$pointsize3=70
$font="C:/Users/sonia.wang/Pictures/fonts/impact.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W4`,$H4 `'$price4`'`" $tmp


#line5
$W1=$W1
$H1=$H1+$delta_H
$pointsize1=48
$font="C:/Users/sonia.wang/Pictures/fonts/msyh.ttc"
convert $tmp -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity5`'`" $tmp
$W2=$W2
$H2=$H2+$delta_H
$pointsize2=48
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity5`'`" $tmp
$W3=$W3
$H3=$H3+$delta_H
$pointsize3=23
$discount5='{0:n1}' -f $discount5
$discount5=$discount5+'折'
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W3`,$H3 `'$discount5`'`" $tmp
$W4=$ini_W+340-5*$price5/100*0.1*$price5/100
$H4=$H4+$delta_H
$pointsize3=70
$font="C:/Users/sonia.wang/Pictures/fonts/impact.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W4`,$H4 `'$price5`'`" $tmp


#line6
$W1=$W1
$H1=$H1+$delta_H
$pointsize1=48
$font="C:/Users/sonia.wang/Pictures/fonts/msyh.ttc"
convert $tmp -font $font -pointsize $pointsize1 -fill "#141412" -draw `"text $W1`,$H1 `'$depCity6`'`" $tmp
$W2=$W2
$H2=$H2+$delta_H
$pointsize2=48
convert $tmp -font $font -pointsize $pointsize2 -fill "#141412" -draw `"text $W2`,$H2 `'$arrCity6`'`" $tmp
$W3=$W3
$H3=$H3+$delta_H
$pointsize3=23
$discount6='{0:n1}' -f $discount6
$discount6=$discount6+'折'
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W3`,$H3 `'$discount6`'`" $tmp
$W4=$ini_W+340-5*$price6/100*0.1*$price6/100
$H4=$H4+$delta_H
$pointsize3=70
$font="C:/Users/sonia.wang/Pictures/fonts/impact.ttf"
convert $tmp -font $font -pointsize $pointsize3 -fill "#c51d1d" -draw `"text $W4`,$H4 `'$price6`'`" $output
