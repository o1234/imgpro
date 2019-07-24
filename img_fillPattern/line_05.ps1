function line_05{
    $SRS=$args[0]
    $slogon=$args[5]
    $city=$args[6]
    $format='jpg'
    $arrCity=$args[7]
    $depCity=$args[8]
    $discount=$args[9]
    $price=$args[10]
    $lenghOfdepCity=$args[11]
    $pre='C:/Users/sonia.wang/Pictures/'
    $Dst=$pre+"new/result_$city`.$format"

    convert -resize 1280x620! $SRS $SRS
    Write-Host "lenghOfdepCity=="
    Write-Host $args.Length
    Write-Host $args[11]

    #特价机票
    $W=$args[1]
    $H=$args[2]
    $pointsize=$args[3]
    convert $SRS -font $pre\fonts\cutiweiruanyahei.ttf -pointsize $pointsize -fill White -draw "text $W,$H '特价机票'" $Dst


    $W_=$W
    $pointsize_=$pointsize*0.5
    $H_=$H+$pointsize_+$pointsize*0.2 

    #SUMMER TRAVEL 方框
    $W_t=$W_-$pointsize_*1.5
    $H_t=$H_-$pointsize_
    $W_e=$W_t+$pointsize_*11.5
    $H_e=$H_t+$pointsize_+5
    #rgba(36,81,122,0.5) rgba(44,25,19,0.5)
    convert $Dst -fuzz 100% -fill "rgba(44,25,19,0.5)" -draw "rectangle $W_t,$H_t $W_e,$H_e" $Dst
    #SUMMER TRAVEL
    convert $Dst -font $pre\fonts\times.ttf -pointsize $pointsize_ -fill white -draw "text $W_,$H_ 'SUMMER TRAVEL'" $Dst


    #点击出发方框
    $pointsize_d=$pointsize*0.6
    $distance=$args[4]
    $W_d_t=$W_t+$pointsize_d*1.8
    $H_d_t=$H_t+$distance
    $W_d_e=$W_d_t+$pointsize_d*7+$lenghOfdepCity*$lenghOfdepCity*$pointsize_d*0.2
    $H_d_e=$H_d_t+$pointsize_d*1.2
    convert $Dst -fill white -stroke none -strokewidth 2 -draw "rectangle $W_d_t,$H_d_t $W_d_e,$H_d_e" $Dst

    #点击出发
    $W_d=$W_d_t+$pointsize_d*0.5
    $H_d=$H_d_t+$pointsize_d
    $text=$depCity+'  '+$price+'元起'
    convert $Dst -fill "#1b3858" -font $pre\fonts\simhei.ttf -pointsize $pointsize_d -draw "text $W_d,$H_d `'$text`'" $Dst

    $W_f=$W_d+$pointsize_d*$lenghOfdepCity
    $H_f=$H_d-$pointsize_d*0.8
    convert -resize $pointsize_d`x$pointsize_d $pre\flight.png $pre\new\flight.jpg
    convert $Dst -compose over $pre\new\flight.jpg -geometry `+$W_f`+$H_f -composite $pre/new/tmp.jpg

    #景点slogon
    $W_view=$W
    $H_view=$H-$pointsize-5
    $pointsize_view=$pointsize*0.5

    convert $pre/new/tmp.jpg -font $pre\fonts\simhei.ttf -pointsize $pointsize_view -fill "#2c1913" -draw "text $W_view,$H_view `'$slogon`'" $Dst

    Write-Host $Dst

    $output=$pre+'new/20190718/raw/'+$depCity+'_'+$arrCity+'_'+$discount+'_'+$price+'.'+$format
    $logo=$pre+'logo\logo_mobile_200_100H.png'
    Write-Host $output
    convert $logo $Dst -gravity west -append $output

    #identify $output
}

$SRS=$args[0]
$W=$args[1]
$H=$args[2]
$pointsize=$args[3]
$distance=$args[4]
$slogon=$args[5]
$city=$args[6]
$format='jpg'
$arrCity=$args[7]
$depCity=$args[8]
$discount=$args[9]
$price=$args[10]
$lenghOfdepCity=$args[11]

line_05 $SRS $W $H $pointsize $distance $slogon $city $arrCity $depCity $discount $price $lenghOfdepCity