all: build run

build:
	docker build -f Dockerfile -t scratchpad --no-cache .

run:
	docker run -d --name scratchpad \
		-v "`pwd`/.ssh":/root/.ssh \
		-v "`pwd`/scratchpad":/mnt/host \
		-t scratchpad
	sleep 15

clean:
	docker rm -f scratchpad
