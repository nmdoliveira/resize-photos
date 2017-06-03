# Resize Photos

This app provides a web service with urls for the images in http://54.152.221.29/images.json in 3 different sizes each: small (320x240), medium (384x288) and large (640x480).

## Install

### MongoDB

Please follow the instructions for your operating system here: https://docs.mongodb.com/manual/installation/.

### Libraries

```
bundle install
```

## Test

To run the tests:

```
bundle exec rspec
```

To run with coverage and with style checks:

```
bundle exec rake test
```

## Run

To run the app, first you need to fetch the images with:

```
bundle exec rake fetch
```

And then run the server:

```
bundle exec rails s
```

The web service will be available at http://localhost:3000/photos.
