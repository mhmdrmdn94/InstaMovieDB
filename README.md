# InstaMovieDB
Zero CocoaPods while building the MovieDB app sample




In this sample project I tried to use the [TheMovieDB](https://www.themoviedb.org)  api's to build a `Zero External Libraries` iOS project.

This helped me to create libs like Alamofire & SDWebImage and many more. 
I have built my full network layer based on _URLSession_ and built my own _InstaImageView_ class which 
simulates SDWebImage's stuff for downloading remote images.
   
I will try to keep updating this repository, I will try to enhance performance for the modules I use. and definitly will build new modules to reolace libs I wanna use.

### Features
* InstaImageView, which is a replace for `SDWebImage`
* InstaImageCache, which is a replace for `SDWebImage caching` technique 
* My own InfiniteScrolling, which is a replace for `UIScrollView-InfiniteScroll`
* Used `URLSession` to implement my network layer instead of `Alamofire`
* Applied `UnitTesting` for some module, I will always try to enhance the code coverage.
* Applied `VIPER` on movies list module.
* Applied `InstaEmptyState` for handling ErrorStates & EmptyStates

and many more.



### Communication
* If you **found a bug**, open an issue
* If you **have a feature request**, open an issue
* If you **have a feature request**, open an issue
* If you **need help or ask a question**, then send me a mail on `mhmdrmdn94@gmail.com`, subject: `InstaMovieDB`



### Author
[MoRamadan](https://www.linkedin.com/in/mhmdrmdn/) 
