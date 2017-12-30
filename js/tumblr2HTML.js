var Tumblr2HTML = {

    tumKey: "Yq3ibDCDSntTYJbN2ORpqVIT6gZQpzb67P3ADVyRHRZTCAS5rb",

    getPosts : function (tumblogName, callback) {    
        var list = document.createElement("ul");
        list.classList.add("tumblr-posts");
    
        // Define request
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                // On success, create html post list from tumblr object
                var tumObj = JSON.parse(this.responseText);

                // Create list items from posts
                var posts = tumObj.response.posts;
                posts.forEach(function(post) {
                    var newPost = document.createElement("li");
                    var body = document.createElement("p");    
                    newPost.classList.add("post");

                    var timestamp = formatTimeStamp(post.timestamp);
                    
                    if (post.type == "photo")
                        body.innerHTML = photoPost(post.photos[0].original_size.url, timestamp, post.post_url);
                    else
                        body.innerHTML = textPost(post.title, post.summary, timestamp, post.post_url);

                    newPost.appendChild(body);                    

                    // Add post to list
                    list.appendChild(newPost);
                });
                
                // Send complete list to callback
                return callback(list);
            }
      };

      // Send request
      var reqUrl = "https://api.tumblr.com/v2/blog/" + tumblogName + ".tumblr.com/posts?api_key=" + this.tumKey;      
      xhttp.open('GET', reqUrl, true);
      xhttp.send();
    }

}

// Custom formatters 

var textPost = function(title, body, timestamp, link) {
    var preview;
    if (title)
        preview = title;
    else 
        preview = body;

    return "<a href='" + link + "'>" + "\"" + preview + "\"" + "</a>" + " - " + timestamp;
}

var photoPost = function(imgUrl, timestamp, link) {
    return "<a href='" + link + "'>" + timestamp + "</a>" + ":<br />" + "<img src='" + imgUrl + "' />";
}

function formatTimeStamp(utcSeconds) {
    var date = new Date(0);
    date.setUTCSeconds(utcSeconds);
    return date.getMonth() + "/" + date.getDay() + "/" + date.getFullYear();
}