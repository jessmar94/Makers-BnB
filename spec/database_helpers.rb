require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test') # or makers_bnb?
  connection.exec('TRUNCATE TABLE users, spaces, requests, availabilities ;')
end
