Gem::Specification.new do |a| 
    a.name = 'reddit_junkie'
    a.version = '0.0.6'
    a.date = '2020-10-2'
    a.summary = "Ruby gem for downloading pictures from reddit!"
    a.description = "This little library helps people download images from different subs much easier. It's actually like a crawler for the images posted on a subreddit. Actually, it's a great tool to have your favorite memes locally!"
    a.authors = ["Muhammadreza Haghiri"]
    a.email = 'haghiri75@gmail.com'
    a.files = ["bin/reddit_junkie","lib/reddit_junkie.rb", "Gemfile"]
    a.executables = ["reddit_junkie"]
    a.add_dependency "httparty"
    a.add_dependency "json"
    a.homepage = 
     'http://github.com/prp-e/reddit_image_downloader' 
    a.license = 'MIT'
   end
