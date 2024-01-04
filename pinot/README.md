# 1 Billion Rows Challenge

## Split The One Big File

The output of the data generator is a single 1 billion row file. When ingesting this into Pinot, you'll want to split the data evenly into smaller files. The command below will partition the data into separate 50MM row files all prefixed with `xa`.

```bash
split -l 50000000 measurements.csv 
```

