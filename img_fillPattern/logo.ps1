if ($args.Length -ne 5){
    Write-Host "logo.ps1 params length error: logo|SRS|Dst|w|h"   
    exit
}

$LOGO=$args[0]
$SRC=$args[1]
$Dst=$args[2]
$W=$args[3]
$H=$args[4]
Write-Host convert $SRC -compose over $LOGO -geometry +$W+$H -composite $Dst
convert $SRC -compose over $LOGO -geometry +$W+$H -composite $Dst
