$SRS=$args[0]
$img1=$args[1]
$img2=$args[2]
$img3=$args[3]
$Dst=$args[4]

$tmp1=$Dst+'img_tmp1.jpg'
$tmp2=$Dst+'img_tmp2.jpg'
$tmp3=$Dst+'img_tmp3.jpg'
$tmp = $Dst+'img_tmp.jpg'

$imgpath = $SRS.Split("/")[-1] 
$output = $Dst+'output/'+ $imgpath
convert -resize 378x342! $img1 $tmp1
convert -resize 290x342! $img2 $tmp2
convert -resize 680x342! $img3 $tmp3

convert $SRS -compose over $tmp1 -geometry +12+12 -composite $tmp
convert $tmp -compose over $tmp2 -geometry +402+12 -composite $tmp
convert $tmp -compose over $tmp3 -geometry +12+366 -composite $output 