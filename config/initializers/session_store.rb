# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_estimate_session',
  :secret      => 'dee128eb34730e8c62e730a3cbce199f204d40b102991f42f7386ffb5779bdf27b2b930b756c327847aff0384ba4f8cec29849eeb2d729a4b1c858bef54bdea7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
