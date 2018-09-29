FROM microsoft/dotnet:2.1-sdk as build
WORKDIR /build
COPY . ./
RUN dotnet publish --configuration Release
# =======================================================
FROM microsoft/dotnet:2.1-aspnetcore-runtime
WORKDIR /app
EXPOSE 5000
COPY --from=build /build/bin/Release/netcoreapp2.1/publish .
ENTRYPOINT dotnet dotnet-demoapp.dll