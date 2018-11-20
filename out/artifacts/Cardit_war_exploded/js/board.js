$(document).ready(function() {
    $(function () {
        $(".sortable .list-contents").sortable({
            connectWith: ".sortable .list-contents"
        }).disableSelection();
    });
    $(function () {
        $(".sortable").draggable();
    });
    /* 임시 */
    $("#listName1 .add-card-button").click(function () {
        $("#listName1 .list-contents").append("<li class=\"card\">Item 1</li>");
    });
    $("#listName2 .add-card-button").click(function () {
        $("#listName2 .list-contents").append("<li class=\"card\">Item 1</li>");
    });
    $("#listName3 .add-card-button").click(function () {
        $("#listName3 .list-contents").append("<li class=\"card\">Item 1</li>");
    });
    $("#listName4 .add-card-button").click(function () {
        $("#listName4 .list-contents").append("<li class=\"card\">Item 1</li>");
    });
    $("#listName5 .add-card-button").click(function () {
        $("#listName5 .list-contents").append("<li class=\"card\">Item 1</li>");
    });
});

