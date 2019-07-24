$SRS=$args[0]
$Dst=$args[1]
$slogon=$args[6]

convert -resize 1280x620! $SRS $SRS

#特价机票
$W=$args[2]
$H=$args[3]
$pointsize=$args[4]
convert $SRS -font .\cutiweiruanyahei.ttf -pointsize $pointsize -fill white -draw "text $W,$H '特价机票'" $Dst


$W_=$W
$pointsize_=$pointsize*0.5
$H_=$H+$pointsize_+$pointsize*0.2 

#SUMMER TRAVEL 方框
$W_t=$W_-$pointsize_*1.5
$H_t=$H_-$pointsize_
$W_e=$W_t+$pointsize_*11.5
$H_e=$H_t+$pointsize_+5
convert $Dst -fuzz 100% -fill "rgba(36,81,122,0.5)" -draw "rectangle $W_t,$H_t $W_e,$H_e" $Dst
#SUMMER TRAVEL
convert $Dst -font .\times.ttf -pointsize $pointsize_ -fill white -draw "text $W_,$H_ 'SUMMER TRAVEL'" $Dst


#点击出发方框
$pointsize_d=$pointsize*0.6
$distance=$args[5]
$W_d_t=$W_t+$pointsize_d*1.8
$H_d_t=$H_t+$distance
$W_d_e=$W_d_t+$pointsize_d*5
$H_d_e=$H_d_t+$pointsize_d*1.2
convert $Dst -fill white -stroke none -strokewidth 2 -draw "rectangle $W_d_t,$H_d_t $W_d_e,$H_d_e" $Dst

#点击出发
$W_d=$W_d_t+$pointsize_d*0.5
$H_d=$H_d_t+$pointsize_d
convert $Dst -fill "#1b3858" -font .\simhei.ttf -pointsize $pointsize_d -draw "text $W_d,$H_d '点击出发'" $Dst

#景点slogon
$W_view=$W
$H_view=$H-$pointsize-5
$pointsize_view=$pointsize*0.5

convert $Dst -font .\simhei.ttf -pointsize $pointsize_view -fill white -draw "text $W_view,$H_view `'$slogon`'" $Dst

convert .\logo\logo_mobile_200_200H.png ./res/$city`.$format -gravity west -append ./res/result_$city`.$format