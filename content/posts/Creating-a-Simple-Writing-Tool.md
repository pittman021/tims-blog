---
title: Creating a Simple Writing Tool
date: 2019-04-23T21:40:48.000Z
---
Earlier this year I did came across a book titled [The Artist's Way](https://www.amazon.com/Artists-Way-25th-Anniversary/dp/0143129252). This book outlines a journaling habit and other activities that are intended to unlock your creativity. It calls for writing by hand 750 words each day for a month. You freewrite without stopping & throw away the draft when you're done. 

I decided to pick this habit to develop a productive morning routine & keep my head clear and remain focused. I felt the benefits. But unfortunately, the habit of writing, by hand, 3 full pages of text became cumbersome and I stopped. So I began writing it by computer and I feel much of the same benefits. 

This is when I began wanting a way to track my progress & keep my streak alive. Evernote & other journaling tools aren't quite designed for that. I came across [750words.com](750words.com) - an excellent site. But it charges after a month and I don't love the design.  

So I created my own. 

You can view it here, at [write daily](timpittman.co/write-daily). It tracks your daily progress, auto-saves your drafts as you stop writing, and most of all, is completely free, contains 0 ads, and 0 popups. Your progress is tracked in your browser storage. You can delete it anytime. But be sure not to clear your cookies. 

Implementing this was fun. Here's what I did: 

It contains just three files: index.html, index.js, and index.css. Because of this it's extremely fast and lightweight.

The HTML is very simple with just 50 lines. 

```html
 <div class="main">
     <div class="header">
        <h1>Simple Journal</h1>
        <h3 class="grey" id="todays-date">Today's Date</h3>
    </div>
        <div id="month-dates"></div>
        <div class="textarea-container">
                <textarea id="textArea"></textarea>
        </div>
    </div>
        <div class="footer">
            <div class="main">
                <div class="row">
                    <div class="column">
                            <p>Word Count: <span id="count"></span></p>
                            <p class="green text-small" id="save-status"></p>
                    </div>
                    <div class="column">
                    </div>
                </div>   
            </div>
        </div>
    </div>
```

Next is the fun part. The JavaScript that does all the hard work of saving & fetching your data. It consists of one component named 'Journal', which contains a variety of methods & data. 

```javascript
class Journal {
    constructor() {
        this.text = 'hello';
        this.wordCount = 0;
        this.data = JSON.parse(localStorage.getItem('drafts'));
        this.save = true;
        this.timeoutId;
        
        // get things going // 
        this.cacheDom();
        this.bindEvents();
        this.setInitialContent();
        this.buildButtonList();
    }
```

Here I create my Journal function which consists of a contructor function to setup my data. Next I kick-off the app with a series of functions.

```javascript
  cacheDom() {
        this.textArea = document.querySelector('#textArea');
        this.count = document.querySelector('#count');
        // var wordGoal = document.querySelector('#word-goal');
        this.saveStatus = document.querySelector('#save-status');
        this.todaysDate = document.querySelector('#todays-date');
        this.monthDates = document.querySelector('#month-dates');
        this.tx = document.getElementsByTagName('textarea');
    }

    bindEvents() {
        textArea.addEventListener('keyup', (e) => this.setText(e));
        this.monthDates.addEventListener('click', (e) => this.chooseDraftDate(e));
        textArea.addEventListener("input", this.OnInput, false);
        }
```

Next I cache my HTML elements and bind event listeners I need. These track any 'textArea' changes to save items and adjust textArea input size. 

```javascript
      setInitialContent() {
        var date = new Date(new Date().toDateString()).toString();
        var arr = [];
        var obj = { 
            draft: this.text,
            date: date
        }
        // setup new localStorage object for a new session.
        arr.push(obj);
        this.todaysDate.innerHTML = moment().format('MMMM Do, YYYY');

        // if there's no saved drafts in session, create a new one & display it. 
        if (!this.data) {
            this.text = "Get started writing!";
            this.data = arr;
            this.render();
        
        // if there's data saved, find today's record. If no record for today, setup new one. 
        } else {
            var pos = this.data.map(function(e) { return e.date; }).indexOf(date);

            // if no post for today. tis a new day! 
            if(pos === -1) {
                this.data.push(obj);
                this.text = "Today is a new day! Start writing =)";
                this.render();
            } else {
            // if there is today's post. show it in textArea // 
            this.text = this.data[pos].draft
            this.render();
            }
        }
    }
```

This huge function sets up all of my initial data. If you're a new user it creates initial content. If it's a new day, it creates starter text & renders the component. Lastly, if there is data for today it grabs it and renders it in the textArea. 

```javascript
render() {
        this.textArea.value = this.text
        this.count.innerText = this.getWordCount(this.text);
        this.textArea.style.height = 'auto';
        this.textArea.style.height = (this.textArea.scrollHeight) + 'px';
        this.setStorage(this.data)
    }
```

What's really fun is the render method. Which is called anytime our data changes. It's a very simple version of Vue or React. Once any data changes this method can be called to update the textArea value & save our data. 

```javascript
saveDraftToStorage() {
        var date = new Date(new Date().toDateString()).toString();

        // check whether save var is true, which is set when date is today. cant save old posts // 
        if(this.save) {

        // there should always be a draft
            var pos = this.data.map(function(e) { return e.date; }).indexOf(date);
            
            // if date is not found. push new record for that date // 
            if(pos === -1) {
                var obj = {
                    draft: this.text,
                    date: date
                }
                this.data.push(obj);
                this.setStorage(this.data);
                this.saveStatus.innerHTML = 'post saved';
                    setTimeout(function() {
                        saveStatus.innerHTML = '';
                    }.bind(this), 2000)
                
                // update draft if date already exist // 
                } else {
                    this.data[pos].draft = this.text
                    this.setStorage(this.data);
                    this.saveStatus.innerHTML = 'post saved';
                    setTimeout(function() {
                        this.saveStatus.innerHTML = '';
                    }.bind(this), 2000)
                }

        }
    }
```

The logic here just ensures 1) The post is saved in the correct day and 2) it overwrites the existing post if it already exists for today. Lastly, it checks that save === true in our data object, which is set to active only when you're viewing today's draft. 

This is called every 3 seconds once typing has stopped. I track that with this next event listener: 

```javascript
setText(e) {
        this.text = e.target.value;
        if(e.keyCode === 32) {
            if (this.timeoutId) clearTimeout(this.timeoutId);
        
            // Set timer that will save comment when it fires.
            this.timeoutId = setTimeout(this.saveDraftToStorage.bind(this), 3000);
        }
        this.render()
    }
```

What's fun is that I need to bind the context of this when calling saveDraftToStorage. Otherwise the context is set to 'this', which is the event being handled.

Lastly, I need to render the buttons for each day. These show your streak and let you view previous posts. 

```javascript
buildButtonList() {
    var days = this.daysInMonth( moment().month() );
    days.forEach(function(day,key) {
        var dayMonth = key + 1;
        // get the month 
        var m = new Date().getMonth();
        var date = new Date(new Date(2019,m,dayMonth).toDateString()).toString();
        if(!this.data) {
            this.addDateButton(day,dayMonth,date, true);
            
        } else {
            var pos = this.data.map(function(e) { return e.date; }).indexOf(date);
            if(pos === -1) {
                this.addDateButton(day,dayMonth,date, true)
            } else {
                this.addDateButton(day,dayMonth,date, false);
            }
        }
    }.bind(this));
    }
```

This guy is kinda messy. But essentially it loops through each day of the month, which I use moment.JS to help with. Then after a quick check whether there is any data available, I check whether today's date is in our data. If so, I generate the button in a separate function, passing in it's status (active or passive), and the date info. Notice again I need to bind my forEach function to this class's context. 

That's mainly it! There are a few other things going on that are minor. But this is a really great example of how you can build quick components without using frameworks. It is also a great way to structure your javascript, with data at the top, eventlisteners binded in a single place, and methods towards the bottom. This prevents all sorts of spaghetti code where data is passed around or tied to the UI. 

The major challenge with this app is handling dates. It's particularly painful to compare dates, store them, and get data per day, etc. I eventually used momentJS, which really helps with formatting & comparing dates, which native Date API lacks. Sometimes it just makes sense to leverage other people's great work and not write everything from scratch.
