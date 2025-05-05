<!-- include the header file -->
<jsp:include page="../includes/navbar.jsp">
    <jsp:param name="title" value="Create Account - Join us today"/>
</jsp:include>
    <main class="flex items-center flex-col justify-center mt-5">

        <%-- Display error message if present --%>
        <%
            String error = request.getParameter("error");
            if (error != null) {
        %>
            <p class="text-red-400"><%= error %></p>
        <%
            }
        %>
        <form method='POST' action='../RegisterServlet' class='m-auto flex flex-col min-w-[400px] gap-5 p-2' enctype="multipart/form-data">
            <h1 class="text-center text-xl w-full font-semibold">
                Create an Account Today !!
            </h1>
            
            <div class="flex flex-col gap-3 relative">
                <!-- Image uploader -->
                <div class="absolute left-[110%] top-0 h-[200px] w-1/2 flexbox bg-cover bg-no-repeat bg-center border border-accent">
                    <label for="input-file" id="drop-area" class="w-full h-full flexbox flex-col">
                        <input type="file" accept="image/*" name="profile_image" id="input-file" hidden>
                        <div class="border h-full flex flex-col gap-2 items-center justify-center w-full border-2-dashed border-accent bg-pending-bg rounded-sm bg-no-repeat bg-cover bg-center" id="img-view">
                            <i class="fas fa-cloud-upload text-accent text-3xl font-semibold"></i>
                            <p class="text-center text-sm text-secondary">Drop or click here <br/> to upload Profile Image</p>
                        </div>
                    </label>
                </div>

                <!-- Other inputs -->

                <div class='w-full flex flex-col relative'>
                    <label for="name" class="">
                        Full Name
                    </label>
                    <input required type='text' id="name" name='name' placeholder="Enter full name" class="placeholder:text-xs placeholder:text-secondary placeholder:font-normal outline-none p-2 w-full bg-transparent border-2 border-slate-300 focus:border-accent transition-all ease-in-out duration-300" />
                </div>

                <div class='w-full flex flex-col relative'>
                    <label for="email" class="">
                        Email 
                    </label>
                    <input required type='email' name='email' id="email" placeholder="Enter Email Address" class="placeholder:text-xs placeholder:text-secondary placeholder:font-normal outline-none p-2 w-full bg-transparent border-2 border-slate-300 focus:border-accent transition-all ease-in-out duration-300" />
                </div>

                <!-- Gender and role -->
                <div class="flex flex-col sm:flex-row gap-8 w-full items-center justify-between">
                    <div class="w-full flex flex-col">
                        <label for="role">Role</label>
                        <select class="border-2 border-slate-300 outline-none p-2 focus:border-accent transition-all ease-in-out duration-600" name="role" id="role">
                            <option value="organizer">Organizer</option>
                            <option value="attendee" selected>Attendee</option>
                        </select>
                    </div>
                    <div class="w-full flex flex-col">
                        <label for="gender">Gender</label>
                        <select class="border-2 border-slate-300 outline-none p-2 focus:border-accent transition-all ease-in-out duration-600" name="gender" id="gender">
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </div>
                </div>
                
                <div class='w-full flex flex-col relative'>
                    <label for="password" class="">
                        Password
                    </label>
                    <input required type='password' name='password' id="password" placeholder="Enter Password" class="placeholder:text-xs placeholder:text-secondary placeholder:font-normal outline-none p-2 w-full bg-transparent border-2 border-slate-300 focus:border-accent transition-all ease-in-out duration-300" />

                    <span class="absolute transform right-1 top-[70%] translate-y-[-50%] size-[30px] rounded-full inline-flexbox text-sm text-accent bg-white" onclick="toggleVisibility(this)">
                        <i class="far fa-eye"></i>
                    </span>
                </div>

                <div class='w-full flex flex-col relative'>
                    <label for="cpassword" class="">
                        Confirm Password
                    </label>
                    <input required type='password' name='cpassword' id="cpassword" placeholder="Confirm Password" class="placeholder:text-xs placeholder:text-secondary placeholder:font-normal outline-none p-2 w-full bg-transparent border-2 border-slate-300 focus:border-accent transition-all ease-in-out duration-300" />

                    <span class="absolute transform right-1 top-[70%] translate-y-[-50%] size-[30px] rounded-full inline-flexbox text-sm text-accent bg-white" onclick="toggleVisibility(this)">
                        <i class="far fa-eye"></i>
                    </span>
                </div>
            </div>

            <!-- submit button -->
            <button type='submit' class='w-full bg-accent text-white text-medium text-center py-2'>
                Create Account
            </button>
            <p class="text-sm text-secondary">Already have an account? <a href="login.jsp" class="text-accent">Login</a></p>
        </form>
    </main>
    </body>
</html>
