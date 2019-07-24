if ($args.Length -ne 4){
    Write-Host "line_00.ps1 params length error: left|center|right|Dst"   
    exit
}

$left=$args[0]
$center=$args[1]
$right=$args[2]
$Dst=$args[3]

convert .\backgroud_620.jpg -gravity west -compose over $left -composite ./tmp.jpg
convert ./tmp.jpg -gravity center -compose over $center  -composite ./tmp.jpg
convert ./tmp.jpg -gravity east -compose over $right  -composite $Dst