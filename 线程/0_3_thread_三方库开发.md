
<hr>


<hr>


# Thread Safety in Libraries



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





