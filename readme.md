Simple .NET Core ASP web application

Based on the standard .NET Core template (dotnet new -t web). Modified to remove dependency on npm & bower in the prepublish stage, and Kestrel set to listen on 0.0.0.0:5000. This makes it easier to build in a Dockerfile and to run inside a container.

Some minor cosmetic modifications to the basic templated app, but otherwise it's pretty much as it comes

Dockerfile Notes

Two versions of the Dockerfile are provided.

Dockerfile - Default, assumes the app has been compiled and published into binaries to a sub directory 'build/' (e.g. with dotnet publish -o build) prior to running "docker build". Typically used in conjunction with VSTS
Dockerfile-DotnetPub - This carries out the full .NET Core restore & publish steps as part of the build of the Docker image. This is done with a different source image 'aspnetcore-build' and two RUN commands invoked in the Dockerfile. This is handy to use when you don't have a build server or a system without required tools like npm, bower & gulp installed
Updates

Feb 2017 - Updated to .NET Core 1.1