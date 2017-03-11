FROM microsoft/aspnetcore:1.1.1
MAINTAINER Ben Coleman
WORKDIR /app

# Expose port 5000 on Kestrel webserver
EXPOSE 5000

# Copy already published binaries (dotnet publish)
COPY pub .

# Run the ASP.NET Core app
ENTRYPOINT dotnet dotnet-demoapp.dll
