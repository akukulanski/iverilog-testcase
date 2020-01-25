
build-dockers:
	@echo ""
	@echo "> Building first image (v10.1)..."
	docker build -t img-10.1 -f dockerfile-10.1 .
	@echo ""
	@echo "> Building second image (v10.2)..."
	docker build -t img-10.2 -f dockerfile-10.2 .
	@echo ""

run-10.1:
	docker run -v $$(pwd):/home/ -t img-10.1 make -C /home/test
	#docker run -v $$(pwd):/home/ -it img-10.1 "make -C /home/test"

run-10.2:
	docker run -v $$(pwd):/home/ -t img-10.2 make -C /home/test
	#docker run -v $$(pwd):/home/ -it img-10.2 "make -C /home/test"

#iverilog -v | grep --color "Icarus Verilog version"