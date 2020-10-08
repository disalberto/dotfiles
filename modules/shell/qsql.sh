#!/bin/bash

#Credits to the Gringo

# Execute an sql query as follows: qsql "select * from table.csv"

# -D -> --output-delimiter
# -O -> --output-header
# -H -> --skip-header
# -d -> --delimiter
# -T -> --tab-delimited-output


## install q-text-as-data
alias qsql="q -D='^' -O -H -d='^'"

alias qsqlc="q -D=',' -O -H -d=','"


## install visidata
qsql-pretty() {
  q -T -O -H -d='^' "$1" | vd
}
