require "json"
require "objects/show_object"

namespace :import do
  desc "Import show from json"
  task shows: :environment do
    # I don't have unique id to update
    # so I'm just deleting them all each time
    Show.delete_all

    counter = 0
    filename = Rails.root.join("_starter/data.json")
    show_objects = JSON.load_file(filename)

    show_objects.each do |show_object_data|
      result = ShowImportService.new.import(ShowObject.new(show_object_data))

      if result.imported?
        counter += 1
      else
        puts "#{result.show.title} - #{result.show.errors.full_messages.join(',')}"
      end
    end

    puts "Imported #{counter} shows"
  end
end
