$flagFile = "$env:TEMP\yasb_toggle_showdesktop.txt"

if (Test-Path $flagFile) {
    # 如果标志文件存在 -> 还原
    (New-Object -ComObject shell.application).UndoMinimizeAll()
    Remove-Item $flagFile
} else {
    # 否则最小化（显示桌面）
    (New-Object -ComObject shell.application).MinimizeAll()
    New-Item $flagFile -Force | Out-Null
}
