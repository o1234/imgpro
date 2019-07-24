if ($args.Length -ne 4){
    Write-Host "append.ps1 params length error: img|Dst|w|h"   
    exit
}

$img = $args[0]
$Dst = $args[1]
$W=$args[2]
$H=$args[3]

Write-Host convert -resize $W`x$H! $img $Dst
convert -resize $W`x$H! $img $Dst
identify $Dst
