function findDM() {
    var danhmuc = $('input[name="cagetory"]:checked').val();
    var sapxep = $('select[name="sort"]').val();
    $.ajax({
        method:'GET',
        url: '/a',
        data: {
            "danhmuc": danhmuc,
            "sapxep": sapxep,
        },
        success: function(response) {
            location.reload(response)
        },
        error: function() {
            alert("Error!!");
        }
    });
}