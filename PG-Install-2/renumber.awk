#!/bin/dash
PgmName="${0##*/}"

for f; do
    [ -f "$f" ] || {
        echo "$PgmName warning: Skipping non-file argument $f"
        continue
    }
    {
awk 'BEGIN{code=10}
{line1=gensub(/(.*"`cr +)([0-9]+)( +[1-9][0-9]*.*)/,"\\1" code "\\3", "g")
if (line1 != $0) ++code}
{line2=gensub(/(.*"`cr +[0-9]+ +)([1-9][0-9]*)(.*)/,"\\1" NR "\\3", "g", line1)}
{line3=gensub(/(.*"`cs +[^ ]+ *)([0-9]+)( +[1-9][0-9]*.*)/,"\\1" code "\\3", "g", line2)
if (line3 != line2) ++code}
{line4=gensub(/(.*"`cs +[^ ]+ *[0-9]+ +)([1-9][0-9]*)(.*)/,"\\1" NR "\\3", "g", line3)}
{print line4}' "$f" >"$f.$$" && mv --backup=numbered "$f.$$" "$f"
} || {
        echo "$PgmName warning: Something went wrong processing $f"
        continue
}
done
