# EC 421, Spring 2020

Welcome to **Economics 421: Introduction to Econometrics** (Spring 2020) at the University of Oregon (taught by [Edward Rubin](https://edrub.in)).

For information on the course specifics, please see the [syllabus](https://raw.githack.com/edrubin/EC421S20/master/Syllabus/syllabus.pdf).

## Lecture slides

The slides below (linked by their topic) are .html files that will only work properly if you are connected to the internet. If you're going off grid, grab the PDFs (you'll miss out on gifs and interactive plots, but the equations will render correctly). I create the slides with [`xaringan`](https://github.com/yihui/xaringan/wiki) in [R](cran.r-project.org). Thanks go to [Grant McDermott](grantmcdermott.com/) for helping/pushing me to get going with `xaringan`.

1. [The introduction to "Introduction to Econometrics"](https://raw.githack.com/edrubin/EC421S20/master/notes/01-intro/01-intro.html) <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/01-intro/01-intro.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/01-intro/01-intro.Rmd)
2. [Review of key math/stat/metrics topics](https://raw.githack.com/edrubin/EC421S20/master/notes/02-review/02-review.html)<br>Density functions, deriving the OLS estimators, properties of estimators, statistical inference (standard errors, confidence intervals, hypothesis testing), simulation <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/02-review/02-review.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/02-review/02-review.Rmd)
3. [Review of key topics from EC320](https://raw.githack.com/edrubin/EC421S20/master/notes/03-review/03-review.html)<br>(the first course in our intro-to-metrics sequence) <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/03-review/03-review.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/03-review/03-review.Rmd)
4. [Heteroskedasticity: Tests and implications](https://raw.githack.com/edrubin/EC421S20/master/notes/04-heteroskedasticity/04-heteroskedasticity.html) <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/04-heteroskedasticity/04-heteroskedasticity.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/04-heteroskedasticity/04-heteroskedasticity.Rmd)
5. [Living with heteroskedasticity: Inference, WLS, and specification](https://raw.githack.com/edrubin/EC421S20/master/notes/05-heteroskedasticity/05-heteroskedasticity.html) <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/05-heteroskedasticity/05-heteroskedasticity.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/05-heteroskedasticity/05-heteroskedasticity.Rmd)
6. [Consistency and OLS in asymptopia](https://raw.githack.com/edrubin/EC421S20/master/notes/06-consistency/06-consistency.html) <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/06-consistency/06-consistency.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/06-consistency/06-consistency.Rmd)
7. [Introduction to time series](https://raw.githack.com/edrubin/EC421S20/master/notes/07-timeseries/07-time-series.html) <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/07-timeseries/07-time-series.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/07-timeseries/07-time-series.Rmd)
8. [Autocorrelated disturbances](https://raw.githack.com/edrubin/EC421S20/master/notes/08-autocorrelation/08-autocorrelation.html)<br>Implications, testing, and estimation. Also: introduction `ggplot2` and user-defined functions. <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/08-autocorrelation/08-autocorrelation.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/08-autocorrelation/08-autocorrelation.Rmd)
9. [Nonstationarity](https://raw.githack.com/edrubin/EC421S20/master/notes/09-nonstationarity/09-nonstationarity.html)<br>Introduciton, implications for OLS, testing, and estimation. Also: in-class exercise for model selection. <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/09-nonstationarity/09-nonstationarity.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/09-nonstationarity/09-nonstationarity.Rmd)
10. [Causality](https://raw.githack.com/edrubin/EC421S20/master/notes/10-causality/10-causality.html)<br>Introduction to causality and the Neymam-Rubin causal model. Also: Recap of in-class model-selection exercise. <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/10-causality/10-causality.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/10-causality/10-causality.Rmd)
11. [Instrumental Variables](https://raw.githack.com/edrubin/EC421S20/master/notes/11-iv/11-iv.html)<br>Review the Neymam-Rubin causal model; introduction to instrumental variables (IV) and two-stage least squares (2SLS). Applications to causal inference and measurement error. Venn diagrams. <br> [PDF](https://raw.githack.com/edrubin/EC421S20/master/notes/11-iv/11-iv.pdf) | [.Rmd](https://github.com/edrubin/EC421S20/blob/master/notes/11-iv/11-iv.Rmd)

## Problem sets

1. [Problem set 1: Review of OLS](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/001-assignment.pdf) | [Data](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/001-data.csv) | [Solutions](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/001-solutions.pdf)
2. [Problem set 2: Heteroskedasticity, consistency, and time series](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/002-assignment.pdf) | [Data](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/002-data.csv) | [Solutions](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/002-solutions.pdf)
3. [Problem set 3: Time series and autocorrelation](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/003-assignment.pdf) | [Data](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/003-data.csv) | [Solutions](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/003-solutions.pdf)
4. [Problem set 4: Nonstationarity, causality, and instrumental variables](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/004-assignment.pdf) | [Data](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/004-data.csv) | [Solutions](https://raw.githack.com/edrubin/EC421S20/master/problem-sets/004-solutions.pdf)

## Midterm

- [Topics](https://raw.githack.com/edrubin/EC421S20/master/midterm/midterm-prep/midterm_topics.pdf): topics that were fair game for the exam
- [Review questions](https://raw.githack.com/edrubin/EC421S20/master/midterm-prep/midterm_review.pdf): no solutions; just review questions
- Midterms from my previous classes
  - [Exam 1](https://raw.githack.com/edrubin/EC421S20/master/midterms-previous/practice_exam.pdf)
  - [Exam 1 solutions](https://raw.githack.com/edrubin/EC421S20/master/midterms-previous/practice_exam_key.pdf)
  - [Exam 1](https://raw.githack.com/edrubin/EC421S20/master/midterms-previous/practice_exam2.pdf)
  - [Exam 1 solutions](https://raw.githack.com/edrubin/EC421S20/master/midterms-previous/practice_exam2_key.pdf)
- [Midterm](https://raw.githack.com/edrubin/EC421S20/master/midterm/midterm.pdf): the actual exam
- [Solutions](https://raw.githack.com/edrubin/EC421S20/master/midterm/midterm-solutions.pdf): short solutions to the midterm

## Final

- [Review questions](https://raw.githack.com/edrubin/EC421S20/master/final/final-prep/final-review.pdf): no solutions; just review questions
- [Previous final](https://raw.githack.com/edrubin/EC421S20/master/final/final-prep/final-previous.pdf)
- [Previous final, solutions](https://raw.githack.com/edrubin/EC421S20/master/final/final-prep/final-previous-key.pdf)
- [Final](https://raw.githack.com/edrubin/EC421S20/master/final/final.pdf): the actual exam
- [Solutions](https://raw.githack.com/edrubin/EC421S20/master/final/final-solutions.pdf): solution key to the final
