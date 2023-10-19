# Definir nombres de programas a desinstalar
$programs = "Compatibility Pack for the 2007 Office System", "Microsoft Office Excel Viewer", "Microsoft Office Word Viewer 2003", "Microsoft PowerPoint Viewer"

foreach ($program in $programs) {
    # Buscar el programa en la lista de programas instalados
    $uninstallKey = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*$program*" }
    
    if ($uninstallKey -ne $null) {
        # Desinstalar el programa si se encontró en la lista
        Write-Host "Desinstalando $program..."
        $uninstallKey.Uninstall()
        Write-Host "$program desinstalado."
    } else {
        Write-Host "$program no encontrado."
    }
}

Write-Host "Desinstalación completa."
