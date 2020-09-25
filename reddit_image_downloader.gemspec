Gem::Specification.new do |a| 
    a.name = 'reddit_image_downloader'
    a.version = '0.0.1'
    a.date = '2020-09-25'
    a.summary = "Ruby gem for downloading pictures from reddit!"
    a.description = "This little library helps people download images from different subs much easier. It's actually like a crawler for the images posted on a subreddit. Actually, it's a great tool to have your favorite memes locally!"
    a.authors = ["Muhammadreza Haghiri"]
    a.email = 'haghiri75@gmail.com'
    a.files = ["lib/reddit_image_downloader.rb", "Gemfile"]
    a.add_dependency "httparty"
    a.add_dependency "digest"
    a.add_dependency "json"
    a.homepage = 
     'http://github.com/prp-e/reddit_image_downloader' 
    a.license = 'MIT'
   end