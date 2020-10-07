#!/bin/bash


### Usage add_certs /path/to/certs

export CWD=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)

add_certs() {
	CA_DEST="/usr/local/share/ca-certificates/"
	CERTS="$1/*"
	CERTS_CRT="$CWD/certs_crt"

	SUFFIX_CER=".cer"

	mkdir -p $CERTS_CRT

	for f in $CERTS
	do
		echo "Converting $f to crt"
		openssl x509 -inform DER -in "$f" -out "$CERTS_CRT/$(basename ${f%"$SUFFIX_CER"}).crt"
	done

	sudo cp $CERTS_CRT/* $CA_DEST

	rm -rf $CERTS_CRT 

	echo "Updating CA certificates.."
	sudo update-ca-certificates -f

	sudo service network-manager restart
}

reconf_certs() {
	sudo dpkg-reconfigure ca-certificates
	sudo service network-manager restart
}
