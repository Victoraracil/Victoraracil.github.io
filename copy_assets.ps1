# Script para copiar assets desde la raíz del proyecto hacia la carpeta 'github'
# Úsalo desde la carpeta 'github' o ejecuta desde la raíz con: & .\github\copy_assets.ps1

$sourceRoot = Resolve-Path ".."  # asume que el script está en /github
$destRoot = Get-Location

Write-Output "Copiando archivos desde $($sourceRoot) hacia $($destRoot) ..."

# Archivos individuales
$itemsToCopy = @("logo.jpg", "cv.pdf")
foreach ($item in $itemsToCopy) {
    $src = Join-Path $sourceRoot $item
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination $destRoot -Force
        Write-Output "Copiado: $item"
    } else {
        Write-Output "No encontrado (se omite): $item"
    }
}

# Directorios (style y assets)
$dirsToCopy = @("style", "assets")
foreach ($d in $dirsToCopy) {
    $srcDir = Join-Path $sourceRoot $d
    $destDir = Join-Path $destRoot $d
    if (Test-Path $srcDir) {
        Copy-Item -Path $srcDir -Destination $destRoot -Recurse -Force
        Write-Output "Copiado directorio: $d"
    } else {
        Write-Output "No encontrado (se omite): $d"
    }
}

Write-Output "Operación finalizada."