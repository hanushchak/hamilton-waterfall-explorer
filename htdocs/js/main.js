// Author: Maksym Hanushchak, 000776919

// Declare variables
let map, watefalls, reviews, waterfall;

// Load the map
function loadMapScenario() {
    map = new Microsoft.Maps.Map(document.getElementById('map'), {
        center: new Microsoft.Maps.Location(43.255203, -79.843826), // Centers the map on Hamilton
        zoom: 10
    });
    loadWaterfalls(false);
}

// Display/hide private waterfalls toggle
$("input[name='options']").click(function () {
    if ($("input[id='hide_private_toggle']:checked").val()) {
        loadWaterfalls(false);
    } else {
        loadWaterfalls(true);
    }
});

// Post a review
$("#review_form").submit(function (e) {
    e.preventDefault();
    let review_name = $("#reviewNameInput").val();
    let waterfall_id = waterfall.waterfall_id;
    let review_text = $("#reviewText").val();
    let review_rating = $("input[name='inlineRadioOptions']:checked").val();


    $.ajax({
        type: "POST",
        url: "./php/post_review.php",
        data: "waterfall_id=" + waterfall_id + "&review_name=" + review_name + "&review_text=" + review_text + "&review_rating=" + review_rating,
        success: function (data) {
            if (data) {
                fetchReviews(waterfall_id);
                $("#reviewNameInput").val("");
                $("#reviewText").val("");
                showSuccessAlert("Your review has been posted successfully :)")
            } else {
                showErrorAlert("An error occured while posting your review :(")
            }

        },
        dataType: "text"
    });
});

// Display top rated waterfalls
$("#top_rated").click(function () {
    let high_rated;
    $("#top_rated_list").html("");

    $.ajax({
        type: "POST",
        url: "./php/fetch_highest_rating.php",
        success: success,
        dataType: "json"
    });

    function success(data) {
        high_rated = data;
        if (high_rated.length != 0 && high_rated[0].average_rating !== null) {

            for (let i = 0; i < high_rated.length; i++) {
                if (high_rated[i].average_rating != 0 && high_rated[i].average_rating != null) {
                    getWaterfallInfo(high_rated[i].id)
                    let count = i + 1;
                    let rating_visual = "";


                    let tempRating = parseInt(high_rated[i].average_rating);
                    for (j = 0; j < 5; j++) {
                        if (tempRating == 0 || !tempRating || tempRating == null) {
                            rating_visual = (rating_visual || "") + "<span class='fa fa-star' style='margin-top: 5px;'></span>";
                        } else {
                            rating_visual = (rating_visual || "") + "<span class='fa fa-star star_checked' style='margin-top: 5px;'></span>";
                            tempRating--;
                        }
                    }


                    $("#top_rated_list").append("<a href='#' data-dismiss='modal' id='" + high_rated[i].id + "' class='waterfalls_list_link list-group-item list-group-item-action'><div class='d-flex w-100 justify-content-between'><h5 class='mb-1'><b>" + count + "</b>&nbsp;<span> - " + waterfall.waterfall_name + "</span></h5><h5><span class='badge badge-success'> Average Rating: " + high_rated[i].average_rating + "<br>" + rating_visual + "</span></h5></div></a>");
                    rating_visual = "";
                }
            }
        } else {
            $("#top_rated_list").append("<div class='list-group-item d-flex w-100 justify-content-center'><h5 class='mb-1'>No waterfalls have been rated :(</h5></div>");
        }
    }
});

// Show waterfall on map button event
$("#show_on_map_button").click(function () {
    map.setView({
        center: new Microsoft.Maps.Location(waterfall.waterfall_latitude, waterfall.waterfall_longtitude),
        zoom: 17
    });
});

// Global click listener, reacts on link with class waterfall_list_link
$(document).on("click", "a.waterfalls_list_link", function () {
    showWaterfallInfo($(this).attr('id'));
});



// Display most reviewed waterfalls
$("#most_reviewed").click(function () {

    let most_reviewed;
    $("#most_reviewed_list").html("");

    $.ajax({
        type: "POST",
        url: "./php/fetch_most_reviewed.php",
        success: success,
        dataType: "json"
    });

    function success(data) {
        most_reviewed = data;
        if (most_reviewed.length != 0 && most_reviewed[0].number_of_reviews != 0) {

            for (let i = 0; i < most_reviewed.length; i++) {
                if (most_reviewed[i].number_of_reviews != 0) {
                    getWaterfallInfo(most_reviewed[i].id)
                    let count_reviews;
                    let count = i + 1;
                    if (most_reviewed[i].number_of_reviews == 1) {
                        count_reviews = most_reviewed[i].number_of_reviews + " review"
                    } else {
                        count_reviews = most_reviewed[i].number_of_reviews + " reviews"
                    }
                    $("#most_reviewed_list").append("<a href='#' data-dismiss='modal' id='" + most_reviewed[i].id + "' class='waterfalls_list_link list-group-item list-group-item-action'><div class='d-flex w-100 justify-content-between'><h5 class='mb-1'><b>" + count + "</b>&nbsp;<span> - " + waterfall.waterfall_name + "</span></h5><h5><span class='badge badge-success'>" + count_reviews + "</span></h5></div></a>");
                }
            }
        } else {
            $("#most_reviewed_list").append("<div class='list-group-item d-flex w-100 justify-content-center'><h5 class='mb-1'>No reviews have been posted :(</h5></div>");
        }
    }
});

// Clear the map
function removePushPins() {
    for (var i = map.entities.getLength() - 1; i >= 0; i--) {
        var pushpin = map.entities.get(i);
        if (pushpin instanceof Microsoft.Maps.Pushpin) {
            map.entities.removeAt(i);
        }
    }
}

// Load the watefalls from the database
function loadWaterfalls(private) {
    removePushPins();
    getLocation();
    waterfalls = null;

    $.ajax({
        type: "POST",
        url: "./php/fetch_waterfalls.php",
        success: success,
        dataType: "json"
    });

    function success(data) {
        waterfalls = data;
        if (private) {
            for (i = 0; i < waterfalls.length; i++) {


                var location = new Microsoft.Maps.Location(
                    waterfalls[i].latitude,
                    waterfalls[i].longitude
                );

                if (waterfalls[i].ownership == "private") {
                    var pushpin = new Microsoft.Maps.Pushpin(
                        location, {
                            title: waterfalls[i].name,
                            color: '#cc7700'
                        });
                } else {
                    var pushpin = new Microsoft.Maps.Pushpin(
                        location, {
                            title: waterfalls[i].name,
                            color: '#283C98'
                        });
                }

                pushpin.metadata = {
                    waterfall_id: waterfalls[i].id,
                };

                Microsoft.Maps.Events.addHandler(pushpin, 'click', pushpinClicked);

                map.entities.push(pushpin);


            };
        } else {
            for (i = 0; i < waterfalls.length; i++) {
                if (waterfalls[i].ownership !== "private") {
                    var location = new Microsoft.Maps.Location(
                        waterfalls[i].latitude,
                        waterfalls[i].longitude
                    );

                    var pushpin = new Microsoft.Maps.Pushpin(
                        location, {
                            title: waterfalls[i].name,
                            color: '#283C98'
                        });

                    pushpin.metadata = {
                        waterfall_id: waterfalls[i].id,
                    };

                    Microsoft.Maps.Events.addHandler(pushpin, 'click', pushpinClicked);

                    map.entities.push(pushpin);
                }
            }
        }
    }

};

// Show success alert
function showSuccessAlert(text) {
    $("#success_alert_text").text(text);
    $("#success_alert").fadeTo(1500, 500).slideUp(500, function () {
        $("#success_alert").slideUp(500);
    });
};

// Show error alert
function showErrorAlert(text) {
    $("#error_alert_text").text(text);
    $("#error_alert").fadeTo(1500, 500).slideUp(500, function () {
        $("#error_alert").slideUp(500);
    });
};

// Get user's location
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
        $("#error_div").hide();
    } else {
        $("#error_message").text("Geolocation is not supported by this browser.");
        $("#error_div").show();
    }
}

// Show user's location
function showPosition(position) {

    located = true;

    $("#error_div").hide();

    myPosition = position;

    map.setView({
        center: new Microsoft.Maps.Location(position.coords.latitude, position.coords.longitude),
        zoom: 12
    });

    var pushpin = new Microsoft.Maps.Pushpin(map.getCenter(), {
        title: "Your Location",
        color: 'red',
        enableHoverStyle: false,
        enableClickedStyle: false
    });

    pushpin.metadata = {
        title: 'Your Location',
        description: 'Latitude: ' + position.coords.latitude +
            '<br>Longitude: ' + position.coords.longitude
    };

    map.entities.push(pushpin);
}

// Pushpin clicked event handler
function pushpinClicked(e) {
    if (e.target.metadata) {
        showWaterfallInfo(e.target.metadata.waterfall_id);
    }
}

// Gets info about currently selected waterfall
function getWaterfallInfo(waterfall_id) {

    for (i = 0; i < waterfalls.length; i++) {
        if (waterfalls[i].id == waterfall_id) {
            waterfall = {
                waterfall_id: waterfalls[i].id,
                waterfall_name: waterfalls[i].name,
                waterfall_community: waterfalls[i].community,
                waterfall_type: waterfalls[i].type,
                waterfall_height: waterfalls[i].height,
                waterfall_ownership: waterfalls[i].ownership,
                waterfalls_access_from: waterfalls[i].access_from,
                waterfall_latitude: waterfalls[i].latitude,
                waterfall_longtitude: waterfalls[i].longitude
            }
        }
    }

}

// Shows info about selected waterfall in the modal
function showWaterfallInfo(waterfall_id) {
    getWaterfallInfo(waterfall_id);

    if (waterfall.waterfall_ownership == "private") {
        $("#review_heading").text("You cannot leave reviews for private watefalls.")
        $("#review_text").hide();
        $("#avg_rating").hide();
        $("#review_form").hide();
        $("#waterfall_access").css("color", "red");
        $("#waterfall_access").text("(private)")
    } else {
        fetchReviews(waterfall_id);
        $("#review_text").show();
        $("#avg_rating").show();
        $("#review_form").show();
        $("#waterfall_access").css("color", "green");
        $("#waterfall_access").text("(public)")
    }

    $("#waterfall_name").text(waterfall.waterfall_name);
    $("#waterfall_name_heading").text(waterfall.waterfall_name);
    $("#waterfall_type").text(waterfall.waterfall_type);
    $("#waterfall_height").text(waterfall.waterfall_height + " m");
    $("#waterfall_community").text(waterfall.waterfall_community);
    $("#waterfallInfoModal").modal();
}

// Get reviews for currently selected waterfall
function fetchReviews(waterfall_id) {
    $("#stars").html("");
    $("#review_text").html("");
    $.ajax({
        type: "POST",
        url: "./php/fetch_reviews.php",
        data: "waterfall_id=" + waterfall_id,
        success: function (data) {

            var average_rating;
            let count;
            let rating_visual;
            for (i = 0; i < data.length; i++) {

                let tempRating = parseInt(data[i].review_rating);
                for (j = 0; j < 5; j++) {
                    if (tempRating == 0 || !tempRating || tempRating == null) {
                        rating_visual = (rating_visual || "") + "<span class='fa fa-star'></span>";
                    } else {
                        rating_visual = (rating_visual || "") + "<span class='fa fa-star star_checked'></span>";
                        tempRating--;
                    }
                }
                $("#review_text").prepend("<div class='list-group-item'><div class='d-flex w-100 justify-content-between'><h5 class='mb-1'>" + data[i].review_name + "</h5><small>" + data[i].review_date + "</small></div><p class='mb-1'>" + data[i].review_text + "</p><small>" + rating_visual + " " + data[i].review_rating + "/5</small></div>")
                rating_visual = "";
                average_rating = (average_rating || 0) + parseFloat(data[i].review_rating);
                count = (count || 0) + 1;
            }
            average_rating = average_rating / count;

            $("#rating").text(average_rating.toFixed(2));

            average_rating = parseInt(average_rating);
            if (average_rating) {
                $("#no_ratings_span").hide();
                $("#rating_div").show();
                $("#review_heading").text("Recent Reviews");
                count = 5;
                while (count !== 0) {
                    if (average_rating == 0 || !average_rating) {
                        $("#stars").append("<span class='fa fa-star'></span>");
                    } else {
                        $("#stars").append("<span class='fa fa-star star_checked'></span>");
                        average_rating--;
                    }
                    count--;
                }
            } else {
                $("#rating_div").hide();
                $("#no_ratings_span").show();
                $("#review_heading").text("There's no reviews on this waterfall :(");
            }
        },
        dataType: "json"
    });
}

// Show geolocation errors
function showError(error) {

    switch (error.code) {
        case error.PERMISSION_DENIED:
            $("#error_message").text("User denied the request for Geolocation.");
            $("#error_div").show();

            break;
        case error.POSITION_UNAVAILABLE:
            $("#error_message").text("Location information is unavailable.");
            $("#error_div").show();
            break;
        case error.TIMEOUT:
            $("#error_message").text("The request to get user location timed out.");
            $("#error_div").show();

            break;
        case error.UNKNOWN_ERROR:
            $("#error_message").text("An unknown error occurred.");
            $("#error_div").show();
            break;
    }
}