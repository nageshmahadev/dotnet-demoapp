echo "##### Removing old bin & obj..."
rm -fo -r .\bin
rm -fo -r .\obj

echo "##### Dotnet building & publishing..."
#dotnet restore
dotnet publish -c Release

# Will need to switch to Linux containers before running
echo "##### Building & pushing Linux Docker image..."
docker build . -t bencuk/dotnet-demoapp
docker tag bencuk/dotnet-demoapp bencuk/dotnet-demoapp:linux
docker push bencuk/dotnet-demoapp:latest
docker push bencuk/dotnet-demoapp:linux

# Will need to switch to Windows containers before running
#echo "##### Builing & pushing Windows Docker image..."
#docker build . -f Dockerfile.windows -t bencuk/dotnet-demoapp:windows
#docker tag bencuk/dotnet-demoapp:windows bencuk/dotnet-demoapp:nanoserver
#docker push bencuk/dotnet-demoapp:windows
#docker push bencuk/dotnet-demoapp:nanoserver

