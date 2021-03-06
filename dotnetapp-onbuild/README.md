dotnetapp-onbuild Sample
========================

The dotnetapp-onbuild sample demonstrates basic "hello world" usage of .NET Core. It relies on the Docker [ONBUILD](https://docs.docker.com/engine/reference/builder/#onbuild) pattern to simplify the creation of .NET Core Docker images. This sample is recommended only for learning .NET Core and Docker. It isn't intended for production.

Script
------

Follow these steps to try out this sample. The instructions are intended to be Operating System agnostic, unless called out. They assume that you already have [Git](https://git-scm.com/downloads) and [Docker](https://www.docker.com/products/docker) clients installed.

**Preparing your Environment**

1. Git clone this repository or otherwise copy this sample to your machine: `git clone https://github.com/dotnet/docker-samples/`
2. Navigate to this sample on your machine at the command prompt or terminal.

**Build and run Docker image**

1. Build the Docker image
   - Commandline for Mac and Linux: `docker build -t dotnetapp .`
   - Commandline for Windows to build a Nano image: `docker build -t dotnetapp -f Dockerfile.nano .`
2. Run the application in the container: `docker run dotnetapp Hello .NET Core from Docker`
