
<hr>


<hr>


# Thread Safety in Libraries



必须，假定


三方库的运行环境，是多线程的




Although an application developer has control over whether an application executes with multiple threads, library developers do not. 



When developing libraries,
 you must assume that the calling application is multithreaded
 or could switch to being multithreaded at any time. 




As a result, you should always use locks for critical sections of code.




<hr>

<hr>

<hr>



<hr>

<hr>





<hr>





