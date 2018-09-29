# =======================================================
# Stage 1 - build and publish app
# =======================================================

# Build image has SDK and tools (Windows Nano Server SAC 2016)
FROM microsoft/dotnet:2.1-sdk-nanoserver-sac2016 as build
WORKDIR /build

# Copy project source files
COPY wwwroot ./wwwroot
COPY Pages ./Pages
COPY *.cs ./
COPY *.json ./
COPY *.csproj ./

# Restore, build & publish
RUN dotnet restore
RUN dotnet publish --no-restore --configuration Release

# =======================================================
# Stage 2 - assemble production image from build output
# =======================================================

# Base image is .NET Core runtime only (Windows Nano Server SAC 2016)
FROM microsoft/dotnet:2.1-aspnetcore-runtime-nanoserver-sac2016

# Metadata in Label Schema format (http://label-schema.org)
LABEL org.label-schema.name    = ".NET Core Demo Web App" \
      org.label-schema.version = "3.5.3" \
      org.label-schema.vendor  = "Ben Coleman" \
      org.label-schema.vcs-url = "https://github.com/benc-uk/dotnet-demoapp"

# Seems as good a place as any
WORKDIR /app

# Copy already published binaries (from build stage image)
COPY --from=build /build/bin/Release/netcoreapp2.1/publish .

# Flag file to indicate to code at runtime it is inside a container
COPY .insidedocker .

# Enable App Insights profiler
ENV ASPNETCORE_HOSTINGSTARTUPASSEMBLIES Microsoft.ApplicationInsights.Profiler.AspNetCore

# Expose port 5000 from Kestrel webserver
EXPOSE 5000

# Run the ASP.NET Core app
ENTRYPOINT dotnet dotnet-demoapp.dll
