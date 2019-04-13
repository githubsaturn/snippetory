# FROM: https://gist.github.com/robinst/ad2244f092c5241f06f563cf44d3336f

# Get releases for your repository (change the URL and add user/password if necessary)
# If there's more than one page, you might have to do more requests with `?page=2` etc
curl https://api.github.com/repos/:owner/:repo/releases > releases.json

# Use jq! https://stedolan.github.io/jq/
# "v" is a prefix to strip from the release names, might not be necessary
jq -r '.[] | "## [" + (.name | ltrimstr("v")) + "] - " + .created_at[:10] + "\n" + .body' releases.json >> CHANGELOG.md

# Now edit the CHANGELOG.md, see here: http://keepachangelog.com/en/1.0.0/
