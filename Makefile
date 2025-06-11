overflow:
	java -jar tsa-cli.jar \
		tact -c tact.config.json -p "overflow" -i "Overflow" -o overflow.sarif

division:
	java -jar tsa-cli.jar \
		tact -c tact.config.json -p "sample" -i "Divider" -o division.sarif

jetton-base:
	java -jar tsa-cli.jar \
		tact -c ./jetton/tact.config.json -p "Jetton" -i "JettonMinter" -o jetton-base.sarif -d b5ee9c7241010201002700014408008d0d4580cd8f09522be7c0390a7a632bda4a99291c435b767c95367ebe78e9af0100006ab2c2c3 \
		-t types1.json --no-user-errors \
		--method=0

jetton-with-errors:
	java -jar tsa-cli.jar \
		tact -c ./jetton/tact.config.json -p "Jetton with errors" -i "JettonMinter" -o jetton-with-errors.sarif -d b5ee9c7241010201002700014408008d0d4580cd8f09522be7c0390a7a632bda4a99291c435b767c95367ebe78e9af0100006ab2c2c3 \
		-t types1.json --no-user-errors \
		--method=0

jetton-raw:
	java -jar tsa-cli.jar \
		tact -c ./jetton/tact.config.json -p "Jetton" -i "JettonMinter" -o jetton-raw.sarif

clean:
	rm -f *.sarif

parse-tlb:
	rm -f types1.json
	./tlbc -j block.tlb internal.tlb > types1.json