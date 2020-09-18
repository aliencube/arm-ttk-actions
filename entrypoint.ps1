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

cd ./arm-ttk/arm-ttk

# Get-ChildItem *.ps1, *.psd1, *.ps1xml, *.psm1 -Recurse | Unblock-File

Import-Module ./arm-ttk.psd1

cd /

$command = "Test-AzTemplate -TemplatePath $Path"
if ($Files.Count -gt 0)
{
    $command &= " -File $Files"
}
if ($Tests.Count -gt 0)
{
    $command &= " -Test $Tests"
}
if ($Skips.Count -gt 0)
{
    $command &= " -Skip $Skips"
}

Invoke-Expression "& $command"
