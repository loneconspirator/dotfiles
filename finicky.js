module.exports = {
  defaultBrowser: "Brave Browser",
  handlers: [
    {
      match: /^https?:\/\/[^\/]*google\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/trello\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/[^\/]*heroku\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/[^\/]*codeship\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/[^\/]*rollbar\.com\/.*$/,
      browser: "Google Chrome"
    },
  ]
}
