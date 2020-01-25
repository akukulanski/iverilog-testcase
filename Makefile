
build-dockers:
	@echo ""
	@echo "> Building first image..."
	docker build -t img-1 -f Dockerfile-1 .
	@echo ""
	@echo "> Building second image..."
	docker build -t img-2 -f Dockerfile-2 .
	@echo ""

run-img-1:
	docker run -v $$(pwd):/home/ -t img-1 make -C /home/test
	#docker run -v $$(pwd):/home/ -it img-1 "make -C /home/test"

run-img-2:
	docker run -v $$(pwd):/home/ -t img-2 make -C /home/test
	#docker run -v $$(pwd):/home/ -it img-2 "make -C /home/test"

#iverilog -v | grep --color "Icarus Verilog version"