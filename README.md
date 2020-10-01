# Reddit Junkie

Reddit Junkie is a gem for [ruby](http://ruby-lang.org/) which lets you download images from a particular subreddit. 

## Why I made this?

First, I was really bored. For future people who will use this, I made this piece of software during the pandemic of COVID-19. 

The second reason, is that I need a big dataset of food pictures from `r/pizza` or `r/hotdogs`. I also need to have a big repository of memes, so I may use this script on `r/metalmemes` or `r/dankmemes` as well. Just saying though!

## CLI tool

### Installing the reddit_junkie tool 

On a Linux, BSD, macOS or WSL machine, you need to install ruby first. my personal preference is always [RVM](http://rvm.io), but as long as what you have installed can handle `httparty` gem, that's OK. 

For installing, just run this command: 

```
gem install reddit_junkie
```

and it'll be available as a command line tool for you.

### Downloading 25 images, in the default "images" directory 

```
reddit_junkie --subreddit SUB
```

for example, if you want the latest things from [r/skyporn](http://reddit.com/r/skyporn) you just run : 

```
reddit_junkie --subreddit skyporn
``` 

### Downloading 25 images in a custom directory 

```
reddit_junkie --subreddit SUB --directory DIR
```

For example, you've built a folder called `sky` and you want to save the pictures there. Also, if you haven't created the folder, `reddit_junkie` will create it for you. 

```
reddit_junkie --subreddit skyporn --directory sky
```

### Downloading more than 25 images in default "images" directory

```
reddit_junkie --subreddit SUB --count COUNT
```

For example, you want to download 300 pictures of the sky : 

```
reddit_junkie --subreddit skyporn --count 300
```

### Downloading more than 25 images in a custom directory

```
reddit_junkie --subreddit SUB --count COUNT --directory DIR
```

For example, you want to download 300 pictures of the sky, in your `sky` directory : 

```
reddit_junkie --subreddit skyporn --count 300 --directory sky
```

### Known issues / not tested 

* The CLI tool isn't tested with the `--endpoint` flag yet. It seems OK though. 
* In case of more than 100 images, you only can do the download for numbers dividable by 100. Like 300 or 1000 or 25000. As I made this tool to help me make a dataset, I haven't spent much time on fixing this issue. 
* CLI flags/parameters reading isn't really good. It works just fine, but not absolutely in the POSIX way. 

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

## TODO 

- [x] Providing a better naming for the downloaded images. 
- [x] Fixing `after_pointer` issue. 
- [x] Providing the CLI tool.
- [ ] Refactoring currenct CLI tool.
- [x] Large Downloads handling. 
- [x] Check if the directory exists or not.
