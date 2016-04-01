#BBC iPlayer API
=================

Overview
-------
- This is app is built using Ruby, with a Sinatra server. The app was test-driven using RSpec for unit testing and Capybara for feature testing.
- HTTP requests in the unit tests have been mocked using the WebMock gem. This is disabled in the feature tests, which make genuine calls to the API.
- The server has been kept deliberately simple, with just two routes, `/` and `/result`.
- There is one Ruby class, APIQuery, which handles all the logic for the API requests.
- There are three views.
  * `index` is a simple splash page.
  * `layout` handles the search bar and is present throughout.
  * `result` displays the current API response data.
- The views have been rendered in haml as an alternative to html with embedded Ruby.

Installation instructions
-------
-Clone this repository
```
$ git clone https://github.com/edwardkerry/iPlayerAPI
$ cd iPlayerAPI
```

-Install dependencies
`$ bundle`

-Run test suite
`$ rspec`

-Launch server
`$ rackup`

-Visit site in your browser
`localhost:9292`
