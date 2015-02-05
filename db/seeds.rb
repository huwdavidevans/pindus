# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.new(
    :email => Rails.application.secrets.admin_email,
    :password => Rails.application.secrets.admin_pass,
    :password_confirmation => Rails.application.secrets.admin_pass,
    :roles => [:admin],
    :first_name => Rails.application.secrets.admin_first_name,
    :last_name => Rails.application.secrets.admin_last_name,
    :screen_name => Rails.application.secrets.admin_screen_name
  )
user.skip_confirmation!
user.confirm!
user.save!


ActiveRecord::Base.connection.reset_pk_sequence!(Pic.table_name)