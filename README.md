# MrLiuYX Personal Website

This is the static GitHub Pages site for `https://mrliuyx.github.io/`.

## Files

- `index.html` - complete one-page personal universe website
- `.nojekyll` - tells GitHub Pages to publish the files as-is
- `deploy_with_gh.ps1` - optional Windows deployment helper

## Deploy

Create a public repository named `mrliuyx.github.io` under the `MrLiuYX` account, then place these files at the repository root.

If GitHub CLI is installed and authenticated, run:

```powershell
.\deploy_with_gh.ps1
```

GitHub Pages will publish from the default branch root for a user site repository.
