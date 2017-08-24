## Simple .NET Core ASP web application

Based on the standard .NET Core 2.0 template (`dotnet new`). Kestrel is set to listen on `http://0.0.0.0:5000`. This makes it possible to be run inside a container. Uses Razor Pages instead of MVC

Some minor cosmetic modifications have been to the basic generated app, but otherwise it's pretty much as it comes. The 'About' page displays some system basic information (OS, platform, IP address etc) and should detect if the app is running as a container or not.  
- The 'Stress' page will generate CPU load.
- The 'DepCall' page will make a server side HTTP call, to test/demonstrate dependency calls in Application Insights

The other addition is the inclusion of the App Insights SDK, so if configured with an instrumentation key, monitoring data can be gathered and sent to Application Insights

<img src="https://user-images.githubusercontent.com/14982936/29657856-e82f4440-88b0-11e7-8575-dbbdf3edede5.png" alt="screenshot" style="width: 800px;"/>

## Dockerfile Notes
Three versions of the Dockerfile are provided.

- [**Dockerfile**](Dockerfile) - Default, assumes the app has already been published into binaries, into a sub directory named './pub' (e.g. with `dotnet publish -o pub`) prior to running "docker build". Typically used in conjunction with VSTS build tasks. 
- [**Dockerfile.windows**](Dockerfile.windows) - Same as default file above, but uses aspnetcore Nanoserver image as base, making it a Windows container. 
- [**Dockerfile.build**](Dockerfile.build) - This carries out the full .NET Core restore, build & publish steps as part of the build of the Docker image. This is done with a different source image 'aspnetcore-build' and two RUN commands invoked in the Dockerfile. This is handy to use when you don't have a build server or a system without the SDK available. 

## Docker Images
Public Docker images are [available on Dockerhub](https://hub.docker.com/r/bencuk/dotnet-demoapp/) in both Linux (Ubuntu) and Windows (Nanoserver) formats

## Updates
* Aug 2017 - Updated to ASP.NET Core 2.0, cleaned up initial boilerplate & refreshed Dockerfiles
* June 2017 - Changed design and wording, support for Windows containers & improved Docker detection
* Feb 2017 - Updated to .NET Core 1.1
* March 2017 - Total overhaul to .NET Core SDK 1.0, using csproj and new MVC template
