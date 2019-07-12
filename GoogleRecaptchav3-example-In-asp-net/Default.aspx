<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GoogleRecaptchav3_example_In_asp_net.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GoogleRecaptchav3 example In asp net</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
      <div class="login-form">
        <h2 class="text-center">GoogleRecaptchav3 Example In Asp.net</h2>       
        <div class="form-group">
            <asp:textbox runat="server" ID="UName"  type="text" class="form-control" placeholder="Username" required="required"></asp:textbox>

        </div>
        <div class="form-group">
            <asp:textbox runat="server" ID="UPass" type="password" class="form-control" placeholder="Password" required="required"></asp:textbox>

        </div>
        <div class="form-group">
            <input id="btnLogin"  value="Login" type="button" class="btn btn-primary btn-block"/>
        </div>
         
    <p class="text-center"><span id="status" class="font-weight-bold"></span></p>
         
</div>
    </form>
    <script src="http://www.google.com/recaptcha/api.js?render=ApiPublicKey"></script>
<script>
 grecaptcha.ready(function() {
 grecaptcha.execute('ApiPublicKey', {action: 'homepage'}).then(function(token) {

     $.ajax({
         type: "POST",
         url: "Default.aspx/SetToken",
         data: JSON.stringify({_token:token}),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
         success: function (response) {   
                    console.log('Passed the token successfully');
                },
         failure: function (response) {     
                    alert(response.d);
                }
            });
          });
     });
</script>
    <script src="js/main.js"></script>
</body>
</html>
