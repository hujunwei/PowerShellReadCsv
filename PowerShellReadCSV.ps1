$P = Import-Csv AccessibilityBugsCsv.csv
<# $P | Format-Table #>
<# $P | measure 
$P.Count #>

<# $P.Title2 | ForEach-Object {
    $title2 = $_
    $found = $title2 -match '(\d+\.)?(\d+\.)?(\*|\d+)' 
    if ($found) {
        $matches[0]
    }
} > VersionNumbers.csv #>
$Output = @()

ForEach ($r in $P) {
    $found = $r."Title 2" -match '(\d+\.)?(\d+\.)?(\*|\d+)' 
    <# if ($found) {
        $matches[0]
    }#>
    <#Write-Output "$($r.Id), $($r.Title2), $($matches[0])"#>


    $ProcessedRow = New-Object -TypeName PSObject
    Add-Member -type NoteProperty -name ID -Value $r.Id -InputObject $ProcessedRow
    Add-Member -type NoteProperty -name "Work Item Type" -Value $r."Work Item Type" -InputObject $ProcessedRow
    Add-Member -type NoteProperty -name "Title 1" -Value $r."Title 1" -InputObject $ProcessedRow
    Add-Member -type NoteProperty -name "Title 2" -Value $r."Title 2" -InputObject $ProcessedRow
    Add-Member -type NoteProperty -name "Title 3" -Value $r."Title 3" -InputObject $ProcessedRow
    Add-Member -type NoteProperty -name "State" -Value $r."State" -InputObject $ProcessedRow
    Add-Member -type NoteProperty -name "Assigned To" -Value $r."Assigned To" -InputObject $ProcessedRow
    Add-Member -type NoteProperty -name "Remaining Work" -Value $r."Remaining Work" -InputObject $ProcessedRow 
    Add-Member -type NoteProperty -name "Tags" -Value $r."Tags" -InputObject $ProcessedRow  
    Add-Member -type NoteProperty -name VerisonNumber -Value $matches[0] -InputObject $ProcessedRow
    $Output += $ProcessedRow
}

$Output | Export-Csv -Path 12345.csv