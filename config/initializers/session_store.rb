# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_time_trac_session',
  :secret      => 'dcbf22b744dad7b4a0129f1271d09678b2c9620970bfc47bf3a878812ed6081099a0d025fd16e77d6c729f9f07fcccabee48033ba453f6a41dfee3789134af1b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
