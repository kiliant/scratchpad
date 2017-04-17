all: build run

build:
	docker build -f Dockerfile -t scratchpad --no-cache .

run:
	docker-compose up -d scratchpad
	sleep 15

clean:
	docker rm -f scratchpad
