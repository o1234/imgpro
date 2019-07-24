$top=$args[0]
$left=$args[1]
$right=$args[2]
$Dst=$args[3]

convert .\backgroud_620.jpg -gravity north -compose over $top -composite ./tmp.jpg
convert ./tmp.jpg -gravity southwest -compose over $left  -composite ./tmp.jpg
convert ./tmp.jpg -gravity southeast -compose over $right  -composite $Dst

#convert .\backgroud_620.jpg -gravity south -compose over $top -composite ./tmp.jpg
#convert ./tmp.jpg -gravity northwest -compose over $left  -composite ./tmp.jpg
#convert ./tmp.jpg -gravity northeast -compose over $right  -composite $Dst