# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Base_session',
  :secret      => '7cf4d9da1c6c83c3c7ed9e18e14d78b265c9df49397fee77e2988755e125f54a1243857d169f441cbfa37b5b6979fb77dc4c6c28e8cb586691ae03fc20768581'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
