namespace :export do
  desc "Prints AppParameter.all in a seeds.rb way."
  task :seeds_format => :environment do
    AppParameter.order(:id).all.each do |appp|
      puts "AppParameter.create(#{appp.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end