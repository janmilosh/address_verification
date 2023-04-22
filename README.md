# Address Verification

## Setup 
1. Install and use Ruby version 3.1.2
2. Run `bundle`
3. Add Smarty API credentials for authenication

### Set up Smarty API authentication
1. Locate your Secret Keys and add to `credentials.rb`
2. Avoid committing this file by running:
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
