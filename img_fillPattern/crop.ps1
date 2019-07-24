
function crop
{
    $SRS=$args[0]
    $format=$args[1]
    $off_w=$args[2]
    $off_h=$args[3]
    $fix_=$args[4]

    $W=identify -format '%w' $SRS`.$format
    $H=identify -format '%h' $SRS`.$format
    if($fix_ -eq 0){
        Write-Host "fix_: "+$fix_
        $imgr=identify -format '%[fx:w/h]' $SRS`.$format
        if ($imgr -ge 3.5){
            $nW=4*$H
            $nH=$H
            $index=4
        }elseif($imgr -ge 1.5){
            $nW=2*$H
            $nH=$H
            $index=2
        }elseif($imgr -ge 0.835){
            $nW=$H
            $nH=$H
            $index=1
        }elseif($Imgr -ge 0.6){
            $nW=0.67*$H
            $nH=$H
            $index=0.67
        }else{
            $index=error
            Write-Error "too small img"
        }
    }else{
        Write-Host "fix_: "$fix_
        if($fix_*$H -ge $W){
            $nH=$W/$fix_
            $nW=$W
        }else{
            $nW=$fix_*$H
            $nH=$H
        }
        
        $index=$fix_
    }

    $Dst=$SRS+'_'+$index+'.'+$format

    if( ($off_w -$nW/2) -le 0 ){
        $off_w = $nW/2 
    }elseif(($W - $off_W - $nW/2 ) -le 0){
        $off_w = $W - $nW/2
    }
    if( ($off_h -$nH/2) -le 0 ){
        $off_h = $nH/2 
    }elseif(($H - $off_H - $nH/2 ) -le 0){
        $off_h = $H - $nH/2
    }

    $off_W = $off_W - $nW/2
    $off_H = $off_H - $nH/2

    Write-Host $off_w
    Write-Host $off_h
    convert -crop $nW`x$nH`+$off_w`+$off_h $SRS`.$format $Dst
    identify $Dst
    return $Dst
}

$SRS=$args[0]
$format=$args[1]
$off_w=$args[2]
$off_h=$args[3]
$fix_=$args[4]

crop $SRS $format $off_w $off_h $fix_