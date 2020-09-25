# Reddit Junkie

Reddit Junkie is a gem for [ruby](http://ruby-lang.org/) which lets you download images from a particular subreddit. 

## Why I made this?

First, I was really bored. For future people who will use this, I made this piece of software during the pandemic of COVID-19. 

The second reason, is that I need a big dataset of food pictures from `r/pizza` or `r/hotdogs`. I also need to have a big repository of memes, so I may use this script on `r/metalmemes` or `r/dankmemes` as well. Just saying though!

## How to use 

First, You need to install the gem. Second, add this line to your ruby script :

```ruby
require 'reddit_junkie'
``` 

Then, you can just get first 25 pics of `/r/pizza` like this : 

```
r = RedditImage.new("pizza")
r.download_images 
```

and it will add all 25 images in a directory called `images` in the root folder of the project. 

Need more pics? no worries : 

```
r = RedditImage.new("pizza", 50)
``` 

Want a new directory? Again, no worries : 

```
r = RedditImage.new("pizza", 50, "pizaa_pics")
``` 

And you also can add `new`, `hot` and `top` to the mix as well! 

## Getting more than 100 images 

First, you need to create a new `RedditImage` class. Then, use `get_info` method. It's like this : 

```ruby
r = RedditImage.new("pizza", 100, "pizzas", "new")
``` 

Then : 

```ruby 
r.get_info
``` 

It prints out a value for `after_pointer` which can look like `t3_iricfv` or something. Then, you make it something like this:

```ruby
r = RedditImage.new("pizza", 100, "pizzas2", "new", "t3_iricfv")
``` 

and when you do a call for downloading images, it downloads a new set of images for you. 
