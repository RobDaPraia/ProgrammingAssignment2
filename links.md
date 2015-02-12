

### Create packages links

http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/

https://support.rstudio.com/hc/en-us/articles/200486488-Developing-Packages-with-RStudio


### Unit Testing links


http://stackoverflow.com/questions/2547447/what-is-the-current-state-of-unit-testing-support-in-the-r-language

http://r-pkgs.had.co.nz/tests.html

http://www.johnmyleswhite.com/notebook/2010/08/17/unit-testing-in-r-the-bare-minimum/

http://www.johndcook.com/blog/2013/06/12/example-of-unit-testing-r-code-with-testthat/

### Format code

* RStudio Menu
Go to the Code menu and select

Reindent Lines

* use the library "formatR"

install.packages("formatR")

library(formatR)

tidy_eval("file path")
tidy_eval(""C:/Users/PC_name/Desktop/myfile.R"")