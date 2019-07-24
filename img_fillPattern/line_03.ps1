if ($args.Length -ne 4){
    Write-Host "line_03.ps1 params length error: left|right_1|right_2|Dst"   
    exit
}

$left=$args[0]
$right_1=$args[1]
$right_2=$args[2]
$Dst=$args[3]

convert .\backgroud_620.jpg -gravity northwest -compose over $left -composite ./tmp.jpg
convert ./tmp.jpg -gravity northeast -compose over $right_1  -composite ./tmp.jpg
convert ./tmp.jpg -gravity southeast -compose over $right_2  -composite $Dst