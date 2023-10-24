module.exports = {
  defaultBrowser: "Brave Browser",
  handlers: [
    {
      match: /^https?:\/\/([^\/]*\.)?asana\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/([^\/]*\.)?codeship\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/[^\/]*\.google\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/([^\/]*\.)?heroku\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/([^\/]*\.)?monday\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/([^\/]*\.)?quip\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/([^\/]*\.)?rollbar\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/([^\/]*\.)?sharepoint\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/trello\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/([^\/]*\.)?zendesk\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/([^\/]*\.)?zoom\.com\/.*$/,
      browser: "Google Chrome"
    },
  ]
}
