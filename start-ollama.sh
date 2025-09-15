
#!/bin/bash

# Start Ollama server in the background
/bin/ollama serve &

# Wait for Ollama to be ready
echo "Waiting for Ollama server to start..."
while ! curl -s http://localhost:11434/api/tags > /dev/null; do
    sleep 2
done

echo "Ollama server is ready. Pulling gpt-oss:20b model..."

# Pull the model
/bin/ollama pull gpt-oss:20b

echo "Model pulled successfully. Starting gpt-oss:20b with keepalive..."

# Run the model with keepalive (this will keep it loaded in memory)
# Note: We'll run this in background and then keep the server running
(/bin/ollama run gpt-oss:20b --keepalive -1s < /dev/null &)

echo "Model is loaded and ready to serve requests"

# Keep the container running by monitoring the Ollama process
wait