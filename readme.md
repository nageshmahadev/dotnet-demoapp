## Simple .NET Core ASP web application

Based on the standard .NET Core template (`dotnet new mvc`). Kestrel is set to listen on 0.0.0.0:5000. This makes it possible to be run inside a container.

Some minor cosmetic modifications to the basic templated app, but otherwise it's pretty much as it comes. The 'About' page should display some system information (OS, platform, IP address etc)

<img src="https://cloud.githubusercontent.com/assets/14982936/23825441/d116c230-0681-11e7-81a8-4c2daf7edd14.png" alt="screenshot" style="width: 800px;"/>

## Dockerfile Notes

Two versions of the Dockerfile are provided.

 * [**Dockerfile**](Dockerfile) - Default, assumes the app has already been published into binaries, into a sub directory named './pub' (e.g. with dotnet publish -o pub) prior to running "docker build". Typically used in conjunction with VSTS build tasks
 * [**Dockerfile.build**](Dockerfile.build) - This carries out the full .NET Core restore, build & publish steps as part of the build of the Docker image. This is done with a different source image 'aspnetcore-build' and two RUN commands invoked in the Dockerfile. This is handy to use when you don't have a build server or a system without the SDK available

## Updates
* Feb 2017 - Updated to .NET Core 1.1
* March 2017 - Total overhaul to .NET Core SDK 1.0, using csproj and new MVC template
