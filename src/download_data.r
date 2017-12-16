library(RCurl)
PSDS_PATH <- file.path('~', 'statistics-for-data-scientists')

## Create data subdirectory
dir.create(file.path(PSDS_PATH, 'data'), showWarnings = FALSE)

download_from_google_drive <- function(id, fname, path)
{
  url <- sprintf("https://drive.google.com/uc?export=download&id=%s", id)
  data <- getBinaryURL(url, followlocation = TRUE, ssl.verifypeer = FALSE)
  dest <- file.path(path, 'data', fname)
  writeBin(data, dest, useBytes = TRUE)
}

## Import state data
download_from_google_drive(id="0B98qpkK5EJembFc5RmVKVVJPdGc", fname='state.csv', path=PSDS_PATH)

## Airline data
download_from_google_drive(id="0B98qpkK5EJemcmZYX2VhMHBXelE", fname='dfw_airline.csv', path=PSDS_PATH)
download_from_google_drive(id="0B98qpkK5EJemMzZYZHZJaF9va0U", fname='airline_stats.csv', path=PSDS_PATH)

## Import stock data
download_from_google_drive('0B98qpkK5EJemV2htZWdhVFRMNlU', fname='sp500_px.csv', path=PSDS_PATH)
download_from_google_drive('0B98qpkK5EJemY0U0N1N6a21lUzA', fname='sp500_sym.csv', path=PSDS_PATH)

## Import KC housing tax data
download_from_google_drive('0B98qpkK5EJemck5VWkszN3F3RGM', fname='kc_tax.csv', path=PSDS_PATH)

## Import lending club loan data
download_from_google_drive('0B98qpkK5EJemRXpfa2lONlFRSms', fname='lc_loans.csv', path=PSDS_PATH)
download_from_google_drive('1J96vAqyh92VIeh7kBFm1NBfZcvx8wp2s', fname='full_train_set.csv', path=PSDS_PATH)

## Import a sample of 200 records from lending club loan data
download_from_google_drive('0B98qpkK5EJemd0JnQUtjb051dTA', fname='loan200.csv', path=PSDS_PATH)

## Import a sample of 3000 records from lending club loan data
download_from_google_drive('0B98qpkK5EJemQXYtYmJUVkdsN1U', fname='loan3000.csv', path=PSDS_PATH)


## Import a complete set of records from lending club loan data
download_from_google_drive('0B98qpkK5EJemZzdoQ2I3SWlBYzg', fname='loan_data.csv', path=PSDS_PATH)

## Import loans income data
download_from_google_drive('0B98qpkK5EJemRXVld0NSbWhYNVU', fname='loans_income.csv', path=PSDS_PATH)

## Import session_times data
download_from_google_drive('0B98qpkK5EJemOC0xMHBTTEowYzg', fname='web_page_data.csv', path=PSDS_PATH)

## Import four_sessions data
download_from_google_drive('0B98qpkK5EJemOFdZM1JsaEF0Mnc', fname='four_sessions.csv', path=PSDS_PATH)

## Import click_rate data
download_from_google_drive('0B98qpkK5EJemVHB0ZzdtUG9SeTg', fname='click_rates.csv', path=PSDS_PATH)

## Import imanishi data
download_from_google_drive('0B98qpkK5EJemZTJnUDd5Ri1vRDA', fname='imanishi_data.csv', path=PSDS_PATH)

## Import lung disease data
download_from_google_drive('0B98qpkK5EJemb25YYUFJZnZVSnM', fname='LungDisease.csv', path=PSDS_PATH)

## Import Zillow's county level ZHVI 
download_from_google_drive('0B98qpkK5EJemWGRWOEhYN1RabVk', fname='County_Zhvi_AllHomes.csv', path=PSDS_PATH)

## Import King county house sales data
download_from_google_drive('0B98qpkK5EJemVTRRN0dLakxwTmM', fname='house_sales.csv', path=PSDS_PATH)
