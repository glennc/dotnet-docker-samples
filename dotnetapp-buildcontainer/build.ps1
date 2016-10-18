
param(
    [ValidateSet('win', 'linux')]
    [string]$baseImage = "win"
)

# Capture the current build and app image, if any, so that we can clean them up when we are done.
$currentBuildImage=$(docker images build-image -q)
$currentAppImage=$(docker images dockerapp -q)

if($baseImage -eq "win") {
    docker build -t build-image -f Dockerfile.win.build .
} else {
    docker build -t build-image -f Dockerfile.build .
}

# Create a container from our build image so that we can copy the contents out.
docker create --name build-container build-image
# Copy the contents of the /out directory out so that we can build our app image.
docker cp build-container:/out ./out

if($baseImage -eq "win") {
    # Build the application image.
    docker build -t dockerapp -f Dockerfile.win .
} else {
    docker build -t dockerapp .
}

docker rm build-container
Remove-Item -Recurse .\out

if($currentBuildImage) {
    docker rmi $currentBuildImage
}

if($currentAppImage) {
    docker rmi $currentAppImage
}