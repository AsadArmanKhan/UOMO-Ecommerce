$totalCommits = 200
$startDate = (Get-Date).AddDays(-90)
$today = Get-Date

for ($i = 1; $i -le $totalCommits; $i++) {
    $randomDays = Get-Random -Minimum 0 -Maximum ((New-TimeSpan -Start $startDate -End $today).Days)
    $commitDate = $startDate.AddDays($randomDays).ToString("yyyy-MM-ddTHH:mm:ss")

    git commit --allow-empty -m "Fake historical commit #$i" --date="$commitDate"
}

git push origin main
