PG_VERSION_DEFAULT=15.2
PG_VERSION ?= $(PG_VERSION_DEFAULT)
.PHONY: help full_clean dryrun renumber attempt
all:
	@ echo PG_VERSION=$(PG_VERSION) set from $(origin PG_VERSION)
	@ echo '  ' PG_VERSION can be set in front of make command like this
	@ echo '	' PG_VERSION=$(PG_VERSION_DEFAULT) make ...
	@ echo '  ' otherwise it will default to $(PG_VERSION_DEFAULT)
	@ echo pg-install help: make help
	@ echo pg-install dryrun: make dryrun
	@ echo pg-install attempt: make attempt
	@ echo renumber script codes: make renumber
	@ echo get source tarball: make get
	@ echo and more!
help:
	./pg-install
dryrun:
	sudo ./pg-install --verbose --dryrun /NewSW/PgSQL/postgresql-$(PG_VERSION).tar.bz2
attempt:
	sudo ./pg-install --verbose /NewSW/PgSQL/postgresql-$(PG_VERSION).tar.bz2
full_clean:
	sudo rm -rf /usr/local/src/PostgreSQL-$(PG_VERSION) /usr/local/SW.d/pgsql-$(PG_VERSION)*
renumber:
	./renumber pg-install pg-install-profile.bash 
get:
	./pg-get-tarball $(PG_VERSION)
