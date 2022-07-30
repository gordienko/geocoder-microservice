# Geocoder microservice

## Run server
bundle exec puma

## Usage

### Get city coordinates by city name

```
curl --request POST \
  --url 'http://localhost:3002/v1?city=%D0%90%D0%BD%D0%B0%D0%B4%D1%8B%D1%80%D1%8C'
```
