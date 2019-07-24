$mode=$args[0]
$img1=$args[1]
$img2=$args[2]
$img3=$args[3]
$city=$args[4]
$format=$args[5]
$logo=$args[6]
$offset_W=$args[7]
$offset_H=$args[8]
if($mode -eq 0){
#0.67*3
    .\append.ps1 $img1 ./res/$img1 423 620
    .\append.ps1 $img2 ./res/$img2 423 620
    .\append.ps1 $img3 ./res/$img3 423 620
    .\line_00.ps1 ./res/$img1 ./res/$img2 ./res/$img3 ./res/$city`.$format
    .\rectangle.ps1 1280 620 20 $city $format 
    .\logo.ps1 $logo ./res/$city`.$format ./res/result_$city`.$format $offset_W $offset_H

}elseif($mode -eq 1){
#4*1 + 2*2
    .\append.ps1 $img1 ./res/$img1 1280 306
    .\append.ps1 $img2 ./res/$img2 636 306
    .\append.ps1 $img3 ./res/$img3 636 306
    .\line_01.ps1 ./res/$img1 ./res/$img2 ./res/$img3 ./res/$city`.$format
    .\rectangle.ps1 1280 620 20 $city $format 
    .\logo.ps1 $logo ./res/$city`.$format ./res/result_$city`.$format $offset_W $offset_H
}elseif($mode -eq 2){
#1*2
    .\append.ps1 $img1 ./res/$img1 639 639
    .\append.ps1 $img2 ./res/$img2 639 639
    .\line_02.ps1 ./res/$img1 ./res/$img2 ./res/$city`.$format
    .\rectangle.ps1 1280 620 20 $city $format 
    .\logo.ps1 $logo ./res/$city`.$format ./res/result_$city`.$format $offset_W $offset_H
     convert -crop 1280x620+0+0 -gravity center ./res/result_$city`.$format ./res/result_$city`.$format
}elseif($mode -eq 3){
#1*1 + 2*2
    .\append.ps1 $img1 ./res/$img1 620 620
    .\append.ps1 $img2 ./res/$img2 652 306
    .\append.ps1 $img3 ./res/$img3 652 306
    .\line_03.ps1 ./res/$img1 ./res/$img2 ./res/$img3 ./res/$city`.$format
    .\rectangle.ps1 1280 620 20 $city $format 
    .\logo.ps1 $logo ./res/$city`.$format ./res/result_$city`.$format $offset_W $offset_H
}elseif($mode -eq 4){
#0.9*3
    $W=396
    $H=480
    .\append.ps1 $img1 ./res/$img1 $W $H
    .\append.ps1 $img2 ./res/$img2 $W $H
    .\append.ps1 $img3 ./res/$img3 $W $H
    .\rectangle_easy.ps1 $W $H 20 ./res/$img1 ./res/$city`1`.$format
    .\rectangle_easy.ps1 $W $H 20 ./res/$img2 ./res/$city`2`.$format
    .\rectangle_easy.ps1 $W $H 20 ./res/$img3 ./res/$city`3`.$format
    .\line_04.ps1 ./res/$city`1`.$format ./res/$city`2`.$format ./res/$city`3`.$format ./res/$city`.$format
    #.\rectangle.ps1 1280 620 1 $city $format
    #.\logo.ps1 $logo ./res/$city`.$format ./res/result_$city`.$format $offset_W $offset_H
    #convert .\logo\logo_mobile_200_200H.png -background white -flatten .\logo\logo_mobile_200_200H.png
    convert .\logo\logo_mobile_200_200H.png ./res/$city`.$format -gravity west -append ./res/result_$city`.$format
}
identify ./res/result_$city`.$format
###  convert .\res\zh.jpg .\logo\logo_136_10width.png -gravity east -append .\res\result_zh.jpg