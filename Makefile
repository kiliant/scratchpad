all: build run

build:
	docker build -f Dockerfile -t scratchpad --no-cache .

run:
	docker run -d --name scratchpad \
        -p 2222:22 \
        -v "`pwd`/.ssh":/root/.ssh \
		-v "`pwd`/scratchpad":/mnt/host \
		-t scratchpad

clean:
	docker rm -f scratchpad
