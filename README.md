# Mindron AI Worker Release

Public release repository for the Mindron AI Windows Worker Agent.

This repo is intentionally small. It is for installer/release distribution only.
The full worker source lives in the private/internal worker repository.

## Install On Windows PC

Run PowerShell as Administrator:

```powershell
irm https://raw.githubusercontent.com/mindronserver/AI_Worker_Release/main/install-latest.ps1 | iex
```

Custom install:

```powershell
$env:MINDRON_SERVER_URL="http://192.168.1.82:18080"
$env:MINDRON_WORKER_NAME="OFFICE-PC-NAME"
$env:MINDRON_WORKER_TYPE="office_pc"
$env:MINDRON_BASE_PORT="15100"
$env:MINDRON_MAX_INSTANCES="1"
irm https://raw.githubusercontent.com/mindronserver/AI_Worker_Release/main/install-latest.ps1 | iex
```

## What It Installs

- Mindron AI Worker Agent
- auto-start scheduled task
- worker repository under `C:\Mindron\apps\ai-marking-worker`
- Python virtual environment
- CUDA PyTorch wheel for NVIDIA GPUs

## Latest Release

The rolling release tag is:

```text
windows-agent-latest
```

Release asset:

```text
MindronAiWorkerAgent-windows.zip
```

## Security

A newly installed worker must be approved by the Mindron AI server/dashboard before it can receive jobs.
Unknown workers should never receive job images or work assignments.
