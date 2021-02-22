---
title: Sentry tips
linktitle: Sentry
menu:
  main:
    parent: Notes
---

Sentry is an awesome tool when it comes to retrieve all issues of a given
software. Unfortunately, the actual UI does not show properly issue severity.
The following CSS can be added (with Stylus for example) in order to make it
visual.

```
div#blk_router div.app > div.container div.ref-group-list > div * {
    z-index: 10 !important;
}
div#blk_router div.app > div.container div.ref-group-list > div {
    position: relative;
}
div#blk_router div.app > div.container div.ref-group-list > div > div:first-child {
    z-index: 99 !important;
}
div#blk_router div.app > div.container div.event-issue-header a > div.tip[title][data-original-title] {
    display: inline !important;;
    background-color: white !important;
    opacity: 20%;
    top: 0px !important;
    left: 0px !important;
    border: 0px !important;
    width: 100% !important;
    height: 100% !important;
    z-index: -1 !important;
}
div#blk_router div.app > div.container div.event-issue-header a > div.tip[title][data-original-title="Error level: Debug"] { background-color: cyan !important; }
div#blk_router div.app > div.container div.event-issue-header a > div.tip[title][data-original-title="Error level: Info"] { background-color: green !important; }
div#blk_router div.app > div.container div.event-issue-header a > div.tip[title][data-original-title="Error level: Warning"] { background-color: yellow !important; }
div#blk_router div.app > div.container div.event-issue-header a > div.tip[title][data-original-title="Error level: Error"] { background-color: orange !important; }
div#blk_router div.app > div.container div.event-issue-header a > div.tip[title][data-original-title="Error level: Fatal"] { background-color: red !important; }
```

This script was originally written by [@folays](https://github.com/folays).
