# Be sure to restart your server when you modify this file.

if Rails.env.development?
  Tinystore::Application.config.session_store :cookie_store, key: '_tinystore_session', domain: '.lvh.me'
else
  Tinystore::Application.config.session_store :cookie_store, key: '_tinystore_session', domain: '.tinystore.me' # TODO check this later
end
