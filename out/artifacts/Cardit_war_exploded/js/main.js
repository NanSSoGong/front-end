/*
$(document).ready(function() {
    $("#create-board").click(function () {
        $("#board-list").append("<a href='#'><li class='board-li'>Appended item</li></a>");
    });
});*/

$(document).ready(function() {
    $(document).ready(function() {
        var modal_board = document.getElementById('create-board-modal');

// modal 밖 클릭시 modal 종료
        $(function () {
            window.onclick = function (event) {
                if (event.target == modal_board) {
                    modal_board.style.display = "none";
                }
            };
        });
    });

});

