module.exports = {
  defaultBrowser: "Arc",
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
      match: /^https?:\/\/[^\/]*\.gig-o-matic\.com\/.*$/,
      browser: "Brave Browser"
    },
    {
      match: /^https?:\/\/[^\/]*\.github\.com\/.*$/,
      browser: "Brave Browser"
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
      match: /^https?:\/\/([^\/]*\.)?sendgrid\.net\/.*$/,
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
      match: /^https?:\/\/youtu\.be\/.*$/,
      browser: "Brave Browser"
    },
    {
      match: /^https?:\/\/[^\/]*\.youtube\.com\/.*$/,
      browser: "Brave Browser"
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
