# statistics-for-data-scientists
Code associated with the book "Practical Statistics for Data Scientists: 50 Essential Concepts"

The scripts are stored by chapter and replicate most the figures and code snippets.
The data is not saved on github and you will need to download the data using the sript src/download_data.r. 
This will copy the data into the data directory

IMPORTANT NOTE: 
The scripts all assume that you have clone the repository into the top level directory.
If you save the repository elsewhere, you will need to edit the line

  PSDS_PATH <- file.path('~', 'statistics-for-data-scientists')

to point to the appropriate directory in all of the scripts.
