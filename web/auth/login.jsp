<!-- include the header file -->
<jsp:include page="../includes/navbar.jsp">
    <jsp:param name="title" value="Login - Welcome Back"/>
</jsp:include>
    <main class="flex items-center flex-col justify-center">
        <%-- Display success message if present --%>
        <%
            String message = request.getParameter("message");
            String error = (String) request.getAttribute("error");

            if (message != null) {
        %>
            <p class="text-green-300"><%= message %></p>
        <%
            }
            else if (error != null) {
        %>
            <p class="text-red-400"><%= error %></p>
        <%
            }
        %>
        <form action="../LoginServlet" method="post" class="m-auto md:min-w-[500px] md:max-w-[50%] lg:max-w-[50%] flex flex-col items-center h-auto gap-4 p-2 md:px-9 md:py-4">
            <h1 class="text-xl font-semibold">Login</h1>

            <div class='w-full flex flex-col relative'>
                <label for="email" class="">
                    Email 
                </label>
                <input required type='email' name='email' id="email" placeholder="Enter Email Address" class="placeholder:text-xs placeholder:text-secondary placeholder:font-normal outline-none p-2 w-full bg-transparent border-2 border-slate-300 focus:border-accent transition-all ease-in-out duration-300" />

                <span class="absolute transform right-1 top-[70%] translate-y-[-50%] size-[30px] rounded-full inline-flex items-center justify-center text-sm text-accent bg-white">
                    <i class="fas fa-envelope"></i>
                </span>
            </div>

            <div class='w-full flex flex-col relative'>
                <label for="password" class="">
                    Password
                </label>
                <input required type='password' name='password' id="password" placeholder="Enter Password" class="placeholder:text-xs placeholder:text-secondary placeholder:font-normal outline-none p-2 w-full bg-transparent border-2 border-slate-300 focus:border-accent transition-all ease-in-out duration-300" />

                <span class="absolute transform right-1 top-[70%] translate-y-[-50%] size-[30px] rounded-full inline-flex items-center justify-center text-sm text-accent bg-white" onclick="toggleVisibility(this)">
                    <i class="far fa-eye"></i>
                </span>
            </div>

            <div class="w-full flex justify-between items-center">
                <div class="flex justify-between gap-2 items-center">
                    <input type="checkbox" id="remember" name="remember" class="size-[16px] accent-black p-2">
                    <label for="remember">Remember me</label>
                </div>
                <a href="" class="text-sm text-center hover:opacity-55 hover:underline">Forgot Password?</a>
            </div>

            <!-- Submit Button -->
            <button type='submit' class='w-full bg-accent text-white text-medium text-center py-2'>
                Sign In
            </button>
            
            <p class="text-center">Don't have an account? <a href="register.jsp" class="text-accent hover:underline">Create One</a></p>
        </form>
        </main>
    </body>
</html>
