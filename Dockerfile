# Use the official Ollama image as base
FROM ollama/ollama:latest

# Set environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS=*

# Create a startup script
COPY start-ollama.sh /usr/local/bin/start-ollama.sh
RUN chmod +x /usr/local/bin/start-ollama.sh

# Expose the default Ollama port
EXPOSE 11434

# Use the startup script as entrypoint
ENTRYPOINT ["/usr/local/bin/start-ollama.sh"]