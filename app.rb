require 'bundler/setup'
Bundler.require(:default)


MusicBrainz.configure do |c|
	c.app_name = "My Music App"
	c.app_version = "1.0"
	c.contact = "support@mymusicapp.com"
	c.cache_path = "/tmp/musicbrainz-cache"
	c.perform_caching = true
	c.query_interval = 1.2
	c.tries_limit = 2
end



# point to index form
# interface
get '/' do
	erb :index # go to /views open index.erb
end

# post search
post '/musician' do
	artist = params['artist']
	artist_obj = MusicBrainz::Artist.find_by_name(artist)

	@name = artist_obj.name
	@type = artist_obj.type
	@utls = artist_obj.urls


	
	binding.pry
	erb :musician
end

#@albums_array = artist_obj.release_groups 



# class Artist


# def self.search(artist)
# 	MusicBrainz::Artist.search(artist)
# end
# end

#  def self.search(artist)
# 	MusicBrainz::Artist.search(artist)
#  end

# from matt
# Artist.search(params[:artist])
