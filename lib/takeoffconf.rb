require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/takeoffconf/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * File System adapter
  #    adapter type: :file_system, uri: 'file:///db/bookshelf_development'
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/takeoffconf_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/takeoffconf_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/takeoffconf_development'
  #    adapter type: :sql, uri: 'mysql://localhost/takeoffconf_development'
  #
  adapter type: :sql, uri: ENV['DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  mapping do
    collection :speakers do
      entity Speaker
      repository SpeakerRepository

      attribute :id, Integer
      attribute :name, String
      attribute :twitter, String
      attribute :talk, String
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/takeoffconf/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :smtp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
