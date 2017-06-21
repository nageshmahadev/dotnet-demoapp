## Simple .NET Core ASP web application

Based on the standard .NET Core template (`dotnet new mvc`). Kestrel is set to listen on 0.0.0.0:5000. This makes it possible to be run inside a container.

Some minor cosmetic modifications have been to the basic generated app, but otherwise it's pretty much as it comes. The 'About' page displays some system basic information (OS, platform, IP address etc) and should detect if the app is running as a container or not.
The other addition is the inclusion of the App Insights SDK, so if configured with an instrumentation key, monitoring data can be gathered and sent to Application Insights

<img src="https://user-images.githubusercontent.com/14982936/27382739-115620fe-5680-11e7-9cf9-0e1ff845cad7.png" alt="screenshot" style="width: 800px;"/>

## Dockerfile Notes
Three versions of the Dockerfile are provided.

- [**Dockerfile**](Dockerfile) - Default, assumes the app has already been published into binaries, into a sub directory named './pub' (e.g. with `dotnet publish -o pub`) prior to running "docker build". Typically used in conjunction with VSTS build tasks. 
- [**Dockerfile.windows**](Dockerfile.windows) - Same as default file above, but uses aspnetcore Nanoserver image as base, making it a Windows container. 
- [**Dockerfile.build**](Dockerfile.build) - This carries out the full .NET Core restore, build & publish steps as part of the build of the Docker image. This is done with a different source image 'aspnetcore-build' and two RUN commands invoked in the Dockerfile. This is handy to use when you don't have a build server or a system without the SDK available. 

## Docker Images
Public Docker images are [available on Dockerhub](https://hub.docker.com/r/bencuk/dotnet-demoapp/) in both Linux (Ubuntu) and Windows (Nanoserver) formats

## Updates
* June 2017 - Changed design and wording, support for Windows containers & improved Docker detection
* Feb 2017 - Updated to .NET Core 1.1
* March 2017 - Total overhaul to .NET Core SDK 1.0, using csproj and new MVC template
