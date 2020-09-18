Param(
    [string]
    [Parameter(Mandatory=$true)]
    $Path,

    [string[]]
    $Files,

    [string[]]
    $Tests,

    [string[]]
    $Skips
)

Set-Location /arm-ttk/arm-ttk

# Get-ChildItem *.ps1, *.psd1, *.ps1xml, *.psm1 -Recurse | Unblock-File

Import-Module ./arm-ttk.psd1

Set-Location /

$command = "Test-AzTemplate -TemplatePath $env:GITHUB_WORKSPACE/$Path"
if (($Files -ne $null) -and ($Files.Length -gt 0))
{
    $command += " -File $Files"
}
if ($Tests.Length -gt 0)
{
    $command += " -Test $Tests"
}
if ($Skips.Length -gt 0)
{
    $command += " -Skip $Skips"
}

$results = Invoke-Expression "& $command"

$results

Write-Output "::set-output name=results::$results"
