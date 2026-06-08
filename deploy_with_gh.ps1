$ErrorActionPreference = "Stop"

$Owner = "MrLiuYX"
$Repo = "mrliuyx.github.io"
$FullName = "$Owner/$Repo"
$SiteUrl = "https://$Repo/"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
  throw "GitHub CLI (gh) is not installed. Install it first, then run: gh auth login"
}

gh auth status | Out-Null

if (-not (Test-Path ".git")) {
  git init
}

$repoExists = $true
gh repo view $FullName *> $null
if ($LASTEXITCODE -ne 0) {
  $repoExists = $false
}

if (-not $repoExists) {
  gh repo create $FullName --public --source . --remote origin --push
} else {
  git remote remove origin 2>$null
  git remote add origin "https://github.com/$FullName.git"
}

git add index.html .nojekyll README.md deploy_with_gh.ps1

if (-not (git diff --cached --quiet)) {
  git commit -m "Create personal GitHub Pages site"
}

$branch = git branch --show-current
if (-not $branch) {
  $branch = "main"
  git checkout -B main
}

git push -u origin $branch

Write-Host "Published files to $FullName"
Write-Host "GitHub Pages user site URL: $SiteUrl"
