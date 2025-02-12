# Define the image name and tag
imageName="node-express-app"

# Build the Docker image using the Dockerfile in the current directory
docker build -t "$imageName" .

# Output the result
if [ $? -eq 0 ]; then
    echo "Docker image '$imageName' built successfully."
else
    echo "Failed to build Docker image '$imageName'."
fi
