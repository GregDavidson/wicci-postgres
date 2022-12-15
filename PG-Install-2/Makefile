VERSION=15.1
.PHONY: help full_clean dryrun renumber attempt
help:
	./pg-install
dryrun:
	sudo ./pg-install --verbose --dryrun /NewSW/PgSQL/postgresql-$(VERSION).tar.bz2
attempt:
	sudo ./pg-install --verbose /NewSW/PgSQL/postgresql-$(VERSION).tar.bz2
full_clean:
	sudo rm -rf /usr/local/src/PostgreSQL-$(VERSION) /usr/local/SW.d/pgsql-$(VERSION)*
renumber:
	./renumber pg-install pg-install-profile.bash 
