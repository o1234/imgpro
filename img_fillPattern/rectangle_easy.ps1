if ($args.Length -ne 5){
    Write-Host "rectangle.ps1 params length error: w|h|r|city|format|"   
    exit
}

$W=$args[0]
$H=$args[1]
$R=$args[2]
$MASK="mask_easy.png"
$TMP="mask_tmp.png"
$SRC=$args[3]
$Dst=$args[4]
#write-host convert $SRC -matte $MASK -compose DstIn -composite $TMP_PNG

convert -size $W`x$H xc:none -draw `"roundrectangle 0,0,$W,$H,$R,$R`" $MASK
convert $SRC -matte $MASK -compose DstIn -composite $TMP
convert $TMP -background "#00bcd4" -flatten $TMP
magick montage -background "#00bcd4" -geometry +20+20 $TMP $TMP
convert $TMP $Dst