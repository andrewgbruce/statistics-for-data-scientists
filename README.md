# statistics-for-data-scientists
Code associated with the book "Practical Statistics for Data Scientists: 50 Essential Concepts"

The scripts are stored by chapter and replicate most of the figures and code snippets.

HOW TO GET THE DATA:
Run R script:
The data is not saved on github and you will need to download the data.
You can do this in R using the sript src/download_data.r. This will copy the data into the data directory ~/statistics-for-data-scientists/data. 

Manual download:
https://github.com/gedeck/practical-statistics-for-data-scientists

IMPORTANT NOTE: 
The scripts all assume that you have cloned the repository into the top level home directory (~/)
If you save the repository elsewhere, you will need to edit the line

  PSDS_PATH <- file.path('~', 'statistics-for-data-scientists')

to point to the appropriate directory in all of the scripts.

  PSDS_PATH <- <<pathname I am using>>
>>>>>>> 321b878750602e233aad8a0a7814a8f5ceb99cf0
