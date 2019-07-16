---
title: Adjust Hugo Theme
date: 2019-07-16T13:38:22.221Z
---
If you are like me and have some technical ability and knowledge of git, you'll likely opt-in to creating a static site hosted on a free service, such as github or netlify. This is a relatively easy and free way to host a simple blog or portfolio site. 

I started with Hexo because I'm familiar with Node. But the language actually doesn't matter. What matters is the popularity and usage - which makes troubleshooting easier and theme options greater. 

I chose Hugo. It's written in Go. I don't know a lick of Go. But it's very fast & there's lots of questions on stackoverflow, basic themes and support.

## Adjusting your theme

The biggest headache I came across was setting up a theme. When you clone a theme you create a 'submodule' in Git. Please let me spare you this headache. Unless you are familiar with this and pretty advanced with Git, you'll face problems committing changes. 

Here is how you simply install a theme & avoid submodules. 

```
# start at your root folder# install your themegit clone http://url-to-themerm -rf theme-folder-name/.git# now go back and check in your new foldecd .git add themes/theme-folder-name
```

And that's it. What this does is remove the submodule from git & allows you to simply commit your changes to your root folder git repository. 

Now you can edit your theme files and commit them to git easily.
