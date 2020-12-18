function Set-RandomEPWallpaper {
    $DownloadPath = "C:\Windows\Temp\" 
    $results = Invoke-RestMethod -uri "https://www.reddit.com/r/earthporn/hot.json?limit=100"
    $postList = $results.data.children
    $post = $postList[(Get-Random -Maximum $postList.count)]
    $imageURL = [uri]$post.data.url
    Invoke-WebRequest -uri $imageURL.AbsoluteUri -OutFile (Join-Path -Path $DownloadPath -ChildPath "EPWallpaper")
    Set-WallPaper -Image "C:\Windows\Temp\EPWallpaper" -Style "Fit"
}