---
title: Shipping Gardenshq.com
date: 2018-11-23 20:53:50
draft: false
---

I’ve shipped my latest side project, gardenshq.com, a personal CRM geared around gift giving.

This idea came from my girlfriend who was storing all her contacts and gifts in a google sheet, with no easy way to be 1) notified of upcoming dates 2) saving gifts she found around the web and 3) organizing gifts around holidays and birthdays. She’s a power gifter and she something with more oomph.

Aside from customer development (I had one thus far), I’m going to outline the process of creating this MVP from scratch, including:

- creating my hypothesis, assumptions & criteria for success
- research: competitive analysis
- user stories for v1, v2, v3 of the app
- wireframing & data model for v1
- coding & deployment
- ideation, hypothesis, assumptions

MVPs are akin to science experiments. In this case we outline our problem, our solution, and hypothesis. Typically we wouldn’t build this outright, but I want to ship 🔥

**Problem:**

There’s no central place to save gifts to reference later for important dates of your family and friends. There are either full personal crms, or shop specific services.

**Solution**

Allow users to save gifts and their contacts in a single place to reference later

**Hypothesis**

I believe that power shoppers will sign-up for a website because it will help them manage their online shopping

Assumptions: In order for this prod to be successful, the following must be true:

- People have a tough time remembering gifts and their network’s dates
- People will pay for an app to manage gifts and contacts
- People will spend time to input contacts into Gardens
- People find it too difficult to do this with free tools, sheets, airtable, etc.

**Scope: what we’re building** 🚀

v1

Ability to add/delete contacts with basic contact info (name, address, birthday)

Ability to add/remove gifts for contacts, saving title and url

2 week reminder of birthday reminder and includes gifts in email

Login, logout, sign up, homepage

v2

Create gift lists and add contacts to them

Import contacts from csv. Nobody wants to hand-code contacts

Dashboard list of upcoming birthdays; gift, contact, list counts

V3

Add custom dates outside of birthday

**Wireframes**

_Creating a basic landing page with the primary value proposition and additional benefit statements below._

_A v1 of the dashboard, showing upcoming birthdays, latest gifts, and the number of contacts, gifts, and lists you have._

_The contacts index page, where I can view all my contacts in a table and click to view each one._

_Lastly, a contacts update page, where I can update basic contact details or delete a contact._

First its best to define the models. Otherwise, even as the app creator, you can get confused what is what. And it’s even more confusing when communicating with designers, or developers.

## [](https://timpittman.co/2018/11/23/Shipping-Gardenshq-com/#Definitions)Definitions:

User → end user with an account

Contact → a user has many contacts they manage

Gift → a URL/title of an item for a specific contact

List → a group of contacts needing a category of gifts, ex, birthday, Christmas, etc

## [](https://timpittman.co/2018/11/23/Shipping-Gardenshq-com/#User-Stories)User Stories

As a user, I can create a new contact and add basic contact details & saves notes

As a user, I can add a gift and attach it to a specific contact of mine

As a user, I can create a gift list and add contacts to that gift list

As a user, I can import contacts via CSV file, in order to easily add existing contacts rather than create from scratch

As a user, I can view all my contacts, view a single contact, and edit or delete that contact.

As a user, I can view upcoming birthdays, all my lists, in a single dashboard view.

## [](https://timpittman.co/2018/11/23/Shipping-Gardenshq-com/#Data-Models)Data Models

In each app I’ve created, my biggest mistake has been not carefully thinking about data models. Not only will this clarify your thinking of how your data will be structured, but also how it may grow in the future. This is the foundation of your application and must be carefully planned.

This is a fugly rough version of my data model: [https://docs.google.com/drawings/d/1F5YLl6lhsmnJyPOOIzpg2pxslLGApo135lzNTbzK-Bo/edit?usp=sharing](https://docs.google.com/drawings/d/1F5YLl6lhsmnJyPOOIzpg2pxslLGApo135lzNTbzK-Bo/edit?usp=sharing)

The major benefit of outlining this ahead of time is thinking through

what fields and field types you need on each model. This avoids getting stuck midway through development and wrangling with database seeds and migrations during building time

what relationships you’ll have. will you have one-to-one or one-to-many or even more complex relationships? think through those first before you start building

Building

Since this project wasn’t strictly a project I had planned to validate as quickly as possible and try to monetize, I experimented with Ruby on Rails. I’m more comfortable in Node/Mongo/Express/React. But I’ve just read so much about the speed and conventions of Rails I thought I’d give it a try.

I won’t go into the step-by-step guide of building this out, but here’s my takeaways from the project.

Building in whatever stack you’re familiar with is likely the fastest. Rails took a very long time because it was new. I only started seeing benefits towards the end

ActiveRecord for MVPs, might be the most elegant and speedy way to manage your data. I really began to love it process of creating and seeding data in postgresSQL, which has some benefits over NoSQL dbs, like Mongo

Building a dynamic front-end in Rails is frustrating. I really don’t want to use jQuery and rails convention for handling Ajax with via templates. I like it all in JavaScript (though you can do this with rails)

Love it or hate it, JavaScript and Node is outpacing ruby & rails. So I’ll keep using these languages moving forward.

## [](https://timpittman.co/2018/11/23/Shipping-Gardenshq-com/#Learnings)Learnings

This wasn’t a major project. So I don’t suspect it to be used by very many people outside of maybe my girlfriend =) Here’s some takeaways and learnings I’ll use for next time.

- Stated above, stick to your stack of choice. Mine is node, mongo, express. These are just tools, don’t make them the focus. Stick with what’s comfortable, keep it as simple as possible.
- Actually do customer development & competitive analysis. There are other tools out there to manage your contacts. This perhaps does a worse job. Monica, Airtable, google sheets, Ryze, and others do a fine job and I likely wouldn’t have competed unless this was a pet project.
- Rails actually is very convenient for CRUD apps: I created mailers, a CSV importer, authentication pretty quick relative to my knowledge
- Always wireframe and data model beforehand. Because I was riffing this project, I freestyled it a bit. Even with this simple app in my head, I wrangled with page templates, routing, etc. because it wasn’t 100% confirmed beforehand.

Building Apps may be the easiest part. I learned Ruby from a $9 udemy course + google. If I can do it, anyone can do it. What is harder is shipping very quickly, getting feedback, creating something people actually want and provides value, knowing when to quit.
