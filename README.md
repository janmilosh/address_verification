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

## Run functional tests
```
bundle exec rspec ./spec/functional -fd
```
