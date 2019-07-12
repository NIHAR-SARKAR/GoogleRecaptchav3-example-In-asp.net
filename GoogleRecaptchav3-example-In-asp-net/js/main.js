(function () {
    $('#btnLogin').click(function () {
        $.ajax({
            type: "POST",
            url: "Default.aspx/CaptchaVerify",
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var _response = JSON.parse(response.d);
                if (_response.score < 0.5) {
                    $('#status').text("User is not human being !");
                    $('#status').removeClass('text-info').addClass('text-danger');    
                }
                else {
                    $('#status').text("User is human being .");
                    $('#status').removeClass('text-error').addClass('text-success');
                }
            },
            failure: function (response) {
                $('#status').text("Error on Server!");
            }
        });
    });
})();