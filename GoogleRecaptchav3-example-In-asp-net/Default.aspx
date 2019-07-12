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
            <asp:Button ID="btnLogin" runat="server" Text="Login" type="submit" class="btn btn-primary btn-block" OnClick="btnLogin_Click"/>
        </div>
         
    <p class="text-center"><asp:Label ID="Error" runat="server"></asp:Label></p>
         
</div>
    </form>
    <script src="http://www.google.com/recaptcha/api.js?render=recaptchaSiteKey"></script>
<script>
 grecaptcha.ready(function() {
 grecaptcha.execute('recaptchaSiteKey', {action: 'homepage'}).then(function(token) {

            $.ajax({
                type: "POST",
                url: "Default.aspx/CaptchaVerify",
                data: '',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    self.videos = JSON.parse(response.d);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
          });
     });
</script>
</body>
</html>
