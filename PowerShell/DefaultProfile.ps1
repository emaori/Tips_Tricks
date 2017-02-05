Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
Import-Module .\posh-git

Import-Module Go

Import-Module psgoogle

Import-Module powerls

#Import-Module posh-svn

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
# Import-Module posh-git

# Function to Get Custom Directory path (thanks Prateek Singh - https://geekeefy.wordpress.com/2016/10/19/powershell-customize-directory-path-in-ps-prompt/)
Function Get-CustomDirectory
{
    [CmdletBinding()]
    [Alias("CDir")]
    [OutputType([String])]
    Param
    (
        [Parameter(ValueFromPipeline=$true,Position=0)]
        $Path = $PWD.Path
    )
    
    Begin
    {
        $desktop = "C:\Users\" + $env:USERNAME+"\Desktop"
        
        #Custom directories as a HashTable
        $CustomDirectories = @{

            $env:TEMP                                   ='Temp'
            $env:HOME                                   ='HOME'
            "C:\customers\Android\onemediahub"          ='OMH'
        } 
    }
    Process
    {
        Foreach($Item in $Path)
        {
            $Match = ($CustomDirectories.GetEnumerator().name | ?{$Item -eq "$_" -or $Item -like "$_*"} |`
            select @{n='Directory';e={$_}},@{n='Length';e={$_.length}} |sort Length -Descending |select -First 1).directory
            If($Match)
            {
                [String]($Item -replace [regex]::Escape($Match),("["+$CustomDirectories[$Match]+"]"))            
            }
            ElseIf($pwd.Path -ne $Item)
            {
                $Item
            }
            Else
            {
                $pwd.Path
            }
        }
    }
    End
    {
    }
}


# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {

    $cdelim = [ConsoleColor]::Green

    #$host.UI.RawUI.WindowTitle = "All Shell"

    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    Write-Host("[" + $env:UserName + "@" + $env:COMPUTERNAME + "] ") -nonewline -f $cdelim
    Write-Host $(Get-CustomDirectory) -ForegroundColor DarkYellow -nonewline

    Write-VcsStatus

    # Insert new line
    Write-Host ""

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

Enable-GitColors

Pop-Location

Set-Alias -Name lc -Value PowerLS -Option AllScope
Set-Alias -Name np -Value notepad -Option AllScope
Set-Alias -Name g -Value git -Option AllScope
Set-Alias -Name studio -Value "C:\Program Files\Android\Android Studio\bin\studio64.exe" -Option AllScope

function pwdd {
    $pwd.Path
}

function studio-here {
    studio $pwd.Path
}

Start-SshAgent -Quiet
