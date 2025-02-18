
## Start all tests *WITHOUT* allure

```
bundle exec rspec ./spec/features/*
```

## Start all tests *WITH* allure

```
bundle exec rspec ./spec/features/* --format AllureRspecFormatter --out allure-results
```

## Host allure results

```
allure serve report/allure-results
```
