$input=$args[0]
$output=$args[1]
Write-Host $input
Write-Host $output
$pre=$input
$i=0
Get-ChildItem $input | ForEach-Object -Process{
if($_ -is [System.IO.FileInfo])
{
$i=$i+1
#Write-Host $input
#Write-Host($_.name); #$input == $_.name 
$path_in=$pre+$_.name
$path_out=$output+'image_'+$i+'.jpg'
Write-Host $path_in
Write-Host $path_out
convert $path_in $path_out
}
}