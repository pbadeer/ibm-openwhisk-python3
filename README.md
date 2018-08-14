# OpenWhisk Python 3

### Usage
1. Install virtual environment: `make setup` (one-time)
2. Create zip file of code for uploading to IBM OpenWhisk: `make build` (each time you make a change)
3. Upload new service: `make create` or update existing service: `make update`

### Optional
 * Delete virtual environment and zip file: `make clean`
 * Delete service: `make delete`
 * Curl service URL and print response: `make test`