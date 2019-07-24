if ($args.Length -ne 3){
    Write-Host "line_02.ps1 params length error: left|right|Dst"   
    exit
}

$left=$args[0]
$right=$args[1]
$Dst=$args[2]


convert .\backgroud_620.jpg -gravity northwest -compose over $left -composite ./tmp.jpg
convert ./tmp.jpg -gravity northeast -compose over $right_1  -composite ./tmp.jpg
convert ./tmp.jpg -gravity southeast -compose over $right_2  -composite $Dst