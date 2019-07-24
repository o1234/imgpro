if ($args.Length -ne 4){
    Write-Host "line_04.ps1 params length error: left|right_1|right_2|Dst"   
    exit
}

$left=$args[0]
$center=$args[1]
$right=$args[2]
$Dst=$args[3]

convert .\backgroud_520_logo_blue.jpg -gravity southwest -compose over $left -composite ./tmp.jpg
convert ./tmp.jpg -gravity south -compose over $center  -composite ./tmp.jpg
convert ./tmp.jpg -gravity southeast -compose over $right  -composite $Dst