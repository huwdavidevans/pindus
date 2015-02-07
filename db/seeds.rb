# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

user = User.new(
    :email => ENV['ADMIN_EMAIL'],
    :password => ENV['ADMIN_PASS'],
    :password_confirmation => ENV['ADMIN_PASS'],
    :roles => [:admin],
    :first_name => ENV['ADMIN_FIRST_NAME'],
    :last_name => ENV['ADMIN_LAST_NAME'],
    :screen_name => ENV['ADMIN_SCREEN_NAME']
  )
user.skip_confirmation!
user.confirm!
user.save!

ActiveRecord::Base.connection.reset_pk_sequence!(Pic.table_name)