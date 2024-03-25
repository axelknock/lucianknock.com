+++
title      = "The Week of March 18th"
slug       = "the-week-of-march-18th"
date       = 2024-03-18T21:20:47-04:00
tags       = []
identifier = "20240318T212047"
summary    = "Went to game night, thought of elisp, and technically wrote something."
+++

## Goals
| #                                                          | Goal                                                    | Grade |
|:-----------------------------------------------------------|:--------------------------------------------------------|:------|
| [1](write-a-join-indirect-buffers-function)                | Write a `join-indirect-buffers` function                | D     |
| [2](time-everything-consistently)                          | Time everything consistently                            | A     |
| [3](go-to-game-night)                                      | Go to game night                                        | A     |
| [4](write-something-not-a-retrospective-and-worth-sharing) | Write something not a retrospective (and worth sharing) | B     |
| [5](add-tags-pagination-to-my-website)                     | Add tags/pagination to my website                       | F     |

## Notes
### Write a `join-indirect-buffers` function
Here is the workflow I imagined this for:
1. You're working in a file
2. You need to query a large language model about a specific function or have it try to write something
3. Select the context you want it to have, and run `make-indirect-buffer`
4. Use [gptel](https://github.com/karthink/gptel), or whichever emacs LLM interface you like to make the query
5. Keep the query/extra context, while the generated code goes back to the original buffer
There are a couple of realizations. Firstly, this is already possible by simply moving the selected region to a new buffer, interacting with the LLM, and then moving the selected text (valid code) back to the same location I generated the text. This will be possible with a Emacs' inbuilt registry system, which can store locations.
### Time everything consistently
The week before this one I recorded 51h34m. This week I measured 60h30m. Measuring my work time is a baseline as it makes reporting on my time much easier, so that's about 40 hours I will measure anyway. That means I managed to record about twice as many outside-of-work hours as last week. Pretty good!
### Go to game night
I did indeed go to game night, but this goal made me realize that I should not set Pass/Fail goals. They do not leave enough room to manuever, or try something new. At least I went, and I had fun, having found a very interesting game called [Illusion](https://pandasaurusgames.com/products/illusion)
### Write something not a retrospective (and worth sharing)
Since I anticipate writing about it more in the future, I took the time to prepare my [Emacs configuration](https://github.com/axelknock/.emacs.d) for sharing. Then I wrote a blog post about [how to use my Emacs configuration](https://lucianknock.com/blog/my-emacs-configuration/).
### Add tags/pagination to my website
Did not manage this.
