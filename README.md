# Reddit Image Downloader

Reddit image downloader is a gem for [ruby](http://ruby-lang.org/) which lets you download images from a particular subreddit. 

## Why I made this?

First, I was really bored. For future people who will use this, I made this piece of software during the pandemic of COVID-19. 

The second reason, is that I need a big dataset of food pictures from `r/pizza` or `r/hotdogs`. I also need to have a big repository of memes, so I may use this script on `r/metalmemes` or `r/dankmemes` as well. Just saying though!

## How to use 

First, You need to install the gem. Second, add this line to your ruby script :

```ruby
require 'reddit_image_downloader'
``` 

Then, you can just get first 25 pics of `/r/pizza` like this : 

```
r = RedditImage.new("pizza")
r.download_images 
```

and it will add all 25 images in a directory called `downloads` in the root folder of the project. 

Need more pics? no worries : 

```
r = RedditImage.new("pizza", 50)
``` 

Want a new directory? Again, no worries : 

```
r = RedditImage.new("pizza", 50, "pizaa_pics")
``` 

And you also can add `new`, `hot` and `top` to the mix as well! 
