**Q TEXT AS DATA**

*Syntax: q [-options] <sql-query from file.csv>*
*Some examples of options*
```bash
# -D -> --output-delimiter
# -O -> --output-header
# -H -> --skip-header
# -d -> --delimiter
# -T -> --tab-delimited-output
# -b -> --beautify
```

Esample
```bash
q -d';' -D' ' -H -b 'select Username, Identifier, `First name` from /a/path/username.csv'
```
*NOTE: we use single quotes since we have a column name with back-tiks*

*Depending on the csv delimiter some aliases are defined: qsql(-d'^'), qsqlc(-d',') and qsqls(-d';').*

*In addition, qsql-pretty() and qsqls-pretty() are defined to better present the result of the query via visidata.*

```bash
qsqls-pretty 'select Username, Identifier, `First name` from /a/path/username.csv'
```

For further info:
- http://harelba.github.io/q/
- https://www.visidata.org/
