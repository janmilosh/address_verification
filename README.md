# Address Verification

## Setup 
- Install and use Ruby version 3.1.2
- Run `bundle`
- Set up Smarty API credentials for authentication

### Set up Smarty API authentication
- Locate your Secret Keys and add to `credentials.rb`
- Avoid committing this file by running:
```
git update-index --assume-unchanged credentials.rb
```
If you wish to reverse this action, run:
```
git update-index --no-assume-unchanged credentials.rb
```

## Run unit tests
```
bundle exec rspec ./spec/unit -fd
```

## Run functional tests (will use 3 address lookups per test run)
```
bundle exec rspec ./spec/functional -fd
```

## Verify a CSV file of addresses
- The CSV file should have the headings `Street, City, Zip Code`
- The file should be located in the `app/data` directory
- For a file named `addresses.csv`, run this command from the project root:
```
$ ruby verify.rb addresses.csv
```
