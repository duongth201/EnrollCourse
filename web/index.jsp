<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>

<head>
    <title>Pshychiatrist</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/logo.png" type="image/x-icon" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
    

    <div class="main">
        <!-- header starts  -->
        <header class="header">
            <div class="logo">
                <a href="#"><img src="img/logo1.png" alt="THIENHONG"></a>
            </div>

            <nav class="navbar">
                <a href="#home">home</a>
                <a href="course">courses</a>
                <a href="#about">about</a>
                <a href="#doctors">doctors</a>
                <a href="#book">book</a>
                <a href="#review">review</a>
            </nav>

<!--            <div class="navbar" style="border: 1px solid #ca4012;padding: 1rem 1rem;">
                <a href="login.jsp" class="login" style="margin: 0 1rem;"> <i class="fas fa-user"></i>Sign in</a>
            </div>-->
            <c:if test="${sessionScope.acc == null}">

                <div class="navbar" style="border: 1px solid #ca4012;padding: 1rem 1rem;">
                    <a href="login.jsp" class="login" style="margin: 0 1rem;"> <i class="fas fa-user"></i>Sign in</a>
                </div>

            </c:if>
            <c:if test="${sessionScope.acc.role == 2}">
            <ul class="header-links pull-right" style="list-style-type: none; display: flex;">
                
                    <li>
                        <a href="profile" style="border: 1px solid #ca4012;padding: 1rem 1rem;">
                            <i class="fas fa-user"></i>${sessionScope.acc.username}
                        </a>
                    </li>
                    <li>
                        <a href="logout" class="login" style="margin: 0 1rem; color: #ca4012; border: 1px solid #ca4012;padding: 1rem 1rem;"> 
                            Log out
                        </a>
                    </li>
                
            </ul>
            </c:if>
            <div id="menu-btn" class="fas fa-bars"></div>

        </header>

        <!-- header ends -->
        <!-- home start -->
        <section class="home image" id="home">


            <div class="slidershow middle ">    

                <div class="slides">
                    <input type="radio" name="r" id="r1" checked>
                    <input type="radio" name="r" id="r2">
                    <input type="radio" name="r" id="r3">
    
                    <div class="slide s1">
                        <img src="img/slide1.jpg" alt="">
                        <div class="text-box">
                            <div class="content">
                                <h3>The right help at the right time</h3>
                                <span></span>
                                <p>With her professional experience lasting for more than 25 years, Dr Joanna Bryan is the right call for patients suffering from depression, anqiety or longing for psychiatrist assistance.</p>
                                <a href="#">FIND OUT MORE</a>
                            </div>
                            
                        </div>
                    </div>
                    <div class="slide">
                        <img src="img/slide2.jpg" alt="">
                        <div class="text-box">
                            <div class="content">
                                <h3>Happy & fulfilling
                                    marriage yet again</h3>
                                <span></span>
                                <p>Dr Joanna Bryan?s professional counselling also includes marriage counselling, advising and solving marriage problems, so you can enjoy it with your partner for a long time</p>
                                <a href="#">FIND OUT MORE</a>
                            </div>
    
                        </div>
                    </div>
                    <div class="slide">
                        <img src="img/slide3.jpg" alt="">
                        <div class="text-box">
                            <div class="content">
                                <h3>Taking, Listening and Understand You</h3>
                                <span></span>
                                <p>Sed molestie dui eget turpis sodales mollis. Suspendisse feugiat nec neque eu eleifend. Sed eu velit eget nulla feugiat suscipit consequat vel erat. Vivamus pharetra, est id placerat fringilla, ex arcu mattis dui, nec varius mauris nisl et nibh. </p>
                                <a href="#">FIND OUT MORE</a>
                            </div>
    
                        </div>
                    </div>
                </div>
    
                <div class="navigation">
                    <label for="r1" class="bar"></label>
                    <label for="r2" class="bar"></label>
                    <label for="r3" class="bar"></label>
                </div>  
            </div>
        </section>
        
        <!-- home ends -->


        <!-- services starts  -->

        <section class="services" id="services">

            <h1 class="heading">  <span>our services</span> </h1>

            <div class="box-container">

                <div class="box">
                    <i class="fas fa-notes-medical"></i>
                    <h3>free checkups</h3>
                    <p>Quisque tincidunt est elementum semper. Suspendisse a interdum lacinia eu eget dolor.</p>
                    <a href="#" class="btn"> learn more <span class="fas fa-chevron-right"></span> </a>
                </div>

                <div class="box">
                    <i class="fas fa-user-md"></i>
                    <h3>expert doctors</h3>
                    <p>Duis tempor vestibulum ullamcorper. Nam sapien purus, tempus sit, varius vel ipsum.</p>
                    <a href="#" class="btn"> learn more <span class="fas fa-chevron-right"></span> </a>
                </div>

                <div class="box">
                    <i class="fas fa-pills"></i>
                    <h3>medicines</h3>
                    <p>Mauris dui magna, consectetur nec dignissim ut, pellentesque sit amet nisl. Etiam varius at leo.</p>
                    <a href="#" class="btn"> learn more <span class="fas fa-chevron-right"></span> </a>
                </div>

                <div class="box">
                    <i class="fas fa-heartbeat"></i>
                    <h3>total care</h3>
                    <p>Morbi eget orci dictum, imperdiet felis in, finibus lorem. Nunc sed ex massa.</p>
                    <a href="#" class="btn"> learn more <span class="fas fa-chevron-right"></span> </a>
                </div>

            </div>

        </section>

        <!-- services ends -->

        <!-- aboutus starts  -->

        <section class="about" id="about">
            <h1 class="heading"> <span>about us</span> </h1>

            <div class="row">

                <div class="image col-md-6">
                    <img src="img/aboutus.png" alt="">
                </div>

                <div class="content col-md-6" ">
                    <h3>We Take Care Of Your Healthy Life</h3>
                    <p style="text-transform: none;">I wish the world could know the wonderful things that are happening on the Cosgrove hospital, who have had an injury.?</p>
                    <p style="text-transform: none;">I pray each day for all of you and thank you from the bottom of my heart.</p>
                    <a href="#" class="btn"> more <span class="fas fa-chevron-right"></span> </a>
                </div>

            </div>
        </section>

        <!-- aboutus ends -->

        <!-- doctors starts  -->

<!--        <section class="doctors" id="doctors">
            <h1 class="heading"> <span>our doctors</span> </h1>

            <div class="box-container">

                <div class="box">
                    <img src="img/doctor.jpg" alt="">
                    <h3>Jonna Byan</h3>
                    <span>expert doctor</span>
                    <div class="share">
                        <a href="#" class="fab fa-facebook-f"></a>
                        <a href="#" class="fab fa-twitter"></a>
                        <a href="#" class="fab fa-instagram"></a>
                    </div>
                </div>

                <div class="box">
                    <img src="img/doctor1.png" alt="">
                    <h3>harry giuru</h3>
                    <span>expert doctor</span>
                    <div class="share">
                        <a href="#" class="fab fa-facebook-f"></a>
                        <a href="#" class="fab fa-twitter"></a>
                        <a href="#" class="fab fa-instagram"></a>
                    </div>
                </div>

                <div class="box">
                    <img src="img/doctor2.png" alt="">
                    <h3>david back</h3>
                    <span>expert doctor</span>
                    <div class="share">
                        <a href="#" class="fab fa-facebook-f"></a>
                        <a href="#" class="fab fa-twitter"></a>
                        <a href="#" class="fab fa-instagram"></a>
                    </div>
                </div>

                <div class="box">
                    <img src="img/doctor3.jpg" alt="">
                    <h3>Charles Daniel</h3>
                    <span>expert doctor</span>
                    <div class="share">
                        <a href="#" class="fab fa-facebook-f"></a>
                        <a href="#" class="fab fa-twitter"></a>
                        <a href="#" class="fab fa-instagram"></a>
                    </div>
                </div>

            </div>
        </section>-->

        <!-- doctors ends -->

        <!-- book starts   -->
        <section class="book" id="book">
             <h1 class="heading"> <span>book now</span> </h1>    

            <div class="row">

                <div class="image">
                    <img src="img/book.jpg" alt="">
                </div>

                <form action="">
                    <h3>book appointment</h3>
                    <input type="text" placeholder="Your name" class="box">
                    <input type="number" placeholder="Your number" class="box">
                    <input type="email" placeholder="Your email" class="box">
                    <input type="date" class="box">
                    <a href="course" class="btn">Book now</a>
                </form>

            </div>
        </section>
        <!-- booking ends -->

        <!-- review starts  -->
        <section class="review" id="review">
            <h1 class="heading"> <span>feedback</span> </h1>

            <div class="box-container">

                <div class="box">
                    <img src="img/f1.jpg" alt="">
                    <h3>john will</h3>
                    <p class="text">Thank you for putting in the extra effort during this busy time at work. I understand that staying late isn't easy, but the team truly appreciates it. You are a valuable member of our team, and your positive attitude has helped us all continue to feel motivated.</p>
                </div>

                <div class="box">
                    <img src="img/f2.jpg" alt="">
                    <h3>hanna lexis</h3>
                    <p class="text">your work looks great! It's clear that you care about your work and take the time to do it correctly. I especially liked that you asked the client about their design preferences before creating their website, and I'm excited to see what you do next.</p>
                </div>

                <div class="box">
                    <img src="img/f3.jpg" alt="">
                    <h3>marry eliz</h3>
                    <p class="text">You've been doing a great job lately. You're so talented at staying flexible on any project, which helps everyone on the team. You have grown so much in your role since starting here. Thank you for your hard work, and let me know if there is anything I can do to make working here better.</p>
                </div>
                
                <div class="box">
                    <img src="img/f4.jpg" alt="">
                    <h3>vamn hilltom</h3>
                    <p class="text">I'm really happy with your determination to finish this project. I know it wasn't easy, but I knew you could do it. Your helpful attitude makes it clear that you can continue to take on new challenges and grow with the company. Thank you for your extra effort.</p>
                </div>

            </div>
        </section>
        <!-- review end  -->

        <!-- maps -->
        <section class="maps">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29672.249308562!2d105.64949600478518!3d21.623709277327524!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134dbaba9db4539%3A0x2e2ce56872a16848!2zQuG7h25oIFZp4buHbiDEkGEga2hvYSBIdXnhu4duIMSQ4bqhaSBU4bur!5e0!3m2!1svi!2s!4v1646239930271!5m2!1svi!2s" allowfullscreen="" loading="lazy"></iframe>
        </section>
        
        <!-- footer starts  -->
        <section class="footer">
            <div class="box-container">

                <div class="box">
                    <h3>about us</h3>
                    <a href="#"> <i class="fas fa-chevron-right"></i> healthy lift </a>
                    <a href="#services"> <i class="fas fa-chevron-right"></i> services </a>
                    <a href="#doctors"> <i class="fas fa-chevron-right"></i> doctor </a>
                    <a href="#review"> <i class="fas fa-chevron-right"></i> feedback </a>
                </div>

                <div class="box">
                    <h3>info</h3>
                    <a href="#"> <i class="fas fa-phone"></i> +111-222-3333 </a>
                    <a href="#"> <i class="fas fa-envelope"></i> thienhong.dt@gmail.com </a>
                    <a href="#"> <i class="fas fa-map-marker-alt"></i> dai tu, thai nguyen - 21000 </a>
                    <a href="#"> <i class="fas fa-clock"></i> 8h-20h (Monday-Sunday) </a>
                
                </div>

                <div class="box">
                    <h3>follow us</h3>
                    <a href="#"> <i class="fab fa-facebook-f"></i> facebook </a>
                    <a href="#"> <i class="fab fa-twitter"></i> twitter </a>
                    <a href="#"> <i class="fab fa-instagram"></i> instagram </a>
                    <a href="#"> <i class="fas fa-envelope"></i> gmail </a>
                </div>
        </section>
        <!-- footer ends -->

</div>
    
</body>
</html>