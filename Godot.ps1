

Function Wait-ForGodot
{
    param
    (
        [int]$Act,
        [switch]$TestMode
    )

    $filelines = gc .\text\act1.txt 


    $filelines | % {

            $_
    }




}

Function Invoke-SlackMessage
{
     [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [string[]] $message,
        [string] $fallback,
        [string] $channel = '#godot',
        [string] $username,
        [string] $col 
    )
    $config = Load-Config
    $slackUri = $env:godothookurl

    if(!$fallback)
    {
        $fallback = $message
    }

    $payload = @{
        text = "text"
        username = "godotbot"
    }

    Write-Verbose "Paging Slack with message $message"
    Write-Verbose "Sending message"
    Invoke-Restmethod -Method POST -Body ($payload | ConvertTo-Json -Depth 4) -Uri $slackUri | Out-Null
}

Invoke-SlackMessage -message "message"