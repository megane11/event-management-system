<section class="container relative overflow-hidden h-[80vh] p-4">
    <div id="carouselSlides" class="flex transition-transform duration-700 ease-in-out w-full h-full">
        <div class="w-full flex-shrink-0 relative">
            <img src="<%= request.getContextPath() %>/assets/images/slider/hero-1.jpg"
                class="w-full h-full object-cover" alt="Slide 1" />
            <div
                class="absolute inset-0 bg-secondary opacity-70 flex flex-col justify-center items-center text-white text-center px-4">
                <h2 class="text-3xl font-bold mb-2">Welcome to EMS</h2>
                <p class="text-lg">Your one-stop solution for event management in Cameroon</p>
            </div>
        </div>

        <div class="w-full flex-shrink-0 relative">
            <img src="<%= request.getContextPath() %>/assets/images/slider/hero-2.jpg"
                class="w-full h-full object-cover" alt="Slide 2" />
            <div
                class="absolute inset-0 bg-secondary opacity-70 flex flex-col justify-center items-center text-white text-center px-4">
                <h2 class="text-3xl font-bold mb-2">Organize Events Seamlessly</h2>
                <p class="text-lg">Admins and Organizers can coordinate with ease</p>
            </div>
        </div>

        <div class="w-full flex-shrink-0 relative">
            <img src="<%= request.getContextPath() %>/assets/images/slider/hero-3.jpg"
                class="w-full h-full object-cover" alt="Slide 3" />
            <div
                class="absolute inset-0 bg-secondary opacity-70 flex flex-col justify-center items-center text-white text-center px-4">
                <h2 class="text-3xl font-bold mb-2">Join & Discover Events</h2>
                <p class="text-lg">Attendees can browse, register, and participate effortlessly</p>
            </div>
        </div>
    </div>

    <button onclick="prevSlide()"
        class="absolute top-1/2 left-4 transform -translate-y-1/2 bg-black bg-opacity-50 text-white px-2 py-1 rounded-full hover:bg-opacity-70">&#10094;</button>
    <button onclick="nextSlide()"
        class="absolute top-1/2 right-4 transform -translate-y-1/2 bg-black bg-opacity-50 text-white px-2 py-1 rounded-full hover:bg-opacity-70">&#10095;</button>
</section>