$(document).ready(function() {
    var modal_list = document.getElementById('add-list-modal');
    var modal_card = document.getElementById("add-card-modal");
    var modal_more_menu = document.getElementById('more-menu-modal');

// modal 밖 클릭시 modal 종료
    window.onclick = function (event) {
        if (event.target == modal_list) {
            modal_list.style.display = "none";
        }
        else if (event.target == modal_card) {
            modal_card.style.display = "none";
        }
        else if (event.target == modal_more_menu) {
            modal_more_menu.style.display = "none";
        }
    }
});
