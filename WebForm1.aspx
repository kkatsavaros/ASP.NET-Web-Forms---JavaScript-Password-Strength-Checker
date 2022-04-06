<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="_011.JavaScriptPasswordStrengthChecker.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"
                onkeyup="checkPasswordStrength()">
            </asp:TextBox>

            <asp:Label ID="lblMessage" runat="server"></asp:Label>


            <script type="text/javascript">
                function checkPasswordStrength() {
                    var passwordTextBox = document.getElementById("TextBox1");
                    var password = passwordTextBox.value;
                    var specialCharacters = "!£$%^&*_@#~?";
                    var passwordScore = 0;

                    passwordTextBox.style.color = "white";

                    // Αν υπάρχει κάποιος από τους special characters.
                    for (var i = 0; i < password.length; i++) {
                        if (specialCharacters.indexOf(password.charAt(i)) > -1) {
                            passwordScore += 20;
                            break;
                        }
                    }

                    // Contains numbers
                    if (/\d/.test(password))
                        passwordScore += 20;

                    // Contains lower case letter
                    if (/[a-z]/.test(password))
                        passwordScore += 20;

                    // Contains upper case letter
                    if (/[A-Z]/.test(password))
                        passwordScore += 20;

                    if (password.length >= 8)
                        passwordScore += 20;

                    var strength = "";
                    var backgroundColor = "red";

                    if (passwordScore >= 100) {
                        strength = "Strong";
                        backgroundColor = "green";
                    }
                    else if (passwordScore >= 80) {
                        strength = "Medium";
                        backgroundColor = "gray";
                    }
                    else if (passwordScore >= 60) {
                        strength = "Weak";
                        backgroundColor = "maroon";
                    }
                    else {
                        strength = "Very Weak";
                        backgroundColor = "red";
                    }

                    document.getElementById("lblMessage").innerHTML = strength;

                    passwordTextBox.style.backgroundColor = backgroundColor;
                }
            </script>


        </div>
    </form>
</body>
</html>
