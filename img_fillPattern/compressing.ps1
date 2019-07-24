$input=$args[0]
$output=$args[1]
Write-Host $input
Write-Host $output
$pre=$input
Get-ChildItem $input | ForEach-Object -Process{
if($_ -is [System.IO.FileInfo])
{
#Write-Host $input
#Write-Host($_.name); #$input == $_.name 
$path_in=$pre+$_.name
$path_out=$output+$_.name
Write-Host $path_in
Write-Host $path_out
convert $path_in -define jpeg:extent=80kb $path_out
}
}