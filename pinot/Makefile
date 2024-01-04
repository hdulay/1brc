
pinot:
	curl -O https://downloads.apache.org/pinot/apache-pinot-1.0.0/apache-pinot-1.0.0-bin.tar.gz

table:
	pinot-admin AddTable \
		-schemaFile tableschema.json \
		-tableConfigFile tableconfig.json \
		-exec

ingest:
	pinot-admin LaunchDataIngestionJob \
		-jobSpecFile ${PWD}/jobspec.yaml

