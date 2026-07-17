$ErrorActionPreference = "Stop"
Set-Location (Split-Path $PSScriptRoot -Parent)
$env:GRAPHIFY_VIZ_NODE_LIMIT = "0"
graphify update .
