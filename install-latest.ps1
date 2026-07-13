$ErrorActionPreference = "Stop"

$repo = "mindronserver/AI_Worker_Release"
$tag = "windows-agent-latest"
$asset = "MindronAiWorkerAgent-windows.zip"
$temp = Join-Path $env:TEMP "MindronAiWorkerInstall"
$zip = Join-Path $temp $asset
$extract = Join-Path $temp "extract"

New-Item -ItemType Directory -Force $temp | Out-Null
Remove-Item -Recurse -Force $extract -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force $extract | Out-Null

$downloadUrl = "https://github.com/$repo/releases/download/$tag/$asset"
Write-Host "Downloading $downloadUrl" -ForegroundColor Cyan
Invoke-WebRequest -Uri $downloadUrl -OutFile $zip
Expand-Archive -Path $zip -DestinationPath $extract -Force

$serverUrl = if ($env:MINDRON_SERVER_URL) { $env:MINDRON_SERVER_URL } else { "http://192.168.1.82:6969" }
$workerName = if ($env:MINDRON_WORKER_NAME) { $env:MINDRON_WORKER_NAME } else { $env:COMPUTERNAME }
$workerType = if ($env:MINDRON_WORKER_TYPE) { $env:MINDRON_WORKER_TYPE } else { "office_pc" }
$basePort = if ($env:MINDRON_BASE_PORT) { [int]$env:MINDRON_BASE_PORT } else { 15100 }
$maxInstances = if ($env:MINDRON_MAX_INSTANCES) { [int]$env:MINDRON_MAX_INSTANCES } else { 1 }

$installer = Join-Path $extract "install-windows-agent.ps1"
if (!(Test-Path $installer)) {
    throw "Installer not found in release package: $installer"
}

powershell -NoProfile -ExecutionPolicy Bypass -File $installer `
    -ServerUrl $serverUrl `
    -WorkerName $workerName `
    -WorkerType $workerType `
    -BasePort $basePort `
    -MaxInstances $maxInstances
