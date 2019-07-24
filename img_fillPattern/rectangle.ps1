if ($args.Length -ne 5){
    Write-Host "rectangle.ps1 params length error: w|h|r|city|format|"   
    exit
}

$W=$args[0]
$H=$args[1]
$R=$args[2]
$MASK="mask_"+$args[3]+".png"
$format=$args[4]
$SRC='./res/'+$args[3]+'.'+$args[4]
$TMP_PNG='tmp_'+$args[3]+'.png'
$Dst_PNG='png_'+$args[3]+'.png'
$Dst_JPG='./res/'+$args[3]+'.jpg'
#write-host convert $SRC -matte $MASK -compose DstIn -composite $TMP_PNG
convert -size $W`x$H xc:none -draw `"roundrectangle 0,0,$W,$H,$R,$R`" $MASK
convert $SRC -matte $MASK -compose DstIn -composite $TMP_PNG
convert $TMP_PNG -background white -flatten $Dst_PNG
convert $Dst_PNG $Dst_JPG