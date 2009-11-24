# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_time_trac_session',
  :secret      => 'e951a7d1709c35df004a33844ff0f98fddafb6f25c97df6fbe64a6df80f7a13f60af1bf34b27ffc0a56efc807ae231ab727abff3e28d594202af55cfc0c29fcb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
