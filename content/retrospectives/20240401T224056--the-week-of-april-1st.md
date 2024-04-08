+++
title      = "The Week of April 1st"
date       = 2024-04-01T22:40:56-04:00
tags       = []
identifier = "20240401T224056"
slug       = "the-week-of-april-1st"
summary    = "This week is not yet over, so this entry is incomplete."
+++

## Goals
| #                                       | Goal                              | Grade |
|:----------------------------------------|:----------------------------------|:------|
| [1](#work-on-self-hosted-llm-interface) | Work on self hosted LLM interface | A     |
| [2](#budget-my-time)                    | Budget my time[^1]                | C     |
| [3](#do-my-taxes)                       | Do my taxes                       | A     |

## Notes
### Work on self hosted LLM[^2] interface
I started a [Django](https://www.djangoproject.com/) project for this. I already know of at least one implementation of a [streaming chatgpt app in Django](https://www.youtube.com/watch?v=8JSiiPW4S0A), so I know that it should be fairly trivial to implement, at least in the same way. The implementation uses [Django Channels](https://channels.readthedocs.io/en/latest/) and [websockets](https://websockets.readthedocs.io/en/stable/howto/django.html), but I may opt to use Server Send Events (with [EventStream](https://github.com/fanout/django-eventstream)) instead, as they should have the benefit of not relying so much on the client, which I anticipate will be a plus.
### Budget my time
I did this rougly, though I did not manage to actually reach the goals set out in my time tracker. At the very least I roughly approximated that I had 20 free hours to spend per week and allotted half to *freelance* and half to the above mentioned LLM interface. I put more hours into the latter than was tracked on my time tracker because I decided not to track time on Sundays. Not for any particular reason. Just a vibe.
### Do my taxes
Did them. Got rejected. Found the missing document and added it, and then did it again. Hopefully this will be much easier next year now that I have a method of tracking every single one of my purchases, meaning I can potentially [itemize my deductions](https://www.irs.gov/taxtopics/tc501).

[^1]: I realized this about my time-tracking: I can now try to allot my time to my various tasks and TODOs. I have previously very strictly pre-scheduled my time, but the difference will be that at any point when I am wondering what to do, I can simply ask what I still need to spend time on. Luckily my time tracker of choice, Timetagger, can help with this since it has support for goals. 

[^2]: Large Language Model
