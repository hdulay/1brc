# 1 Billion Rows Challenge

You'll still need to reference the root [README](../README.md) to install Java 21 and generate 1 billion rows.

## Download Pinot, Start Pinot, Create a Pinot Table

```bash
# download Pinot
curl -O https://downloads.apache.org/pinot/apache-pinot-1.0.0/apache-pinot-1.0.0-bin.tar.gz

# explode
tar xvf apache-pinot-1.0.0-bin.tar.gz 
cd apache-pinot-1.0.0

# start pinot
./bin/pinot-admin.sh QuickStart -type batch
```

```bash
# in another terminal
./bin/pinot-admin AddTable \
  -schemaFile tableschema.json \
  -tableConfigFile tableconfig.json \
  -exec
```


## Split The One Big File

The output of the data generator is a single 1 billion row file. When ingesting this into Pinot, you'll want to split the data evenly into smaller files. The command below will partition the data into separate 50MM row files all prefixed with `xa`.

```bash
split -l 50000000 measurements.csv 
```

## Ingest Into Pinot

This process will take some time because it will generate a separate segment for each file.

```bash
./bin/pinot-admin.sh LaunchDataIngestionJob -jobSpecFile ${PWD}/jobspec.yaml
```

## Execute SQL

Execute this statement in the Pinot console http://localhost:9000.

```sql
select
    city,
    avg(temp) as mean_measure,
    min(temp) as min_measure,
    max(temp) as max_measure
from
    onebrc
group by
    city
order by
    city
```

## Clean Up

```bash
$ rm -rf data
$ rm -rf out

$ ./bin/pinot-admin DeleteTable -tableName 1brc -exec
```
