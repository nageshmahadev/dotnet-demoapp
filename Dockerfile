FROM microsoft/aspnetcore:2.0.0
MAINTAINER Ben Coleman
WORKDIR /app
ARG publish_out=bin/Release/netcoreapp2.0/publish

# Expose port 5000 on Kestrel webserver
EXPOSE 5000

# Copy already published binaries (dotnet publish)
COPY $publish .

# Flag file to indicate to code at runtime it is inside a container
RUN touch .insidedocker

# Run the ASP.NET Core app
ENTRYPOINT dotnet dotnet-demoapp.dll
