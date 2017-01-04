## Banjir API

![](docs/postman.png)

Malaysia flood JSON API. Data from [JKR Malaysia](http://bencanaalam.jkr.gov.my/v2/).

### Endpoint

[https://banjir-api.herokuapp.com/api/v1/reports.json](https://banjir-api.herokuapp.com/api/v1/reports.json)

### Querying

1. `/reports.json?daerah=EXAMPLE&negeri=EXAMPLE`
2. `/reports.json?daerah=EXAMPLE`
3. `/reports.json?negeri=EXAMPLE`

**Example**

1. [https://banjir-api.herokuapp.com/api/v1/reports.json?daerah=setiu&negeri=terengganu](https://banjir-api.herokuapp.com/api/v1/reports.json?daerah=setiu&negeri=terengganu)
2. [https://banjir-api.herokuapp.com/api/v1/reports.json?daerah=setiu](https://banjir-api.herokuapp.com/api/v1/reports.json?daerah=setiu)
3. [https://banjir-api.herokuapp.com/api/v1/reports.json?negeri=terengganu](https://banjir-api.herokuapp.com/api/v1/reports.json?negeri=terengganu)

### About

1. Built with Ruby (2.4.0) on Rails (5.0.1)
2. Deployed on Heroku on midnight of 01 Jan 2017
3. Data updated every 1 hour

### Built With Banjir API

- [MyBanjir Telegram Bot](https://telegram.me/MyBanjirBot) by [Mohd Amin Yuddin Bin Yacob](https://github.com/mohdaminyuddin) - [GitHub](https://github.com/mohdaminyuddin/MyBanjirBot)

### Known Issues

- The `null` values are originated from empty values from the source (JKR) site

### Nice To Have

- Special route for `/daerah.json`
- Special route for `/negeri.json`
- Special route for `/negeri/daerah.json`

### Changelog

**v1.1.0 - 02/01/2017**

- Add `latitude`, `longitude` and `google_maps_url` in each object
- Add search by `daerah` and/or `negeri` query string feature

### Contribute

Feel free to fork this project and improve it. Submit your Pull Request for merge review.


