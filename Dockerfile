# Use the official Ollama image as base
FROM ollama/ollama:latest

# Set environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS=*

# Copy and normalize line endings
COPY start-ollama.sh /usr/local/bin/start-ollama.sh
RUN apt-get update && apt-get install -y dos2unix && \
    dos2unix /usr/local/bin/start-ollama.sh && \
    chmod +x /usr/local/bin/start-ollama.sh

# Expose the default Ollama port
EXPOSE 11434

# Use bash to run the startup script
ENTRYPOINT ["/bin/bash", "/usr/local/bin/start-ollama.sh"]
