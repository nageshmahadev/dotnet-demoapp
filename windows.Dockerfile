FROM microsoft/aspnetcore-build:2.0.0-nanoserver as build
WORKDIR /build

# Copy project source files
COPY wwwroot ./wwwroot
COPY Pages ./Pages
COPY *.cs ./
COPY *.json ./
COPY *.csproj ./

# Restore, build & publish
RUN dotnet restore
RUN dotnet publish --configuration Release

####################################################################################

FROM microsoft/aspnetcore:2.0.0-nanoserver
MAINTAINER Ben Coleman
WORKDIR /app
ARG publish_out=bin\\Release\\netcoreapp2.0\\publish

# Expose port 5000 on Kestrel webserver
EXPOSE 5000

# Copy already published binaries (dotnet publish)
COPY $publish_out .
# Flag file to indicate to code at runtime it is inside a container
RUN echo $null >> .insidedocker

# Run the ASP.NET Core app
ENTRYPOINT dotnet dotnet-demoapp.dll
