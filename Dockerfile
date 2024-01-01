# Start from the base image provided by Heroic Labs
FROM registry.heroiclabs.com/heroiclabs/nakama:3.20.0

# Execute database migrations and start Nakama server (as defined in the entrypoint of the docker-compose)
ENTRYPOINT ["/bin/sh", "-ecx"]
CMD ["/nakama/nakama migrate up --database.address postgres:localdb@postgres:5432/nakama && exec /nakama/nakama --name nakama1 --database.address postgres:localdb@postgres:5432/nakama --logger.level DEBUG --session.token_expiry_sec 7200"]

# Expose the ports used by Nakama
EXPOSE 7349 7350 7351