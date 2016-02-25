require "json"
require "oauth"
require "net/http"

res = Net::HTTP.post_form(
  uri,
  "client_id" => client_id,
  "client_secret" => client_secret,
  "grant_type" => "authorization_code",
  "redirect_uri" => redirect_uri,
  "code" => ACCESS_CODE)

put res.body