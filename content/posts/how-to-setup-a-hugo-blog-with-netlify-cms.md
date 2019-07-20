---
title: How to Setup a Hugo Blog with Netlify CMS
date: 2019-07-20T15:03:14.508Z
---
This is how you create a Hugo static site and install  Netlify CMS. Netlify CMS is a free open-source tool for managing your content. You get setup with an /admin section of your site to write, edit, and publish your blog articles. 

I wanted to write this because I came across several gotchas that slowed me down, such as installing and updating a theme as well as configuring my Netlify site.

## **What is Hugo?**

Hugo is a static site generator. It's extremely fast and easy to get started. It's a great solution for creating a simple blog or portfolio site. In this guide we'll be hosting our site on Github. This allows us to host our blog for free.

First, install Hugo following the directions, [here:](https://gohugo.io/getting-started/installing) 

Next, setup a Github account if you don't have one already, [here](https://github.com/).

## **Create a Hugo Project**

Now that you have Hugo installed and a Github account created, let's create your blog. We'll name our site 'my-blog'.

1. Start in the directory you want your site to live. The command below will create a new directory named 'my-blog'.


```
hugo new site my-blog
```

Now let's add a theme. You can choose from a library of themes, [here](https://themes.gohugo.io/). If you plan to adjust your theme, I recommend starting with something light. I used [Hugo Theme Basic](https://themes.gohugo.io/hugo-theme-basic/).

```
# move into your new site folder

cd my-blog

# go ahead and initialize git

git init 

# move into your themes folder and copy the theme folder
cd themes
git clone https://github.com/siegerts/hugo-theme-basic.git
```

At this point, you may find instructions to install this using a 'submodule'. I don't recommend it. Instead, we'll just remove the git file in the theme folder. Then we'll commit this folder to your root project. This allows you to easily edit your theme without committing changes to a submodule, which is a huge pain, in my opinion.

```
# move to your root folder
cd ..

# push your new project to github

git add .git commit -m 'first commit of new blog'
git push origin master
```

You now have a new site committed to Github. You can view your site locally by starting the Hugo server

```
hugo server
```

This should open your browser and show your new site.

## Setting up Netlify

Now that you have your site pushed to Github. It's time to setup Netlify.

Here's what we'll do:

1. Setup an account on Netlify
2. Connect it to the GitHub repo you just created
3. Add Netlify CMS to your site files
4. Commit those files to your GitHub repo again
5. Send yourself an invitation via Netlify
6. Login to your back end.
7. Start publishing!

Head over to [netlify.com](http://netlify.com) and create an account. Once logged-in:

1. Under 'Sites' click 'Create New Site from Git'
2. Authenticate Your Github Account
3. Choose the repo you created before.
4. Under 'Build Command', enter 'hugo'
5. Under Publish Directory, enter 'public/'
6. Click 'Deploy Site'

That's it! On the next screen you'll find your new site url. Click the URL to view your site live. 

That's all it takes to setup continuous deployment with Netlify. Now, when you push your site to Github, Netlify will automatically redeploy your site. 

Next, be sure to setup your custom domain. I won't cover that in this tutorial. But it's pretty straightforward if you setup on Namecheap.

## **Setup Netlify CMS**

We already have Netlify setup. But we need to add Netlify CMS.

It's pretty easy to setup. Here are the [instructions](https://www.netlifycms.org/docs/add-to-your-site/) from Netlify. But we'll go through it together. 

The Netlify CMS files will reside in our /static folder. So we'll start here. In your static folder: 

```
# move to static folder
cd static

# add an admin folder, index.html file, and config.yml file

mkdir admin
touch admin/index.html
touch config.yml
```

Inside your index.html file, add the following HTML: 

```
<!doctype html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Content Manager</title>
</head>
<body>
  <!-- Include the script that builds the page and powers Netlify CMS -->
  <script src="https://unpkg.com/netlify-cms@^2.0.0/dist/netlify-cms.js"></script>
</body>
</html>
```

Now we need to update our config.yml file. Since we are using github, add the following code.

```
backend:
  name: git-gateway
  branch: master # Branch to update (optional; defaults to master)
```

Next, we need to setup where are image uploads will reside. Add this to your config.yml file. Make sure it's not indented.

```
media_folder: "static/images/uploads" # Media files will be stored in the repo under static/images/uploads
public_folder: "/images/uploads" # The src attribute for uploaded media will begin with /images/uploads
```

Those folders don't exist yet. Let's create them:

```
# in root folder

mkdir static/images
mkdir static/images/uploads
```

Last step. Now it's time to setup our **collections**. Collections inform Netlify how our content is structured. Based on this structure, Netlify will setup the content editor form you'll use to create new content, such as a new blog post.  

When you create a Hugo site, the **default content type is post.** Writing "hugo new post blog-1" will create a new post for you, named "blog-1". So let's setup our first collection for the post type.

Inside our config.toml file: 

```
# static/admin/config.yml

collections:
  - name: "blog" # Used in routes, e.g., /admin/collections/blog
    label: "Blog" # Used in the UI
    folder: "content/posts" # The path to the folder where the documents are stored
    create: true # Allow users to create new documents in this collection
    slug: "{{slug}}" # Filename template, e.g., YYYY-MM-DD-title.md
    fields: # The fields for each document, usually in front matter
      - {label: "Title", name: "title", widget: "string"}
      - {label: "Publish Date", name: "date", widget: "datetime"}
      - {label: "Body", name: "body", widget: "markdown"}
```

I called my section, "blog". You can change this name. As long as it points to content/posts, it will work fine.  Now let's push our changes again to Github

```
# in the root folder

git add .
git commit -m 'add Netlify CMS'
git push origin master
```

### **Send Netlify CMS Invitation**

Netlify CMS is now added to your site. Last thing is to send yourself an invitation. This allows you to setup a password to edit your site. 

1. Log back into Netlify
2. Click on your site
3. Click on 'Identify' in the menu
4. Click 'invite users'
5. Enter your email address and press 'Send'

Check your email address. Follow the instructions to setup your account. Once your account is setup, you can go to [mysiteurl.com/admin](http://mysiteurl.com/admin) to access Netlify CMS!

## Updating your Site

There's one caveat of creating content in Netlify. Each time you add content, such as create a new blog post, Netlify **pushes it to your Github profile**. This causes your local (what's on your computer) repo to be behind your remote (what's on github) repo.  As a result, if you change your site locally, such as update your theme,  you'll run into this error upon pushing changes to Github:

```
! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'https://github.com/pittman021/tims-blog.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

You simply need to pull the latest version of your site down to your local branch. 

**You should always use Git Pull fetch and download content from your remote repository before updating your site.** Otherwise, you'll need to either 1) start over or 2) go through the process of staging your changes. 

```
# in root

git pull origin master
```

That's it! Now, make changes to your theme or configuration, push changes again, and you're all set.

Those are all of the steps required to setup a Hugo site with Netlify. I hope this was helpful.
