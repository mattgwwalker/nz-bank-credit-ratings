# New Zealand Bank Credit Ratings

These files are scripts to process the [Bank Credit Ratings provided by the Reserve Bank of New Zealand](https://www.rbnz.govt.nz/statistics/g1).


## Hand Editing

Unfortunately, the source file isn't perfect.  Some of these impefections I ironed out by hand:

 * The raw file from the Reserve Bank had to be manually edited to correct three clearly unintended dates of "June 31" for 2002, 2003, and 2012.  They were corrected to June 30.                                                                                                                  
 * A second issue had to be manually corrected, where the Reserve Bank did not specify the year for TSB's September position in 2004.


## SQLite

The multi-sheet Excel file that the Reserve Bank provides is converted to data formatted in SQL, specifically SQLite3.  

The database needs to be created and then instantiated with data such as the names of the companies who issue ratings (Standard and Poor's, Moody's, and Fitch).  

The ratings that the issuers provide also need to be inserted into the database.  The [graphic at interest.co.nz](https://www.interest.co.nz/credit-ratings-explained) helps comprehend the ratings system.  Using that graphic, I translated the ratings into a score from 0 (the very best; Aaa or AAA ratings) to 19 (C or D ratings).

The commands to create the database and to instantiate it with data can be found in the file [ratings.sql](ratings.sql).

To run those commands SQLite3 needs to be installed; within a Bash environment (Mac Terminal, Linux shell, or Cygwin for Windows) execute:

`./init-db.sh`
 
This will create a database named ratings.sql with four tables: Banks, Issuers, Ratings, and SourceData.


## Python
 
The Python script [process.py](process.py) is responsible for reading the multi-sheet Excel file and saving the data into the SQLite database.

In many cases the raw file provided by the Reserve Bank used multiple names for the same bank.  For example, the National Bank is referred to as “National” and “National Bank”.  The Python script is responsible for translating the many bank names into one bank identifier.  This wasn't necessarily straight forward.  For example, ANZ purchased the National Bank and for a while went under the name ASB National; these were all translated to the purchasing bank, ANZ.  The following table lists the different names and how they were translated.

Cannonical Name | Name Used by Reserve Bank
--------------- | -------------------------
ANZ|ANZ
ANZ|ANZ Nat
ANZ|ANZ National
ANZ|ANZN1
ANZ|ANZN
ANZ|ANZ Bank NZ Ltd.
ANZ|ANZ Bank NZ
ASB|ASB
ASB|ASB1
ASB|ASB-BK
BNZ|BNZ
BNZ|BNZ1
Bank of China|Bank of China
Bank of India|BOI
Bank of India|BOI-NZ
Bank of India|Bank of India
Bankers Trust|Bankers Trust
Baroda|Baroda
Baroda|BARODA
China Construction|China Construction
Co-op Bank|Co-op Bank
Country-wide|Country-wide
Country-wide|Countrywide
Heartland|Heartland
ICBC|ICBC
Kiwibank|Kiwibank
Kiwibank|KIWI1
Kiwibank|KIWI
Kiwibank|Kiwi
National|National
National|National Bank
Rabo New Zealand|Rabo New Zealand
Rabo New Zealand|Rabo NZ
Rabo New Zealand|RABO-NZ
Rabo New Zealand|Rabobank NZ
SBS|SBS Bank
SBS|SBS
SBS|SBS-Bk
St. George Bank|St. George Bk. NZ
St. George Bank|St. George Bank NZ
TSB|TSB
TSB|TSB Bank
TSB|TSB1
Trust Bank|Trust Bank
Westpac|Westpac NZ Ltd
Westpac|WNZL1
Westpac|WNZL
Westpac|Westpac NZ Ltd.
Westpac|Westpac NZ

The Python script also translates the multiple names used by the Reserve Bank for the issuers, however this was much more obvious.

The Python script requires Python 3 to be installed.  It can be executed with the command:

`python3 process.py`


## DB Browser

To view the data resulting from running the Python script, I recommend using [DB Browser for SQLite](http://sqlitebrowser.org/)


## R

To produce visualisations of the processed data, I wrote an [R script](ratings.R).

You will need to have [R](https://www.r-project.org/) installed, along with the package RSQLite.
 
It produces the graphs in the file [ratings.pdf](ratings.pdf)
