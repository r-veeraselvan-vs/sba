<!-- Facebook -->
<div class="login100-more" style="text-align:center; padding-top:150px;">
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '280502507259976',
                cookie: true,
                xfbml: true,
                version: 'v7.0'
            });
            FB.AppEvents.logPageView();
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s);
            js.id = id;
            js.src = "http://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        function checkLoginState() {
            FB.getLoginStatus(function (response) {
                console.log('response', response);
                console.log('signedRequest', response.authResponse.signedRequest);
                console.log('accessToken', response.authResponse.accessToken);
            });
        }

    </script>
</div>

<div style="display: flex; ">
    <fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
    <div id="my-signin2"></div>
</div>

<!-- google -->
<meta name="google-signin-client_id" content="697624168961-0bvi9u5chvn2r6o2278p0hi1rquapl25.apps.googleusercontent.com">

<script>
    function onSuccess(googleUser) {
        var profile = googleUser.getBasicProfile();
        console.log('ID: ' + profile.getId());
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log('Image URL: ' + profile.getImageUrl());
        console.log('Email: ' + profile.getEmail());
        console.log('profile', JSON.stringify(googleUser))
        console.log('access_token: ' + JSON.stringify(googleUser.wc.access_token));
    }

    function onFailure(error) {
        console.log(error);
    }

    function renderButton() {
        gapi.signin2.render('my-signin2', {
            'scope': 'profile email',
            'width': 240,
            'height': 50,
            'longtitle': true,
            'theme': 'dark',
            'onsuccess': onSuccess,
            'onfailure': onFailure
        });
    }

</script>

<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
