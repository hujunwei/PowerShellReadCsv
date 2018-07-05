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
    $found = $r.Title2 -match '(\d+\.)?(\d+\.)?(\*|\d+)' 
    <# if ($found) {
        $matches[0]
    }#>
    <#Write-Output "$($r.Id), $($r.Title2), $($matches[0])"#>


    $ProcessedRow = New-Object -TypeName PSObject
    Add-Member -type NoteProperty -name ID -Value $r.Id -InputObject $ProcessedRow
    Add-Member -type NoteProperty -name Title -Value $r.Title2 -InputObject $ProcessedRow
    Add-Member -type NoteProperty -name VerisonNumber -Value $matches[0] -InputObject $ProcessedRow
    $Output += $ProcessedRow
}

$Output | Export-Csv -Path 12345.csv