<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  <head>
    
    <title> Examination </title>

    <%--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/apple-touch-icon.png">
    <link rel="shortcut icon" href="assets/favicon.ico">
    <meta name="theme-color" content="#3063A0">--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Bootstrap 4 Admin Template">
    <meta name="author" content="Bootlab">

    <script type="text/javascript">
        function funSignupForm(){
            //alert("clicked");
        }
    </script>
    
    
  </head>
  <%--<body>

    <main class="auth auth-floated">
      <form action="/login" method="post" class="auth-form">
        <div class="mb-4">
          <div class="mb-3">
            <img class="rounded" src="assets/apple-touch-icon.png" alt="" height="72"> </div>
            <br/>
            <br/>
          <h1 class="h3"> Sign In </h1>
          <c:if test="${param.error ne null}">
            <div style="color: red">Invalid credentials.</div>
          </c:if>
        </div>
        <p class="text-left mb-4"> Don't have a account?
          <a href="auth-signup.html">Create One</a>
        </p>

        <div class="form-group mb-4">
          <label class="d-block text-left" for="username">Username</label>
          <input type="text" id="username" name="username" class="form-control form-control-lg" required="" autofocus=""> </div>

        <div class="form-group mb-4">
          <label class="d-block text-left" for="pwd">Password</label>
          <input type="password" id="pwd" name="password" class="form-control form-control-lg" required=""> </div>

        <div class="form-group mb-4">
          <button class="btn btn-lg btn-primary btn-block" type="submit">Sign In</button>
		   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </div>

        <div class="form-group text-center">
          <div class="custom-control custom-control-inline custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="remember-me">
            <label class="custom-control-label" for="remember-me">Keep me sign in</label>
          </div>
        </div>

        <p class="py-3">
          <a href="auth-recovery-username.html" class="link">Forgot Username?</a>
          <span class="mx-2">.</span>
          <a href="auth-recovery-password.html" class="link">Forgot Password?</a>
        </p>

      </form>

    </main>


  </body>--%>

  <body>
  <main class="main h-100 w-100">
    <div class="container h-100">
      <div class="row h-100">
        <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
          <div class="d-table-cell align-middle">

            <div class="text-center mt-4">
              <h1 class="h2">Welcome to Transport Management System</h1>
              <p class="lead">
                Sign in to your account to continue
              </p>
            </div>

            <div class="card">
              <div class="card-body">
                <div class="m-sm-4">
                  <div class="text-center">
                    <img src="img/avatar-10.png" alt="Chris Wood" class="img-fluid rounded-circle" width="132" height="132" />
                  </div>
                  <form action="/login" method="post" class="auth-form">
                    <c:if test="${param.error ne null}">
                      <div style="color: red">Invalid credentials.</div>
                    </c:if>
                    <div class="form-group">
                      <label>Username</label>
                      <input class="form-control form-control-lg" type="text" id="username" name="username" placeholder="Enter your user name" />
                    </div>
                    <div class="form-group">
                      <label>Password</label>
                      <input class="form-control form-control-lg" type="password" id="pwd" name="password" placeholder="Enter your password" />
                      <small>
                        <a href="pages-reset-password.html">Forgot password?</a>
                      </small>
                    </div>
                    <div>
                      <%--<div class="custom-control custom-checkbox align-items-center">
                        <input type="checkbox" class="custom-control-input" value="remember-me" name="remember-me">&lt;%&ndash;checked&ndash;%&gt;
                        <label class="custom-control-label text-small">Remember me next time</label>
                      </div>--%>
                      <label class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input">
                        <span class="custom-control-label">Remember me next time</span>
                      </label>
                    </div>
                    <div class="text-center mt-3">
                      <%--<a href="index.html" class="btn btn-lg btn-primary">Sign in</a>--%>

                      <button class="btn btn-lg btn-block btn-primary" type="submit">Sign In</button>

                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                      <!-- <button type="submit" class="btn btn-lg btn-primary">Sign in</button> -->
                    </div>
                  </form>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </main>
  </body>
</html>