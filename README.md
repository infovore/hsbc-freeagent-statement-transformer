# Freeagent HSBC CSV statement transformer

This is a very niche usecase product, but it fulfils the criteria:

* you have an HSBC personal bank account (don't know if it works with business accounts)
* you want to export data outside the period you're allowed to download CSV/QIF/OFX for and import it into FreeAgent

The script takes the CSV from [Felix Eve's bookmarklet](https://github.com/dahousecat/hsbc-statement-to-csv) and outputs CSV in the format FreeAgent would like.


## Usage

1. I'm using [this bookmarklet script](https://github.com/dahousecat/hsbc-statement-to-csv). It allows me to click the bookmarklet whilst staring at a "previous statement" in HSBC's website and download that statement as CSV.
2. That CSV is a representation of what's on the page, which is **not** what FreeAgent wants.
3. Then, run it through the ruby script in this repository like so:  

		./transform.rb input.csv
	That'll spit out CSV to `STDOUT`. Pipe it into a file of your choosing, and you should be able to import your transactions into FreeAgent.