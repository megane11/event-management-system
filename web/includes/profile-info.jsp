<%@ page import="com.ems.model.User" %>
<%
    User user = (User) session.getAttribute("user");
%>

<div class="relative flex items-center justify-between w-full gap-3" onclick="displayBtn(this)" id="profile_div">
    <img src="${pageContext.request.contextPath}/uploads/<%= user.getProfileImage() %>" alt="pro"
         class="rounded-full w-[50px] h-[50px] object-cover object-center">
    <div class="text-right capitalize">
        <p><%= user.getName() %></p>
        <p class="text-[11px] text-secondary"><%= user.getRole() %></p>
    </div>
    <span class="flex items-center justify-center p-2 rounded-full hover:bg-accent-light text-sm font-light -right-1 -top-1">
        <i class="fas fa-chevron-down"></i>
    </span> 

    <div id="sub_navbar" class="absolute top-[110%] transform transform-origin-top scale-0 left-0 w-full transition-all duration-500 ease-in-out flex flex-col">
        <a href="">
            <button
                type="submit"
                class="btn flex items-center justify-center gap-2 btn-primarybtn w-full bg-white text-secondary"
            >
                <span>
                    <svg xmlns='http://www.w3.org/2000/svg' height='24px' viewBox='0 -960 960 960' width='24px' fill='#e8eaed'><path d='M520-600v-240h320v240H520ZM120-440v-400h320v400H120Zm400 320v-400h320v400H520Zm-400 0v-240h320v240H120Zm80-400h160v-240H200v240Zm400 320h160v-240H600v240Zm0-480h160v-80H600v80ZM200-200h160v-80H200v80Zm160-320Zm240-160Zm0 240ZM360-280Z'/></svg>
                </span>
                Dashboard
            </button>
        </a>
        <form action="" method="POST">
            <button
                type="submit"
                class="btn flex items-center justify-center gap-2 btn-primarybtn w-full bg-white text-secondary border border-border_clr"
            >
                <span>
                    <i class='fas fa-sign-out'></i>
                </span>
                Logout
            </button>
        </form>
    </div>
</div>

<script>
    const logoutBtn = document.getElementById('sub_navbar');
    const profileDiv = document.getElementById('profile_div');
    document.addEventListener('click',(event)=>{
        if (!profileDiv.contains(event.target) && !logoutBtn.classList.contains('scale-0')){
            logoutBtn.classList.add('scale-0')
        }
    });
    const displayBtn = (e)=>{
        logoutBtn.classList.remove('scale-0')
    };
</script>
